from flask import session, redirect, url_for, render_template, request
from . import main
from .forms import LoginForm, AdminLoginForm
import os
import csv


@main.route('/', methods=['GET', 'POST'])
def index():
    """"Login form to enter a room."""
    form = LoginForm()
    if form.validate_on_submit():
        session['name'] = form.name.data
        return redirect(url_for('.chat'))
    elif request.method == 'GET':
        form.name.data = session.get('name', '')
    return render_template('index.html', form=form)


@main.route('/chat')
def chat():
    """Chat room. The user's name and room must be stored in
    the session."""
    name = session.get('name', '')
    if name == '':
        return redirect(url_for('.index'))
    return render_template('chat.html', name=name)

@main.route('/admin_index', methods=['GET', 'POST'])
def admin_index():
    """Loagin admin"""
    form = AdminLoginForm()
    if form.validate_on_submit():
        session['name'] = form.name.data
        return redirect( url_for('.admin'))
    elif request.method == 'GET':
        form.name.data = session.get('name', '')
    return render_template('admin_index.html', form=form)

@main.route('/admin')
def admin():
    """ Admin page, definite answer """
    name = session.get('name', '')
    if name == '':
        return redirect(url_for('.admin_index'))
    return render_template('admin.html', name=name)
