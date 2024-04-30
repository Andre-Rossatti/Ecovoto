const express = require('express'); // Carregando o Express
require('dotenv').config(); // chamando as variaveis de ambiente do .env
const { sequelize } = require('./models'); // importando o sequelize que interage com o bd

const app = express(); // Cria uma instância do aplicativo Express.
app.use(express.json()); //Adiciona um middleware ao Express que analisa o corpo das requisições JSON


// Importação de rotas
const userRoutes = require('./routes/users');
app.use('/api/users', userRoutes);
// Fim importação

const PORT = process.env.PORT || 3000; // Define a porta na qual o servidor será iniciado

sequelize.sync().then(() => { //Sincroniza todos os modelos definidos com o banco de dados. 
    console.log('Conexão com o banco de dados e sincronização de modelos bem-sucedidas!');
    app.listen(PORT, () => {
        console.log(`Server running on port ${PORT}`);
    });
}).catch(err => {
    console.error('Unable to connect to the database:', err);
});