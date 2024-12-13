
<%@ page import="config.Conexao"%>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
    String idCurso = request.getParameter("id");
    //Converter a variavel para inteiro
    int idCursoI = Integer.parseInt(idCurso);
    
    //gera a conexao com o BD
    Statement st = null;
    ResultSet rs = null;
    st = new Conexao().conectar().createStatement();
    
    rs = st.executeQuery("SELECT * FROM curso WHERE idCurso= "+idCursoI);
    
    if (rs.next()){ %>
    
    <form action="" method="post">
                <label>Nome do Curso: </label>
                <input type="text" name="txtNomeCurso" value="<%=rs.getString(2)%>">
                <br><br> <!-- Tirar e mecher com o bootstrap -->
                <label>Descricao: </label>
                <input type="text" name="txtDescricao" value="<%=rs.getString(3)%>">
                <br><br> <!-- Tirar e mecher com o bootstrap -->
                <label>Carga Horária: </label>
                <input type="number" name="txtHorario" value="<%=rs.getString(4)%>">
                <br><br> <!-- Tirar e mecher com o bootstrap -->
                <button type="submit" name="btnAlterar">Alterar</button>
    </form>
        
        <%   }



            if (request.getParameter("btnAlterar") != null) {

                //Obter valores informados no Form
                String nomeCurVar = request.getParameter("txtNomeCurso");
                String describeVar = request.getParameter("txtDescricao");
                String horaVar = request.getParameter("txtHorario");
                
                st.executeUpdate("UPDATE curso SET nomeCurso='"+ nomeCurVar +"',descricao='"+ describeVar +"',cargaHoraria='"+ horaVar +"' where idCurso="+idCursoI);
                
            
        
        %>
        
         <script>
            alert("Alteração realizada com sucesso");
            window.location.href = "gerenciar_curso.jsp";

        </script>

        <% } %>