import socket
import threading

sock = None
thread = None

server = 'irc.chat.twitch.tv'
port = 6667
nickname = ''
token = ''
channel = ''
is_listening = False
is_connected = False

def listen_for_message():
    print(is_listening)
    print(is_connected)
    while is_connected and is_listening:
        print("Twitch Socket Waiting For Message")
        resp = sock.recv(2048).decode('utf-8')

        if len(resp) == 0:
            print("No length")

        if resp.startswith('PING'):
            sock.send("PONG\n".encode('utf-8'))
        elif len(resp) > 0:
            print(resp)
            scribe.send("TwitchIntegration:NewMessage:" + resp)

def send_twitch_message(message):
    twitchMessage = "PRIVMSG " + channel + " :" + message + "\r\n"
    print("Outgoing Message: " + twitchMessage)
    
    #sock.sendto(message.encode('utf-8'),(channel, port))    
    sock.send(twitchMessage.encode('utf-8'))

def set_username(message):
    global nickname
    nickname = message

def set_channel(message):
    global channel
    channel = message

def set_token(message):
    global token
    token = message

def start_listener(message):
    global is_connected
    global is_listening
    global thread
    global sock

    if sock is None:
        sock = socket.socket()

    sock.connect((server, port))

    sock.send(f"PASS {token}\n".encode('utf-8'))
    sock.send(f"NICK {nickname}\n".encode('utf-8'))
    sock.send(f"JOIN {channel}\n".encode('utf-8'))
    
    is_connected = True
    is_listening = True
        
    thread = threading.Thread(target=listen_for_message, args=())
    thread.start()

def stop_listener(message):
    global sock
    print("Stop")
    if sock is not None:
        is_connected = False
        is_listening = False
        sock.shutdown(socket.SHUT_RDWR)
        sock.close()
        sock = socket.socket()

def load( ):
    scribe.add_hook( send_twitch_message, "TwitchSocket:SendMessage:", __name__ )
    scribe.add_hook( set_username, "TwitchSocket:SetUsername:", __name__ )
    scribe.add_hook( set_channel, "TwitchSocket:SetChannel:", __name__ )
    scribe.add_hook( set_token, "TwitchSocket:SetToken:", __name__ )
    scribe.add_hook( start_listener, "TwitchSocket:Start", __name__ )
    scribe.add_hook( stop_listener, "TwitchSocket:Stop", __name__ )
    
