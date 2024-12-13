<%-- 
    Document   : adicionarUsuario
    Created on : 7 de nov. de 2024, 14:44:29
    Author     : caio.9181
--%>


<%@ page import="config.Conexao"%>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="br" data-bs-theme="info">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Usuário</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <!-- Cabeçalho  -->
        <header>
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">SENAC</a>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarText">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Usuarios</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Cursos</a>
                            </li>

                        </ul>
                        <span class="navbar-text">

                            <%
                                //capitura o nome do usuario pela sessão
                                String nomeUsuario = (String) session.getAttribute("nomeUsuario");

                                //exibi o usuário
                                out.print("Olá " + nomeUsuario);
                                // se tentar entrar pelo link sem ter logado
                                if (nomeUsuario == null) {
                                    response.sendRedirect("index.jsp");
                                }
                            %>
                            <a href="logout.jsp"><img src="img/seta1.png" alt="alt"/> Sair</a>
                        </span>
                    </div>
                </div>
            </nav>
        </header>
         

        <main>
            <h1>Cadastro do usuário</h1>
            <form action="" method="post">
                <label>Nome: </label>
                <input type="text" name="txtNome">
                <br><br> <!-- Tirar e mecher com o bootstrap -->
                <label>Login: </label>
                <input type="text" name="txtLogin">
                <br><br> <!-- Tirar e mecher com o bootstrap -->
                <label>Senha: </label>
                <input type="password" name="txtSenha">
                <br><br> <!-- Tirar e mecher com o bootstrap -->
                <button type="submit" name="btnCadastrar">Cadastrar</button>

            </form>
        </main>


        <%
            if (request.getParameter("btnCadastrar") != null) {

                //Obter valores informados no Form
                String nomeVar = request.getParameter("txtNome");
                String loginVar = request.getParameter("txtLogin");
                String senhaVar = request.getParameter("txtSenha");

                //conexao
                Statement st = null;
                ResultSet rs = null;

                st = new Conexao().conectar().createStatement();

                rs = st.executeQuery("SELECT * FROM usuario WHERE login = '" + loginVar + "'");

                if (rs.next()) {
                    out.print("<script> alert('Usuário já cadastrado!')</script>");
                } else {
                    //Inserir dados no BD
                    st.executeUpdate("INSERT INTO usuario(nome, login, senha) VALUES ('" +nomeVar+ "','" + loginVar + "','" + senhaVar + "')");
        %>
        <script>
            alert("Cadastro com sucesso");
            window.location.href = 'painelAdm.jsp';

        </script>
        <%
                }
            }
        %>
    </body>
</html>
<!-- comment 

senhaVar ->erro

-->