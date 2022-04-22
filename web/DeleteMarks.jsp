<%-- 
    Document   : UpdateMarks
    Created on : 22 Apr, 2022, 12:32:36 PM
    Author     : LENOVO

--%>


<%@page import="dbconnect.DbConfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean ispostback = (request.getParameter("check")==null)? false : true;
    String result="Delete Marks";
    String rollno= "";
    if (ispostback)  {
       try
        {
          rollno = request.getParameter("rollno");
        
          PreparedStatement statement=DbConfig.connect().prepareStatement("Delete from marks where rollno=?");
          statement.setString(1, rollno);
          //statement.setString(1, name);
         // statement.setString(2, phy);
          //statement.setString(3, chem);
         // statement.setString(4, math);
        int n=  statement.executeUpdate();
        if(n==1)
          result="Successfull";
        else
            result="no record";
        }
       catch(Exception ex)
       {
           System.out.println(ex);
           result=ex.getMessage();
       }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete marks</title>
    </head>
    <body>
        <h1>Delete marks</h1>
        <h2><%=result%></h2>
    <form>
        <input type="hidden" name="check">
        roll No<input type="text" name="rollno" value="<%=rollno%>">
        <br>
     
        <input type="submit" value="Insert">
        <br>
    </form>
    </body>
</html>

