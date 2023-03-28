<%--     Document   : cadUsu    Created on : 1 de mar. de 2023, 21:50:25    Author     : rovil--%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="UTF-8"%><%@page import="java.sql.*"%><%@page import="com.mysql.jdbc.Driver"%><%@page import="config.Conexao"%><%
    Statement st = null;
    ResultSet rs = null;
%><!DOCTYPE html><html>   
    <head>       
        <meta charset=UTF-8>       
        <title>JSP Page</title>  
    </head>   
    <body style="text-align: center">          
        <h1>Agendamento</h1>   
        <form action="" method="post" id="cadastro"> 
            <label>Descrição do Agendamenro</label><br>   
            <input type="text" name="txtDesc"><br><br>
            <label>data de retorno</label><br>  
            <input type="date" name="txtDate"><br><br>
            <label>horario de retorno</label><br>  
            <input type="time" name="txtTime"><br><br>
            <%
                try {
                    st = new Conexao().conectar().createStatement();
                    rs = st.executeQuery("Select * from tbMedico");
                    
                    out.println("<select name='medico'>");
                     out.println("<option value='' disabled selected hidden>Medico</option>");
                    while (rs.next()) {
                        out.println("<option value="+rs.getString(1)+">" + rs.getString(2) + "</option>");
                    }
                    out.println("</select>");
                } catch (Exception e) {
                    out.println(e);
                }
            %>
            
            <%
                try {
                    st = new Conexao().conectar().createStatement();
                    rs = st.executeQuery("Select * from tbPaciente");

                    out.println("<select name='paciente'>");
                    out.println("<option value='' disabled selected hidden>Paciente</option>");
                    while (rs.next()) {
                        out.println("<option value="+rs.getString(1)+">" + rs.getString(2) + "</option>");
                    }
                    out.println("</select>");
                } catch (Exception e) {
                    out.println(e);
                }
            %>
            <!-- comment --> 
            <br>
            <br>                
            <input type="submit" name="btnSalvar">     
        </form>   

        <%
            if (request.getParameter("btnSalvar") != null) {
                String desc = request.getParameter("txtDesc");     
               String codMedico = request.getParameter("medico");
               String codPaciente = request.getParameter("paciente");
               String date = request.getParameter("txtDate");
               String time = request.getParameter("txtTime");
                try {
                    st = new Conexao().conectar().createStatement();
                    st.executeUpdate("insert into tbAgendamento(dataAgendamento, horaAgendamento, codPaciente, codMedico , diagnosticoAgendamento) values('" + date + "','" + time + "','" + codPaciente + "','" + codMedico + "', '" + desc + "')");
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
