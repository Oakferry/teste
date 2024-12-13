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
                                <a class="nav-link active" aria-current="page" href="painelAdm.jsp">Usuarios</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="gerenciarCurso.jsp">Cursos</a>
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
                <label>Nome do Curso: </label>
                <input type="text" name="txtNomeCur">
                <br><br> <!-- Tirar e mecher com o bootstrap -->
                <label>Descrição: </label>
                <input type="text" name="txtDescricao">
                <br><br> <!-- Tirar e mecher com o bootstrap -->
                <label>Carga Horária </label>
                <input type="number" name="txtHorario">
                <br><br> <!-- Tirar e mecher com o bootstrap -->
                <button type="submit" name="btnInserir">Incluir</button>

            </form>
        </main>


        <%
            if (request.getParameter("btnInserir") != null) {

                //Obter valores informados no Form
                String nomeCurVar = request.getParameter("txtNomeCur");
                String describeVar = request.getParameter("txtDescricao");
                String horaVar = request.getParameter("txtHorario");

                //conexao
                Statement st = null;
                ResultSet rs = null;

                st = new Conexao().conectar().createStatement();

                rs = st.executeQuery("SELECT * FROM curso WHERE nomeCurso = '" + nomeCurVar + "'");

                if (rs.next()) {
                    out.print("<script> alert('Curso já cadastrado!')</script>");
                } else {
                    //Inserir dados no BD
                    st.executeUpdate("INSERT INTO curso(nomeCurso, descricao, cargaHoraria) VALUES ('" +nomeCurVar+ "','" + describeVar + "','" + horaVar + "')");
        %>
        <script>
            alert("Cadastro com sucesso");
            window.location.href ="gerenciar_curso.jsp";

        </script>
        <%
                }
            }
        %>
    </body>
</html>
