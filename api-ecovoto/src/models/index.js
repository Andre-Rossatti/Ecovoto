const { Sequelize } = require('sequelize'); // importando o sequelize que interage com o bd
const config = { // salvando as informações do bd em uma constante
    database: 'ecovoto',
    username: 'root',
    password: '',
    host: '127.0.0.1',
    dialect: 'mysql'
};

const sequelize = new Sequelize(config.database, config.username, config.password, {
    host: config.host,
    dialect: config.dialect
}); // Criando conexão com o bd

const db = {}; // Inicializa um objeto vazio db, que será usado para agrupar todas as entidades relacionadas ao Sequelize


// Anexa a classe Sequelize e a instância sequelize ao objeto db. Isso é útil para ter acesso à funcionalidade do Sequelize e à conexão atual em diferentes partes do aplicativo.
db.Sequelize = Sequelize;
db.sequelize = sequelize;


// Importar modelos
db.User = require('./user')(sequelize, Sequelize);


// exporta o objeto db, que agora contém a instância sequelize
module.exports = db;
