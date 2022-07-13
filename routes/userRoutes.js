const userController = require ('../controllers/userController')

module.exports = (app) =>{
    //GET -> Obtener datos
    //POST -> Almacenar Datos
    //PUT -> Actualizar Datos
    //DELETE -> Eliminar datos

    app.post('/api/users/create', userController.register);
}
