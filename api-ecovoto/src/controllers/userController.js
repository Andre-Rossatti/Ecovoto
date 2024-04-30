const { User } = require('../models'); // Esta linha importa o modelo User 

const createUser = async (req, res) => { //Define a função createUser que é assíncrona, indicado pelo async, e recebe dois parâmetros: req (o objeto de requisição) e 
    try {
        const user = await User.create(req.body); //Dentro do bloco try, esta linha tenta criar um novo usuário no banco de dados. O método User.create() é uma operação do ORM
        return res.status(201).send(user); // Se o usuário for criado com sucesso, a função responde com um status HTTP 201, que indica que um recurso foi criado com sucesso. 
    } catch (error) {
        return res.status(400).send(error); // Caso retorne erro do BD irá cair aqui
    }
}

module.exports = { createUser };
