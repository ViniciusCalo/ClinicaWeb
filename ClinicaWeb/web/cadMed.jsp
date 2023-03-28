<%--     Document   : cadUsu    Created on : 1 de mar. de 2023, 21:50:25    Author     : rovil--%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="UTF-8"%><%@page import="java.sql.*"%><%@page import="com.mysql.jdbc.Driver"%><%@page import="config.Conexao"%><%
    Statement st = null;
    ResultSet rs = null;
%><!DOCTYPE html><html>   
    <head>       
        <meta charset="UTF-8">    
        <title>JSP Page</title>  
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    </head>   
    <body style="text-align: center">       
        <h1>Cadastro de Medicos</h1>   
        
 
        <form action="" method="post" id="cadastro"> 
            <label>Nome</label><br>   
            <input type="text" name="txtNome"><br>   
            <label>Celular</label><br>        
            <input type="text" name="txtCel"><br>          
            <label>Telefone</label><br>          
            <input type="text" name="txtTel"><br>
            <!-- comment -->     
            <br>     
            <select name="txtEsp" class="form-select" aria-label="Disabled select example">        
                <option value="" disabled selected hidden>Especialidade</option>
                <option value="1">Fisioterapia</option>     
                <option value="2">Cirurgião</option>     
                <option value="3">Pediatra</option>      
                <option value="4">Clinico Geral</option>  
                <option value="5">Otorrinolaringologista</option>   
            </select>         
            <br>          
            <input type="submit" name="btnSalvar">     
        </form>   
               
      <%
    if (request.getParameter("btnSalvar") != null) {
        String nome = request.getParameter("txtNome");
        String cel = request.getParameter("txtCel");
        String tel = request.getParameter("txtTel");
        String especi = request.getParameter("txtEsp");
        try {
            st = new Conexao().conectar().createStatement();
            st.executeUpdate("insert into tbMedico(nomeMedico,telMedico,celMedico,codEspecialidade) values('" + nome + "'" + ", '" + tel + "', '" + cel + "', '" + especi + "')");
            out.println("<meta http-equiv='refresh' content='0;URL=index.html'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cadastro realizado com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println(e);
        }
    }
%>

<br>
 <a href="index.html" class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Voltar</a>
    </body>
</html>
