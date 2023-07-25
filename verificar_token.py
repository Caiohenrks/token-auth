from flask import Flask, request
import jwt

app = Flask(__name__)

@app.route('/verificar_token', methods=['POST'])
def verificar_token():
    data = request.get_json()
    token = data['token']

    try:
        # Verificar se o token é válido e não expirou
        payload = jwt.decode(token, 'chave_secreta', algorithms=['HS256'])
        return '\033[32mAcesso permitido\033[0m\n'
    except jwt.ExpiredSignatureError:
        return '\033[31mAcesso negado: Token expirou\033[0m\n', 401
    except jwt.InvalidTokenError:
        return '\033[31mAcesso negado: Token inválido\033[0m\n', 401

if __name__ == '__main__':
    app.run(host='0.0.0.0')
    

