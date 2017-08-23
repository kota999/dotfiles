import os
from flask import session
from flask_socketio import emit, join_room, leave_room
from .. import socketio
import time
import csv


@socketio.on('joined', namespace = '/chat')
def joined(message):
    """Sent by clients when they enter a room.
    A status message is broadcast to all people in the room."""
    room = session.get('room')
    join_room(room)
    emit('status', {'msg': session.get('name') + ' has entered Trip Q - A.'}, room = room)

@socketio.on('text', namespace = '/chat')
def text(message):
    """Sent by a client when the user entered a new message.
    The message is sent to all people in the room."""
    room = session.get('room')
    emit('message', {'msg': session.get('name') + ' > ' + message['msg']}, room=room)

def pick_answer(msg1):
    if os.path.exists("./answer.csv"):
        with open("./answer.csv", "r") as f:
            reader = csv.reader(f)
            for row in reader:
                print(msg1)
                if row[0] == msg1:
                    return row[1]
    return "Sorry, please input again..."

@socketio.on('answer', namespace = '/chat')
def text(message):
    """Sent by a client when the user entered a new message.
    The message is sent to all people in the room."""
    time.sleep(1)
    room = session.get('room')
    msg = pick_answer(message["msg"])
    emit('message', {'msg': "Trip Bot" + ' > ' + msg}, room = room)

@socketio.on('exit', namespace = '/chat')
def left(message):
    """Sent by clients when they leave a room.
    A status message is broadcast to all people in the room."""
    room = session.get('room')
    leave_room(room)
    emit('status', {'msg': session.get('name') + ' has exited.'}, room=room)

