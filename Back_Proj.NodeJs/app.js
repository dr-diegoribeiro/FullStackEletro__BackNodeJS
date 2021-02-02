const express = require('express');
const app = express();
const cors = require('cors');

app.use(cors());

// mostrando para o express que vamos usar dados json
app.use(express.json());

app.get('/', (req, res, next) => {
    const mysql = require('mysql');
    const connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'fullstack_ultimate'
    });

connection.query("SELECT * FROM produtos", (error, result)=>{
    if(error){
        console.log(error)
    }
    res.json(result);
    })  
})

app.post('/mensagem', (req, res) =>{
    const mysqlPedido = require('mysql');
    const conexao = mysqlPedido.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'fullstack_ultimate'
    });
    
    let post = [];
   
    post.push({
        nome: req.body.nome,
        email: req.body.email,
        motivo: req.body.motivo,
        mensagem: req.body.mensagem
    });

conexao.query('INSERT INTO comentarios SET ?', post, ()=>{
    post = [];
    return res.json({message: "Dados enviados com sucesso"})
})

})

app.listen(3005, () => {
    console.log('Servidor 3005 subiu!');
})