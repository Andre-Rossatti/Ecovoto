module.exports = (sequelize, DataTypes) => {
  const User = sequelize.define('User', {
      nome: { // Campo que armazena o nome do usuário. É do tipo STRING e não pode ser nulo 
          type: DataTypes.STRING, 
          allowNull: false
      },
      email: { //  Define nome da tabela no banco de dados como 'usuarios',
          type: DataTypes.STRING,
          allowNull: false
      },
      senha: { // Campo para a senha do usuário, com as mesmas características dos anteriores.
          type: DataTypes.STRING,
          allowNull: false
      }
     
  }, {
      tableName: 'usuarios', // Define explicitamente o nome da tabela no banco de dados como 'usuarios'
      timestamps: true, // Habilita a criação automática de campos createdAt e updatedAt 
      freezeTableName: true // : Impede que o Sequelize pluralize o nome da tabela baseado em convenções internas,
  });

  return User;
};
