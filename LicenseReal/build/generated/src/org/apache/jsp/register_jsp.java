package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Đăng ký</title>\r\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\"\r\n");
      out.write("              integrity=\"sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN\" crossorigin=\"anonymous\">\r\n");
      out.write("\r\n");
      out.write("        <style>\r\n");
      out.write("            * {\r\n");
      out.write("                margin: 0;\r\n");
      out.write("                padding: 0;\r\n");
      out.write("                box-sizing: border-box;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            a {\r\n");
      out.write("                text-decoration: none;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .container-register {\r\n");
      out.write("                max-width: 700px;\r\n");
      out.write("                width: 100%;\r\n");
      out.write("                background-color: #fff;\r\n");
      out.write("                padding: 25px 30px;\r\n");
      out.write("                border-radius: 5px;\r\n");
      out.write("                box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .container-register .title {\r\n");
      out.write("                font-size: 25px;\r\n");
      out.write("                font-weight: 500;\r\n");
      out.write("                position: relative;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .container-register .title::before {\r\n");
      out.write("                content: '';\r\n");
      out.write("                position: absolute;\r\n");
      out.write("                height: 3px;\r\n");
      out.write("                width: 30px;\r\n");
      out.write("                left: 0;\r\n");
      out.write("                bottom: 0;\r\n");
      out.write("                background-color: #d4a373;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .container-register form .user-details {\r\n");
      out.write("                display: flex;\r\n");
      out.write("                flex-wrap: wrap;\r\n");
      out.write("                justify-content: space-between;\r\n");
      out.write("                margin: 20px 0 12px 0;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .container-register form .user-details .input-box {\r\n");
      out.write("                margin-bottom: 15px;\r\n");
      out.write("                width: calc(100% / 2 - 20px);\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .container-register .user-details .input-box .details {\r\n");
      out.write("                display: block;\r\n");
      out.write("                font-weight: 500;\r\n");
      out.write("                margin-bottom: 5px;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .container-register .user-details .input-box input {\r\n");
      out.write("                height: 45px;\r\n");
      out.write("                width: 100%;\r\n");
      out.write("                outline: none;\r\n");
      out.write("                border-radius: 5px;\r\n");
      out.write("                border: 1px solid #ccc;\r\n");
      out.write("                padding-left: 15px;\r\n");
      out.write("                font-size: 16px;\r\n");
      out.write("                border-bottom-width: 2px;\r\n");
      out.write("                transition: all 0.3s ease;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .user-details .input-box input:focus,\r\n");
      out.write("            .user-details .input-box input:valid {\r\n");
      out.write("                border-color: #d4a373\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            form .gender-details .gender-title {\r\n");
      out.write("                font-size: 20px;\r\n");
      out.write("                font-weight: 500;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            form .gender-details .category {\r\n");
      out.write("                display: flex;\r\n");
      out.write("                width: 80%;\r\n");
      out.write("                margin: 14px 0;\r\n");
      out.write("                justify-content: space-between;\r\n");
      out.write("                gap: 3rem;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .gender-details .category label {\r\n");
      out.write("                display: flex;\r\n");
      out.write("                align-items: center;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .gender-details .category .dot {\r\n");
      out.write("                height: 18px;\r\n");
      out.write("                width: 18px;\r\n");
      out.write("                background: #d9d9d9;\r\n");
      out.write("                border-radius: 50%;\r\n");
      out.write("                margin-right: 10px;\r\n");
      out.write("                border: 5px solid transparent;\r\n");
      out.write("                transition: all 0.3s ease\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            #dot-1:checked~.category .one,\r\n");
      out.write("            #dot-2:checked~.category .two,\r\n");
      out.write("            #dot-3:checked~.category .three {\r\n");
      out.write("                border-color: #d9d9d9;\r\n");
      out.write("                background: #d4a373;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .container-register form input[type=\"radio\"] {\r\n");
      out.write("                display: none;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .container-register form .button-register {\r\n");
      out.write("                height: 45px;\r\n");
      out.write("                cursor: pointer;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .container-register form .button-register input {\r\n");
      out.write("                height: 100%;\r\n");
      out.write("                width: 100%;\r\n");
      out.write("                outline: none;\r\n");
      out.write("                color: #fff;\r\n");
      out.write("                border: none;\r\n");
      out.write("                font-size: 18px;\r\n");
      out.write("                font-weight: 500;\r\n");
      out.write("                border-radius: 5px;\r\n");
      out.write("                letter-spacing: 1px;\r\n");
      out.write("                cursor: pointer;\r\n");
      out.write("                background-color: #ccd5ae;\r\n");
      out.write("            }\r\n");
      out.write("            .container-register form .button-register button {\r\n");
      out.write("                height: 100%;\r\n");
      out.write("                width: 100%;\r\n");
      out.write("                outline: none;\r\n");
      out.write("                color: #fff;\r\n");
      out.write("                border: none;\r\n");
      out.write("                font-size: 18px;\r\n");
      out.write("                font-weight: 500;\r\n");
      out.write("                border-radius: 5px;\r\n");
      out.write("                letter-spacing: 1px;\r\n");
      out.write("                cursor: pointer;\r\n");
      out.write("                background-color: #ccd5ae;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .container-register form .button-register input:hover {\r\n");
      out.write("                background-color: #d4a373;\r\n");
      out.write("            }\r\n");
      out.write("        </style>\r\n");
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body\r\n");
      out.write("        style=\"padding: 10px; display: flex; height: 100vh; justify-content: center; align-items: center; background-color: #fefae0;\">\r\n");
      out.write("        <div class=\"container-register\">\r\n");
      out.write("            <a href=\"./index.html\" style=\"color: #000;\">\r\n");
      out.write("                <div class=\"d-flex align-items-center gap-2\">\r\n");
      out.write("                    <img src=\"https://cdn-icons-png.flaticon.com/512/6556/6556219.png\" alt=\"logo\"\r\n");
      out.write("                         style=\"width: 100px; height: auto; opacity: 0.8;\" />\r\n");
      out.write("                    <span class=\"h1 fw-bold mb-0\">DaoTaoLaiXe</span>\r\n");
      out.write("                </div>\r\n");
      out.write("            </a>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"title\">Đăng kí</div>\r\n");
      out.write("            <form action=\"MainController\" method =\"POST\">\r\n");
      out.write("                <div class=\"user-details\">\r\n");
      out.write("                    <div class=\"input-box\">\r\n");
      out.write("                        <span class=\"details\">Tên tài khoản</span>\r\n");
      out.write("                        <input name=\"username\" type=\"text\" placeholder=\"Vui lòng nhập tài khoản\" required>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"input-box\">\r\n");
      out.write("                        <span class=\"details\">Mật khẩu</span>\r\n");
      out.write("                        <input name=\"password\" type=\"password\" placeholder=\"Vui lòng nhập mật khẩu\" required>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"input-box\">\r\n");
      out.write("                        <span class=\"details\">Xác nhận mật khẩu</span>\r\n");
      out.write("                        <input name=\"confirmPassword\" type=\"password\" placeholder=\"Xác nhận lại mật khẩu\" required>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <!-- Cái này là bonus nếu có nhu cầu -->\r\n");
      out.write("                    <!-- <div class=\"gender-details\">\r\n");
      out.write("                        <input type=\"radio\" name=\"gender\" id=\"dot-1\">\r\n");
      out.write("                        <input type=\"radio\" name=\"gender\" id=\"dot-2\">\r\n");
      out.write("                        <input type=\"radio\" name=\"gender\" id=\"dot-3\">\r\n");
      out.write("                       \r\n");
      out.write("                        <span class=\"gender-title\">Gender</span>\r\n");
      out.write("                        <div class=\"category\">\r\n");
      out.write("                            <label for=\"dot-1\">\r\n");
      out.write("                                <span class=\"dot one\"></span>\r\n");
      out.write("                                <span class=\"gender\">Male</span>\r\n");
      out.write("                            </label>\r\n");
      out.write("    \r\n");
      out.write("                            <label for=\"dot-2\">\r\n");
      out.write("                                <span class=\"dot two\"></span>\r\n");
      out.write("                                <span class=\"gender\">Female</span>\r\n");
      out.write("                            </label>\r\n");
      out.write("    \r\n");
      out.write("                            <label for=\"dot-3\">\r\n");
      out.write("                                <span class=\"dot three\"></span>\r\n");
      out.write("                                <span class=\"gender\">Other</span>\r\n");
      out.write("                            </label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div> -->\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"button-register\">\r\n");
      out.write("                    <button name=\"action\" type=\"submit\" value=\"register\">Đăng ký</button>\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("            </form>\r\n");
      out.write("            ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${message}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\r\n");
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
