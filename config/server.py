from http.server import HTTPServer, SimpleHTTPRequestHandler, test
import socketserver
from urllib.parse import urlparse
from urllib.parse import parse_qs
import threading, os

class MyHttpRequestHandler(SimpleHTTPRequestHandler):
    def end_headers (self):
        self.send_header('Access-Control-Allow-Origin', '*')
        SimpleHTTPRequestHandler.end_headers(self)

    def do_GET(self):

        self.send_response(200)

        self.send_header("Content-type", "text/html")

        self.end_headers()
        with open("index.html", 'r') as content:
            html = content.read()
        self.wfile.write(bytes(html, "utf8"))

def create_server():
    handler_object = MyHttpRequestHandler
    my_server = socketserver.TCPServer(("", port), handler_object)

    my_server.serve_forever()

#if __name__ == "__main__":
port = 80
try:
    threading.Thread(target=create_server).start()
except Exception as e:
    print(e)
# except KeyboardInterrupt:
#     os.exec
finally:
    print(f"serving at port: {port}")
