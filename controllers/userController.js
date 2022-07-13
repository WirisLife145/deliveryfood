const User = require('../models/user')

module.exports = {
    register(req, res){
        const user = req.body; // Capoturar los datos que ingrese el cluiente
        User.create(user, (err, data) => {
            if (err){
                return res.status(501).json({
                    succes: false,
                    message: 'Hubo un error con el registro del usuario',
                    error: err
                })
            }

            return res.status(201).json({
                succes: true,
                message: "El registro se realizó correctamente",
                data: data //El ID del nuevo usuario se registró
            })
        })
    }
}