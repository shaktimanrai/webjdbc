<%-- 
    Document   : delete
    Created on : 21 Apr, 2022, 1:38:24 PM
    Author     : LENOVO
--%>


<%@page import="dbconnect.DbConfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean ispostback = (request.getParameter("check")==null)? false : true;
    String result="Delete Account";
    String accountno= "";
    String name= "";
    String balance= "";
    if (ispostback)  {
       try
        {
          accountno = request.getParameter("accountno");
          name = request.getParameter("name");
          balance = request.getParameter("balance");
          PreparedStatement statement=DbConfig.connect().prepareStatement("Delete from accounts where accountno=?");
          statement.setString(1, accountno);
         // statement.setString(2, name);
         // statement.setString(3, balance);
          statement.executeUpdate();
          result="Successfull";
        }
       catch(Exception ex)
       {
          System.out.println(ex);
           result=ex.getMessage();
       }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
    </head>
    <body>
        <h1>Delete</h1>
        <h2><%=result%></h2>
    <form>
        <input type="hidden" name="check">
        Account No<input type="text" name="accountno" value="<%=accountno%>">
        <br>
        <input type="submit" value="Insert">
        <br>
    </form>
    </body>
</html>
