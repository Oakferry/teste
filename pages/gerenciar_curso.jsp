<%-- 
    Document   : gerenciar_curso
    Created on : 11 de nov. de 2024, 14:29:11
    Author     : caio.9181
--%>

<%@ page import="config.Conexao"%>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="br" data-bs-theme="info">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>painelAdm</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
          <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        
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
                                <a class="nav-link" href="gerenciar_curso.jsp">Cursos</a>
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

                        <a href="logout.jsp"> <img src="img/seta1.png" alt="alt"/> Sair </a>
                        </span>
                    </div>
                </div>
            </nav>
        </header>
        
      
        
    <main>

            <nav class="navbar bg-body-primary ps-4 pt-4 ">
              <div class="container-fluid d-flex justify-content-center">
                <form class="d-flex" role="search" method="post">
                   <label class="w- pt-2"> </label>
                  <input class="form-control me-1" type="search" placeholder="Procurar" aria-label="Search" name="txtName">
                  <button class="btn btn-outline-primary" type="submit" name="buscar">Buscar</button>
                </form>
              </div>
            </nav> 
            
        <!-- Classe tabela -->
            <table class="table table-bordered mt-5 w-75 mx-auto">
            <thead>
                <tr>
                    <th>Nome do Curso</th>
                    <th>Descrição</th>
                    <th>Carga Horária</th>
                    <th colspan="2">Ações</th>
                </tr>              
                             
            </thead>
            
            <tbody>
            <%  
                String nomeCurso = request.getParameter("txtName");
                Statement st = null; //Executa a consulta
                ResultSet rs = null; // Armazenar consulta
                
                //criar a conexão com o BD
                st = new Conexao().conectar().createStatement();
                
                if(nomeCurso!= null){
                    rs = st.executeQuery("SELECT * FROM curso WHERE nomeCurso LIKE '%"+ nomeCurso + "%' order by nomeCurso asc");
                }
                else{
                    rs = st.executeQuery("SELECT * FROM curso");
                }
                                
                           
                while (rs.next()){

                  out.print("<tr>");
                    out.print("<td>"+rs.getString(2)+"</td>");
                    out.print("<td>"+rs.getString(3)+"</td>");
                    out.print("<td>"+rs.getString(4)+"</td>");
                    out.print("<td> <a class='d-flex justify-content-center' href='excluirCurso.jsp?id=" + rs.getString(1) + "'><img src='img/lata-de-lixo.png' alt='alt'/> </td>");
                    out.print("<td> <a class='d-flex justify-content-center' href='alterarCurso.jsp?id=" + rs.getString(1) + "'><img src='img/caneta.png' alt='alt'alt'/>  </td>");
                  out.print("<tr>");
                 
                 }
            %>
            
            </tbody>
        </table>   
            
            
         <div class="d-flex justify-content-center adicionar pt-4">
            <a href="incluirCurso.jsp" class="btn btn-primary">Adicionar Curso</a>
        </div>
            

            
            
            
    </main>
    
       
    </body>
</html>
