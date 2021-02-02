import './Contato.css';
import React from 'react';

export default function Contato(){
    const [form, setForm] = React.useState({

        nome: "",
        email: "",
        motivo: "",
        mensagem: ""
    })

    const [response, setResponse] = React.useState(null)

    function handleChange({target}){
        const {id, value} = target
        setForm({...form, [id]: value})
        console.log({[id]:value});
    }

    function handleSubmit(event){
        fetch('http://localhost:3005/mensagem', {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            //transforma em json para mandar pra api e api mandar pro banco
            body: JSON.stringify(form)
        }).then((res) =>{
            setResponse(res);
        })
    }


    return(
        <div className="container mt-4 contato">
        <h3 className="text-center display-4">Envie sua mensagem!!</h3>
        <form onSubmit={handleSubmit}> 
            <div className="form-group">
                <label for="text">Nome</label>
                <input type="text" className="form-control" name="nome" id="nome" value={form.nome} onChange={handleChange}></input>
            </div>
            <div className="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" name="email" id="email" value={form.email} onChange={handleChange}></input>
            </div>
            <div className="form-group">
                <label>Digite sua mensagem</label>
                <textarea class="form-control" name="mensagem" id="mensagem" value={form.mensagem} onChange={handleChange}/>
                <button className="btn btn-primary mt-3" type="submit">Enviar</button>
            </div>
        </form>


        <div className="redesfooter backgroud:red">
            <p className="text-center display-4">siga-nos nas redes </p>
            <div className="d-flex text-center mt-5">  
            <div className="redes">
                <div className="hover">
                    <img src={require('../Img/redesocial/face.png').default} alt="" />
                    <img src={require('../Img/redesocial/instagram.png').default} alt=""/>
                    <img src={require('../Img/redesocial/twitter.png').default} alt=""/>
                    <img src={require('../Img/redesocial/linkedin.png').default} alt=""/>
                    </div> 
                    <br></br>
                    <div className="contato">
                    <a href="mailto:contato@fullstackeletro.com.br">
                    <img width="90" src={require('../Img/redesocial/email.png').default} alt=""/> </a>
                    <a href="http://api.whatsapp.com/send?1=pt_BR&phone=5511962441455" target="_blank">
                    <img width="80" src={require('../Img/redesocial/whatsapp.png').default} alt="" /> </a>
                    </div>
                </div>
            </div>
        </div>
        </div>

        
    );
}