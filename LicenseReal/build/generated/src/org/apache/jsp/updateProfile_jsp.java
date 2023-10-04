package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class updateProfile_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    <title>JSP Page</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"table-name\">\n");
      out.write("        <h1>CHỈNH SỬA THÔNG TIN</h1>\n");
      out.write("    </div>\n");
      out.write("    <form action=\"updateProfile\" method=\"POST\">\n");
      out.write("        <div class=\"update-box\">\n");
      out.write("            <input value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${load_profile.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" type=\"text\" name=\"id\" id=\"id\" hidden=\"\" />\n");
      out.write("            <div class=\"update-title\">\n");
      out.write("                <label for=\"name\">Tên</label>\n");
      out.write("                <input value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${load_profile.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" type=\"text\" name=\"name\" id=\"name\" />\n");
      out.write("            </div>\n");
      out.write("            <div class=\"update-title\">\n");
      out.write("                <label for=\"phone\">Số điện thoại</label>\n");
      out.write("                <input value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${load_profile.phone}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" type=\"text\" name=\"phone\" id=\"phone\" />\n");
      out.write("            </div>\n");
      out.write("            <div class=\"update-title\">\n");
      out.write("                <label for=\"email\">Email</label>\n");
      out.write("                <input value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${load_profile.email}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" type=\"text\" name=\"email\" id=\"email\" />\n");
      out.write("            </div>\n");
      out.write("            <div class=\"update-title\">\n");
      out.write("                <label for=\"dob\">Ngày sinh</label>\n");
      out.write("                <input value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${load_profile.dob}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" type=\"date\" name=\"dob\" id=\"dob\" />\n");
      out.write("            </div>\n");
      out.write("            <div class=\"update-title\">\n");
      out.write("                <label for=\"cccd\">CCCD</label>\n");
      out.write("                <input value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${load_profile.cccd}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" type=\"text\" name=\"cccd\" id=\"cccd\" />\n");
      out.write("            </div>\n");
      out.write("            <div class=\"update-title\">\n");
      out.write("                <label for=\"address\">Địa chỉ</label>\n");
      out.write("                <input value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${load_profile.address}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" type=\"text\" name=\"address\" id=\"address\" />\n");
      out.write("            </div>\n");
      out.write("            <div class=\"update-title\">\n");
      out.write("                <label for=\"avatar\">Avatar</label>\n");
      out.write("                <input value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${load_profile.avatar}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" type=\"text\" name=\"avatar\" id=\"avatar\" />\n");
      out.write("            </div>\n");
      out.write("            <div class=\"update-title\">\n");
      out.write("                <label for=\"health\">Tình trạng sức khỏe</label>\n");
      out.write("                <input value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${load_profile.health}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" type=\"text\" name=\"health\" id=\"health\" />\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("            <a href=\"addtodrivingpro?id=?\">Add to drivingprofile</a>                                   \n");
      out.write("        <div class=\"table-btn\">\n");
      out.write("            <button type=\"submit\">UPDATE</button>\n");
      out.write("        </div>\n");
      out.write("    </form>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
