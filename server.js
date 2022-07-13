//Declaración de variables
const express = require('express'); //lo tomamos del paquete .json
const app = express();
const http = require('http'); // se necesita descargar con npm i http
const server = http.createServer(app);
const logger = require('morgan');
const cors = require('cors');

//Importar rutas
const userRoutes = require('./routes/userRoutes');

const port = process.env.PORT || 3000;

app.use(logger('dev')); //desarrollador
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));
app.use(cors());

app.disable('x-powered-by'); //seguridad que se le agrega al servidor

app.set('port', port);

//llamado de las rutas
userRoutes(app);

server.listen(3000, '192.168.100.95' || 'localhost', function(){
    console.log('Aplicación de NODEJS '+ process.pid + ' Iniciada')
});

app.get('/', (req, res) => { //Get obtiene datos
    res.send('Ruta raíz del Backend');
});

app.get('/test', (req, res) => {
    res.send('Esta es la ruta test');
});

//Error handler

app.use((err, req, res, next) => {
    console.log(err);
    res.status(err.status || 500).send(err.stack);
});

// es una respuesta exitosa
//404 url no existe
// 500 error del servidor