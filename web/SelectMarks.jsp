<%-- 
    Document   : UpdateMarks
    Created on : 22 Apr, 2022, 12:32:36 PM
    Author     : LENOVO

--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnect.DbConfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean ispostback = (request.getParameter("check")==null)? false : true;
    String result="Select Marks";
    String rollno= "";
    String name= "";
    String phy= "";
    String chem="";
    String math="";
    if (ispostback)  {
       try
        {
          rollno = request.getParameter("rollno");
          PreparedStatement statement=DbConfig.connect().prepareStatement("Select* from marks where rollno=?");
          statement.setString(1, rollno);
          ResultSet rs=statement.executeQuery();
            if(rs.next())
          {
          name="" + rs.getObject("NAME");
          phy="" +rs.getObject("PHY");
          chem="" +rs.getObject("CHEM");
          math="" +rs.getObject("MATH");
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select marks</title>
    </head>
    <body>
        <h1>Select marks</h1>
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

