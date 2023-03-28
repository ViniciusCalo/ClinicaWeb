<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
    Statement st = null;
    ResultSet rs = null;
    %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    </head>
    <body>
        <h1>Lista de Medicos</h1> 
        <hr>

<%  
            try{
     
            st = new Conexao().conectar().createStatement();
            
            rs = st.executeQuery("Select * from tbMedico");
            
            
                out.println("<table class='table table-striped'><tr>");               
                out.println("<td>Nome</td>");                                               
                out.println("<td>Telefone</td>");
                out.println("<td>Celular</td>");
                out.println("<td>Especialização</td></tr><tr>");
            while(rs.next())
            {    
                out.println("<td>" + rs.getString(2) + "</td>");
                out.println("<td>" + rs.getString(3)+ "</td>");
                out.println("<td>" + rs.getString(4)+ "</td>");
                out.println("<td>" + rs.getString(5)+ "</td>");
                out.print("<td>");
                out.print("<a href='EditarMed.jsp?funcao=editar&id="+rs.getString(1)+"' class='text-info'>Editar | <i class='far fa-edit'></i></a>");
                out.print("</td></tr>");
        }
                out.println("</table>");
            }
            catch(Exception e)
            {
                out.println(e);
            }
            
%>
             <br>
             <hr>
      <a href="index.html" class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Voltar</a>      
            
 </body>
   </html>