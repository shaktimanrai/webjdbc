package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import dbconnect.DbConfig;
import java.sql.PreparedStatement;

public final class select_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");

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

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Select</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Select</h1>\n");
      out.write("        <h2>");
      out.print(result);
      out.write("</h2>\n");
      out.write("    <form>\n");
      out.write("        <input type=\"hidden\" name=\"check\">\n");
      out.write("        Account No<input type=\"text\" name=\"accountno\" value=\"");
      out.print(accountno);
      out.write("\">\n");
      out.write("        <br>\n");
      out.write("        Name<input type=\"text\" name=\"name\" value=\"");
      out.print(name);
      out.write("\">\n");
      out.write("        <br>\n");
      out.write("        Balance<input type=\"text\" name=\"balance\" value=\"");
      out.print(balance);
      out.write("\">\n");
      out.write("        <br>\n");
      out.write("        <input type=\"submit\" value=\"Insert\">\n");
      out.write("        <br>\n");
      out.write("    </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
