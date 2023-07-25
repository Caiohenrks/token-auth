from flask import Flask, request
import hashlib
import time
import jwt

app = Flask(__name__)

@app.route('/gerar_token', methods=['POST'])
def gerar_token():
    data = request.get_json()
    if data['usuario'] == 'admin' and data['senha'] == '12345':
        # Gerar um token com expiração em 15 segundos usando SHA256
        token = jwt.encode({'user': 'admin', 'exp': time.time() + 15}, 'chave_secreta', algorithm='HS256')
        return token
    else:
        return 'Credenciais inválidas\n', 401

if __name__ == '__main__':
    app.run(host='0.0.0.0')

