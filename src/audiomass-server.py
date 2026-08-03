import http.server
import socketserver
PORT = 5055
Handler = http.server.SimpleHTTPRequestHandler
# threaded so browser keep-alive/preconnect sockets can't block other requests,
# reuse_address so the port frees up immediately after the server is closed
socketserver.ThreadingTCPServer.allow_reuse_address = True
socketserver.ThreadingTCPServer.daemon_threads = True
httpd = socketserver.ThreadingTCPServer(("", PORT), Handler)
print("serving at port", PORT)
httpd.serve_forever()
