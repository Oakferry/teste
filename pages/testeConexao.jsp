<%-- 
    Document   : testeConexao.jsp
    Created on : 1 de nov. de 2024, 15:55:23
    Author     : caio.9181
--%>

<%@ page import="config.Conexao"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="br" data-bs-theme="info">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Conexao conexao = new Conexao();
            
            Connection conn = conexao.conectar();
            if(conn != null && !conn.isClosed()){
                out.print("<p>Conexão realizada com sucesso</p>");
                conn.close();
                out.print("<p>Conexão fechada com sucesso</p> ");
            }
            else{
                out.print("<p>erro na conexão</p> ");
            }
           
        %>
    </body>
</html>
