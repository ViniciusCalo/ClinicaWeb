<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

         pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>

<%@page import="com.mysql.jdbc.Driver"%>

<%@page import="config.Conexao"%>

<!DOCTYPE html>

<%

    Statement st = null;

    ResultSet rs = null;

%>

<html>

    <head>

        <html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br" xml:lang="pt-br">

            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>

                <title>JSP Page</title>

                </head>

                <body>

                    <h1>Busca de Medicos</h1>

                    <form action="buscMed.jsp" method="post">

                        <input type="text" name="txtNome"><input type="submit" name="btnSalvar">

                                </form>

                                <br>

                                    <br>

                                       

                                        <%    if (request.getParameter("btnSalvar") != null) {

                                                String busca = "%" + request.getParameter("txtNome") + "%";

                                                try {

                                                    st = new Conexao().conectar().createStatement();

                                                    rs = st.executeQuery("Select * from tbMedico where nomeMedico like'" + busca + "'");
                                                    out.println("<table class='table table-striped'><tr>");

                                                     out.println("<td>Nome</td>");                                               
                                                     out.println("<td>Telefone</td>");
                                                     out.println("<td>Celular</td>");
                                                     out.println("<td>Especialização</td></tr><tr>");
                                                                                                     
                                                    while (rs.next()) {

                                                        out.println("<td>" + rs.getString(2) + "</td>");

                                                        out.println("<td>" + rs.getString(3) + "</td>");
                                                        out.println("<td>" + rs.getString(4) + "</td>");
                                                        out.println("<td>" + rs.getString(5) + "</td></tr>");

                                                    }

                                                    out.println("</table>");

                                                } catch (Exception e) {

                                                    out.println(e);

                                                }

                                            }

                                        %> 
                                 <a href="index.html" class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Voltar</a>
                                        </body>

                                        </html>