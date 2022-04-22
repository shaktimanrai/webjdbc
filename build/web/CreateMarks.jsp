<%-- 
    Document   : CreateMarks
    Created on : 22 Apr, 2022, 11:45:59 AM
    Author     : LENOVO
--%>


<%@page import="dbconnect.DbConfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean ispostback = (request.getParameter("check")==null)? false : true;
    String result="Create Marks";
    String rollno= "";
    String name= "";
    String phy= "";
    String chem="";
    String math="";
    if (ispostback)  {
       try
        {
          rollno = request.getParameter("rollno");
          name = request.getParameter("name");
          phy = request.getParameter("phy");
          chem = request.getParameter("chem");
          math = request.getParameter("math");
          PreparedStatement statement=DbConfig.connect().prepareStatement("Insert into marks values(?,?,?,?,?)");
          statement.setString(1, rollno);
          statement.setString(2, name);
          statement.setString(3, phy);
          statement.setString(4, chem);
          statement.setString(5, math);
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
        roll No<input type="text" name="rollno" value="<%=rollno%>">
        <br>
        Name<input type="text" name="name" value="<%=name%>">
        <br>
        phy<input type="text" name="phy" value="<%=phy%>">
        <br>
        chem<input type="text" name="chem" value="<%=chem%>">
        <br>
        math<input type="text" name="math" value="<%=math%>">
        <br>
        <input type="submit" value="Insert">
        <br>
    </form>
    </body>
</html>
