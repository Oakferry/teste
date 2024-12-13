
<%@ page import="config.Conexao"%>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="br" data-bs-theme="info">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Sistema</title>
        
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
          <link rel="stylesheet" href="style.css"/>
    </head>
    
    <body class="d-flex align-items-center py-4 bg-body-tertiary">
    
        <main class="w-100 m-auto form-container w-2 bg-body-tertiary">
            <form>
                <img src="apple-big-logo (2).png" class="img heigth='57' width='72' d-flex justify-content-center"/>
                <h1 class="h3 mb-3 fw-normal">Faça o login</h1>
                <div>
                    <input type="text" name="txtlogin" class="form-control" id="floatingInput" placeholder="Login"> <!-- componete padrão do bootstrap que gera estilo -->
                    <label for="floatingInput"></label>
                </div>
                <div>
                    <input type="password" name="txtsenha" class="form-control" id="floatingInput" placeholder="Senha"> <!-- componete padrão do bootstrap que gera estilo -->
                    <label for="floatingInput"></label>
                </div>
                <div class="form-check text-start my-3">
                    <input type="checkbox" name="" class="form-check-input" id="flexCheckDefault"> <!-- Para se lembrar da senha -->
                    <label class="form-check-label" for="flexCheckDefault">Lembrar-me</label>
                </div>
               
                <button class="btn btn-primary w-100 py-2" type="submit">Entrar</button>

                    <% 
                String loginVar = request.getParameter("txtlogin");
                String senhaVar = request.getParameter("txtsenha");

                Statement st = null; //para executar a consulta. Statement permite executar o SQL(insert, select...)
                ResultSet rs = null; // armazenar a consulta

                //Criar conexao com o Banco de Dados.
                st = new Conexao().conectar().createStatement();

                //Executa a consulta na tabela usuário, conforme login e senha informado
                rs = st.executeQuery("SELECT * FROM usuario WHERE login='"+loginVar+"' AND senha='"+senhaVar+"'");

                int i = 0; //inicializar o contador que verifica a qtd de registros
                String nomeUsuario = null; //variavel que vai receber o nome do usuário logado

                //verifica se há pelo menos um registro
                if (rs.next()){
                    i=1; //indica que encontrou pelo menos um usuário
                    nomeUsuario = rs.getString(2); //Captura o nome do usuário encontrado
                }

                //verifica se os campos estão vazios
                if(loginVar == null || senhaVar == null){
                    out.print("<p class= 'dados'> Preenha os dados </p>");          
                }

                //verifica se retornou algum usuário
                else if (i>0){
                    //armazenar o nome do usuario em uma sessão
                    session.setAttribute("nomeUsuario",nomeUsuario);
                    //redirecionar para a página painelAdm.jsp
                    response.sendRedirect("painelAdm.jsp");
                }

                else{
                     //Não localizou o usuário informado
                     out.print("Dados incorretos");

                }

            %>         
            </form>
        </main>
        
     
        
    </body>
</html>
