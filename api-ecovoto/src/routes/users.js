const express = require('express');
const router = express.Router(); //  Importa o framework Express, necessário para criar roteadores.
const jwt = require('jsonwebtoken'); //mporta a biblioteca jsonwebtoken, usada para criar e verificar tokens JWT.
const { User } = require('../models'); // Importa o modelo User que define a estrutura e os métodos disponíveis para a entidade usuário no banco de dados.

router.post('/login', async (req, res) => { // Define uma rota POST no caminho /login. Essa rota é usada para autenticar usuários quando tentam acessar o sistema.

  const { email, senha } = req.body; //Extrai email e senha do corpo da requisição, que são enviados pelo cliente.

  try {
      const user = await User.findOne({ where: { email } }); //await User.findOne({ where: { email } });: Busca no banco de dados por um usuário com o email fornecido.
      if (!user) {
          return res.status(404).send({ error: 'Usuário não encontrado' }); // verifica se o usuário existe; se não existir, retorna um erro 404.
      }

      // Como a senha não é criptografada, comparamos diretamente
      if (senha !== user.senha) {
          return res.status(401).send({ error: 'Senha inválida' }); // verifica se a senha fornecida combina com a senha armazenada; em caso negativo, retorna um erro 401. (
      }

      const token = jwt.sign({ id: user.id }, 'seu_secret', { expiresIn: '1h' });
      res.send({ user, token }); //Envia uma resposta contendo o objeto do usuário e o token gerado.
  } catch (error) {
      console.error('Erro de servidor:', error);
      res.status(500).send({ error: 'Erro no servidor' });
  }
});

module.exports = router; //Exporta o roteador configurado para que possa ser usado em outras partes do aplicativo
