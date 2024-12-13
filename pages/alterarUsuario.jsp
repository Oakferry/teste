<%-- 
    Document   : alterarUsuario
    Created on : 11 de nov. de 2024, 14:27:47
    Author     : caio.9181
--%>


<%@ page import="config.Conexao"%>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
    String idUsuario = request.getParameter("id");
    //Converter a variavel para inteiro
    int idUsuarioI = Integer.parseInt(idUsuario);
    
    //gera a conexao com o BD
    Statement st = null;
    ResultSet rs = null;
    st = new Conexao().conectar().createStatement();
    
    rs = st.executeQuery("SELECT * FROM usuario WHERE idUsuario= "+idUsuarioI);
    
    if (rs.next()){ %>
    
    <form action="" method="post">
                <label>Nome: </label>
                <input type="text" name="txtNome" value="<%=rs.getString(2)%>">
                <br><br> <!-- Tirar e mecher com o bootstrap -->
                <label>Login: </label>
                <input type="text" name="txtLogin" value="<%=rs.getString(3)%>">
                <br><br> <!-- Tirar e mecher com o bootstrap -->
                <label>Senha: </label>
                <input type="password" name="txtSenha" value="<%=rs.getString(4)%>">
                <br><br> <!-- Tirar e mecher com o bootstrap -->
                <button type="submit" name="btnAlterar">Alterar</button>
    </form>
        
        <%   }



            if (request.getParameter("btnAlterar") != null) {

                //Obter valores informados no Form
                String nomeVar = request.getParameter("txtNome");
                String loginVar = request.getParameter("txtLogin");
                String senhaVar = request.getParameter("txtSenha");
                
                st.executeUpdate("UPDATE usuario SET nome='"+ nomeVar +"',login='"+ loginVar +"',senha='"+ senhaVar +"' where idUsuario="+idUsuarioI);
                
            
        
        %>
        
         <script>
            alert("Alteração realizada com sucesso");
            window.location.href = 'painelAdm.jsp';

        </script>

        <% } %>