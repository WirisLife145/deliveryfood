const JwtStrategy = require('passport-jwt').Strategy; //importamos librerías descargadas
const ExtractJwt = require('passport-jwt').ExtractJwt;
const keys = require('./keys')