from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
from flask_mail import Mail, Message
import json
import datetime
import os
import math

with open('config.json', 'r') as c:
    params=json.load(c)["params"]

app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail_user'],
    MAIL_PASSWORD = params['gmail_pass']
)
mail = Mail(app)

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

if(params['local_server']):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_url']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_url']
    
db = SQLAlchemy(app)


class Contacts(db.Model):
    '''Contact database class is this'''
    Sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80),  nullable=False)
    phone_num = db.Column(db.String(12),  nullable=True)
    msg = db.Column(db.String(120), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    date = db.Column(db.String(12),  nullable=True)

class Posts(db.Model):
    '''Posts database class is this'''
    Sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80),  nullable=True)
    slug = db.Column(db.String(21),  nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12),  nullable=False)
    img_file = db.Column(db.String(20), nullable=False)


@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    page = (request.args.get('page'))
    if(not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+int(params['no_of_posts'])]
    '''previous and newer buttons handling
    1. user on first page'''
    if(page==1):
        prev = "#"
        next = "/?page=" + str(page + 1)
    # 3. user in last page
    elif(page==last):
        prev = "/?page=" + str(page - 1)
        next = "#"
    # 2. user in middle page
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html', params=params, posts=posts, prev=prev, next=next)

@app.route("/about")
def about():
    return render_template('about.html', params=params)

@app.route("/dashboard", methods=['GET','POST'])
def dashboard():
    if 'user' in session and session['user'] == params['admin_name']:
        posts = Posts.query.filter_by().all()
        return render_template('dashboard.html', params=params, posts=posts)

    if(request.method=='POST'):
        username = request.form.get('uname')
        userpass = request.form.get('password')

        if((username == params['admin_name']) and (userpass == params['admin_pass'])):
            session['user'] = username
            posts = Posts.query.filter_by().all()
            return render_template('dashboard.html', params=params, posts=posts)


    return render_template('login.html', params=params)

@app.route("/edit/<string:Sno>", methods=['GET','POST'])
def edit_post(Sno):
    if 'user' in session and session['user'] == params['admin_name']:
        if (request.method=='POST'):
            po_title = request.form.get('title')
            po_slug = request.form.get('slug')
            po_content = request.form.get('content')
            po_date = datetime.datetime.now()
            try:
                f = request.files['file1']
                f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
                po_img_name = f.filename
            except Exception:
                pass



            update_old_post= Posts.query.filter_by(Sno=Sno).first()
            update_old_post.title = po_title
            update_old_post.slug = po_slug
            update_old_post.content = po_content
            try:
                update_old_post.img_file = po_img_name
            except Exception:
                pass
            update_old_post.date = po_date
            db.session.commit()
            return redirect('/edit/'+Sno)

    post = Posts.query.filter_by(Sno=Sno).first()
    return render_template('edit.html', params=params, post=post)

@app.route("/add", methods=['GET','POST'])
def add_post():
    if 'user' in session and session['user'] == params['admin_name']:
        if (request.method=='POST'):
            ad_title = request.form.get('title')
            ad_slug = request.form.get('slug')
            ad_content = request.form.get('content')
            ad_date = datetime.datetime.now()
            f = request.files['file1']
            ad_img_name = f.filename
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            new_post = Posts(title=ad_title, slug=ad_slug, content=ad_content, img_file=ad_img_name, date=ad_date)
            db.session.add(new_post)
            db.session.commit()

        return render_template('add_post.html', params=params)

@app.route("/post/<string:post_slug>", methods=['GET'])
def diff_post(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post = post)

@app.route("/contact", methods=['GET','POST'])
def contact():
    if(request.method=='POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, email=email, phone_num=phone, msg=message, date=datetime.datetime.now())
        db.session.add(entry)
        db.session.commit()
        msg = Message('New message from ' + name,
                            sender=email,
                            recipients = [params['gmail_user']],
                            body = message + "\nPhone:- " + phone + "\nemail: " + email
                      )
        mail.send(msg)

    return render_template('contact.html', params=params)



@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/delete/<string:Sno>", methods=['GET','POST'])
def delete_post(Sno):
    if 'user' in session and session['user'] == params['admin_name']:
        post=Posts.query.filter_by(Sno=Sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')

app.run()
