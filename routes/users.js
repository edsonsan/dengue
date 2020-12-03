var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.render('usuario/index',{title:'Home'});
});

/* GET denuncia listing. */
router.get('/denuncia', function(req, res, next) {
  res.render('usuario/denuncia',{title:'Denuncia'});
});

/* GET denuncia-selecionada listing. */
router.get('/denuncia/:id', function(req, res, next) {
  res.render('usuario/denuncia-selecionada',{title:'Denuncia Selecionada'});
});

/* GET usuario listing. */
router.get('/usuario', function(req, res, next) {
  res.render('usuario/usuario',{title:'Cadastro Usuário'});
});


module.exports = router;