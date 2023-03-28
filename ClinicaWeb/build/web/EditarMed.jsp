<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>

<%  
    Statement st = null;
    ResultSet rs = null;  
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Medico</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    </head>
    <body>
        <h1>Editar Medico</h1>
        <%
            String valorNome=null;
            String valorTel=null;
            String valorCel=null;
            String especi=null;
            
            if(request.getParameter("funcao")!=null && request.getParameter("funcao").equals("editar")){
                String valorID = request.getParameter("id");       
                st = new Conexao().conectar().createStatement();
                
            try{
                rs = st.executeQuery("Select * from tbMedico where codMedico='"+ valorID +"'");
                while(rs.next())
                    {    
                        valorNome =  rs.getString(2);
                        valorTel =  rs.getString(3);
                        valorCel =  rs.getString(4);
                        especi = rs.getString(5);
                
                    }
            }
                catch(Exception e)
                        {
                        out.println(e);
                        }
  
            }
            %>
        <form action="" method="post" id="cadastro">
            <label>Nome do Usuário</label><br>
            <input type="text" name="txtNome" value="<%=valorNome %>"><br>
            <br>
            <label>Telefone</label><br>
            <input type="text" name="txtTel" value="<%=valorTel %>"><br>
            <br>
            <label>Celular</label><br>
            <input type="text" name="txtCel" value="<%=valorCel %>"><br>
            <br>
            <label>Especialização</label><br>
            <select name="especi">
                <option value="<%=especi %>"><%=especi %></option>
                <option value="1">Fisioterapia</option>     
                <option value="2">Cirurgião</option>     
                <option value="3">Pediatra</option>      
                <option value="4">Clinico Geral</option>  
                <option value="5">Otorrinolaringologista</option>   
            </select>
            <br>
            <input type="submit" name="btnAtualizar" value="Atualizar">
          
        </form>
        
<%
            if(request.getParameter("btnAtualizar")!=null){
                String id = request.getParameter("id");
                String nome = request.getParameter("txtNome");
                String tel = request.getParameter("txtTel");
                String cel = request.getParameter("txtCel");
                String especia = request.getParameter("especi");            
               try{
                        st = new Conexao().conectar().createStatement();

                        st.executeUpdate("Update tbMedico set nomeMedico='" + nome + "',telMedico='" + tel + "',celMedico='" + cel + "',codEspecialidade='" + especia + "'where codMedico='" + id + "'");     
                        out.println("<meta http-equiv='refresh' content='0;URL=index.html'>");
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Usuário atualizado com sucesso');");
                        out.println("</script>");    
                        }
                catch(Exception e)
                        {
                        out.println(e);
                        }
  
            }
            %>        

            <br>
                   <a href="index.html" class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Voltar</a>
</body>
 </html>