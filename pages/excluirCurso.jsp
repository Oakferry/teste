<%-- 
    Document   : excluirCurso
    Created on : 12 de nov. de 2024, 16:44:40
    Author     : caio.9181
--%>


<%@ page import="config.Conexao"%>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String idCurso = request.getParameter("id");
    //Converter a variavel para inteiro
    int idCursoI = Integer.parseInt(idCurso);
    
    Statement st = null;
    ResultSet rs = null;
    st = new Conexao().conectar().createStatement();
    
    //Atualiza o banco
    st.execute("DELETE FROM curso WHERE idCurso= '"+idCursoI+"'");
%>

<script>
    alert("Curso excluido com sucesso");
    window.location.href="gerenciar_curso.jsp";
</script>