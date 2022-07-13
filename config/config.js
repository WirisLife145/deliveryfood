const mysql = require('mysql');

    const db = mysql.createConnection({ //Colocamos los datos necesarios para acceder a nuestra base de datos
        host: 'localhost',
        user: 'root',
        password: 'password',
        database: 'delivery'
    });


    db.connect(function(err){
        if(err) throw err;
        console.log('DATABASE CONNECTED!');
    });

    module.exports = db;