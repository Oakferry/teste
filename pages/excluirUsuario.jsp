<%-- 
    Document   : excluirUsuario
    Created on : 11 de nov. de 2024, 14:27:25
    Author     : caio.9181
--%>

<%@ page import="config.Conexao"%>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String idUsuario = request.getParameter("id");
    //Converter a variavel para inteiro
    int idUsuarioI = Integer.parseInt(idUsuario);
    
    Statement st = null;
    ResultSet rs = null;
    st = new Conexao().conectar().createStatement();
    
    //Atualiza o banco
    st.execute("DELETE FROM usuario WHERE idUsuario= '"+idUsuarioI+"'");
%>

<script>
    alert("Usuário excluido com sucesso");
    window.location.href="painelAdm.jsp";
</script>