<%-- 
    Document   : select
    Created on : 21 Apr, 2022, 2:15:46 PM
    Author     : LENOVO
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnect.DbConfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean ispostback = (request.getParameter("check")==null)? false : true;
    String result="Select Account";
    String accountno= "";
    String name= "";
    String balance= "";
    if (ispostback)  {
       try
        {
          accountno = request.getParameter("accountno");
          //name = request.getParameter("name");
          //balance = request.getParameter("balance");
          PreparedStatement statement=DbConfig.connect().prepareStatement("Select* from accounts where accountno=?");
          statement.setString(1, accountno);
         // statement.setString(2, name);
          //statement.setString(3, balance);
          ResultSet rs=statement.executeQuery();
          if(rs.next())
          {
          name="" + rs.getObject("NAME");
          balance="" +rs.getObject("BALANCE");
          result="Found";
        }
       else
       {
           result="Not found";
       }
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
        <title>Select</title>
    </head>
    <body>
        <h1>Select</h1>
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

