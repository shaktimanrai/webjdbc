
<%@page import="dbconnect.DbConfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean ispostback = (request.getParameter("check")==null)? false : true;
    String result="Create Account";
    String accountno= "";
    String name= "";
    String balance= "";
    if (ispostback)  {
       try
        {
          accountno = request.getParameter("accountno");
          name = request.getParameter("name");
          balance = request.getParameter("balance");
          PreparedStatement statement=DbConfig.connect().prepareStatement("Insert into accounts values(?,?,?)");
          statement.setString(1, accountno);
          statement.setString(2, name);
          statement.setString(3, balance);
          statement.executeUpdate();
          result="Successfull";
        }
       catch(Exception ex)
       {
           result=ex.getMessage();
       }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert</title>
    </head>
    <body>
        <h1>Insert</h1>
        <h2><%=result%></h2>
    <form>
        <input type="hidden" name="check">
        Account No<input type="text" name="accountno" value="<%=accountno%>">
        <br>
        Name<input type="text" name="name" value="<%=name%>">
        <br>
        Balance<input type="text" name="balance" value="<%=balance%>">
        <br>
        <input type="submit" value="Insert">
        <br>
    </form>
    </body>
</html>
