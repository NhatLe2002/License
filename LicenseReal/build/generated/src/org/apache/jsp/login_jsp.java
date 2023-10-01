package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <title>Document</title>\r\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\"\r\n");
      out.write("              integrity=\"sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN\" crossorigin=\"anonymous\">\r\n");
      out.write("        <style>\r\n");
      out.write("            body {\r\n");
      out.write("                background-color: #fefae0;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            a {\r\n");
      out.write("                text-decoration: none;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .container-wrapper {\r\n");
      out.write("                width: 1024px;\r\n");
      out.write("                margin: 0 auto;\r\n");
      out.write("                padding: 20px;\r\n");
      out.write("                box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .login-image {\r\n");
      out.write("                object-fit: cover;\r\n");
      out.write("                object-position: left;\r\n");
      out.write("                width: 100%;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body style=\"height: 100vh; display: flex; justify-content: center; align-items: center\">\r\n");
      out.write("        <div class=\"container-wrapper bg-light\">\r\n");
      out.write("            <div class=\"container-fluid\">\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-sm-6 text-black\">\r\n");
      out.write("                        <!-- điều hướng cái này về trang home khi bấm vào -->\r\n");
      out.write("                        <a href=\"/#\" style=\"color: #000;\">\r\n");
      out.write("                            <div class=\"d-flex align-items-center gap-2\">\r\n");
      out.write("                                <img src=\"https://cdn-icons-png.flaticon.com/512/6556/6556219.png\" alt=\"logo\"\r\n");
      out.write("                                     style=\"width: 100px; height: auto; opacity: 0.8;\" />\r\n");
      out.write("                                <span class=\"h1 fw-bold mb-0\">DaoTaoLaiXe</span>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <!-- login form -->\r\n");
      out.write("                        <div class=\"d-flex align-items-center h-custom-2 pt-5 pt-xl-0 mt-xl-n5\">\r\n");
      out.write("                            <form action=\"MainController\" method=\"POST\" style=\"width: 23rem;\">\r\n");
      out.write("                                <h3 class=\"fw-normal mb-3 pb-3\" style=\"font-size: 25px;\">Chào mừng bạn đã quay trở lại!\r\n");
      out.write("                                </h3>\r\n");
      out.write("                                <div class=\"form-outline mb-4\">\r\n");
      out.write("                                    <label class=\"form-label\" for=\"form2Example18\">Tên tài khoản</label>\r\n");
      out.write("                                    <input name=\"username\" type=\"text\" id=\"form2Example18\" class=\"form-control form-control-lg required\" />\r\n");
      out.write("                                </div>\r\n");
      out.write("\r\n");
      out.write("                                <div class=\"form-outline mb-4\">\r\n");
      out.write("                                    <label class=\"form-label\" for=\"form2Example28\">Mật khẩu</label>\r\n");
      out.write("                                    <input name=\"password\" type=\"password\" id=\"form2Example28\" class=\"form-control form-control-lg required\" />\r\n");
      out.write("                                </div>\r\n");
      out.write("\r\n");
      out.write("                                <div class=\"pt-1 mb-4\">\r\n");
      out.write("                                    <button type=\"submit\" name=\"action\" value=\"login\"class=\"btn btn-info btn-lg btn-block\" type=\"button\">Đăng nhập</button>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <p>Chưa có tài khoản? <a href=\"register.jsp\" class=\"link-info\">Đăng ký ngay</a></p>\r\n");
      out.write("                            </form>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-sm-6 px-0 d-flex justify-content-center\">\r\n");
      out.write("                        <img src=\"https://daotaolaixehd.com.vn/wp-content/uploads/2020/06/600-cau-h%E1%BB%8Fi.png\"\r\n");
      out.write("                             alt=\"Login image\" class=\"login-image\" />\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
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
