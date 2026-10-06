from http.server import HTTPServer, BaseHTTPRequestHandler
import json
from datetime import datetime

class ServerHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.send_response(200)
            self.send_header('Content-type', 'text/plain')
            self.end_headers()
            response = "Servidor funcionando"
            self.wfile.write(response.encode('utf-8'))
        else:
            self.send_response(404)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            response = json.dumps({"error": "Ruta no encontrada"})
            self.wfile.write(response.encode('utf-8'))

    def log_message(self, format, *args):
        print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] {format%args}")

if __name__ == '__main__':
    server_address = ('0.0.0.0', 8000)
    httpd = HTTPServer(server_address, ServerHandler)
    print(f"Servidor escuchando en http://0.0.0.0:8000")
    httpd.serve_forever()
