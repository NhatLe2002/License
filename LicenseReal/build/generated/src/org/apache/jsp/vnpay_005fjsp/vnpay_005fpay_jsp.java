package org.apache.jsp.vnpay_005fjsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class vnpay_005fpay_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->\r\n");
      out.write("        <meta name=\"description\" content=\"\">\r\n");
      out.write("        <meta name=\"author\" content=\"\">\r\n");
      out.write("        <title>Tạo mới đơn hàng</title>\r\n");
      out.write("        <!-- Bootstrap core CSS -->\r\n");
      out.write("        <link href=\"/vnpay_jsp/assets/bootstrap.min.css\" rel=\"stylesheet\"/>\r\n");
      out.write("        <!-- Custom styles for this template -->\r\n");
      out.write("        <link href=\"/vnpay_jsp/assets/jumbotron-narrow.css\" rel=\"stylesheet\">      \r\n");
      out.write("        <script src=\"/vnpay_jsp/assets/jquery-1.11.3.min.js\"></script>\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("         <div class=\"container\">\r\n");
      out.write("           <div class=\"header clearfix\">\r\n");
      out.write("\r\n");
      out.write("                <h3 class=\"text-muted\">VNPAY DEMO</h3>\r\n");
      out.write("            </div>\r\n");
      out.write("            <h3>Tạo mới đơn hàng</h3>\r\n");
      out.write("            <div class=\"table-responsive\">\r\n");
      out.write("                <form action=\"/vnpay_jsp/vnpay_ipn\" id=\"frmCreateOrder\" method=\"post\">        \r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label for=\"amount\">Số tiền</label>\r\n");
      out.write("                        <input class=\"form-control\" data-val=\"true\" data-val-number=\"The field Amount must be a number.\" data-val-required=\"The Amount field is required.\" id=\"amount\" max=\"100000000\" min=\"1\" name=\"amount\" type=\"number\" value=\"10000\" />\r\n");
      out.write("                    </div>\r\n");
      out.write("                     <h4>Chọn phương thức thanh toán</h4>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>\r\n");
      out.write("                       <input type=\"radio\" Checked=\"True\" id=\"bankCode\" name=\"bankCode\" value=\"\">\r\n");
      out.write("                       <label for=\"bankCode\">Cổng thanh toán VNPAYQR</label><br>\r\n");
      out.write("                       \r\n");
      out.write("                       <h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>\r\n");
      out.write("                       <input type=\"radio\" id=\"bankCode\" name=\"bankCode\" value=\"VNPAYQR\">\r\n");
      out.write("                       <label for=\"bankCode\">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label><br>\r\n");
      out.write("                       \r\n");
      out.write("                       <input type=\"radio\" id=\"bankCode\" name=\"bankCode\" value=\"VNBANK\">\r\n");
      out.write("                       <label for=\"bankCode\">Thanh toán qua thẻ ATM/Tài khoản nội địa</label><br>\r\n");
      out.write("                       \r\n");
      out.write("                       <input type=\"radio\" id=\"bankCode\" name=\"bankCode\" value=\"INTCARD\">\r\n");
      out.write("                       <label for=\"bankCode\">Thanh toán qua thẻ quốc tế</label><br>\r\n");
      out.write("                       \r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>\r\n");
      out.write("                         <input type=\"radio\" id=\"language\" Checked=\"True\" name=\"language\" value=\"vn\">\r\n");
      out.write("                         <label for=\"language\">Tiếng việt</label><br>\r\n");
      out.write("                         <input type=\"radio\" id=\"language\" name=\"language\" value=\"en\">\r\n");
      out.write("                         <label for=\"language\">Tiếng anh</label><br>\r\n");
      out.write("                         \r\n");
      out.write("                    </div>\r\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-default\" href>Thanh toán</button>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("            <p>\r\n");
      out.write("                &nbsp;\r\n");
      out.write("            </p>\r\n");
      out.write("            <footer class=\"footer\">\r\n");
      out.write("                <p>&copy; VNPAY 2020</p>\r\n");
      out.write("            </footer>\r\n");
      out.write("        </div>\r\n");
      out.write("          \r\n");
      out.write("        <link href=\"https://pay.vnpay.vn/lib/vnpay/vnpay.css\" rel=\"stylesheet\" />\r\n");
      out.write("        <script src=\"https://pay.vnpay.vn/lib/vnpay/vnpay.min.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\">\r\n");
      out.write("            $(\"#frmCreateOrder\").submit(function () {\r\n");
      out.write("                var postData = $(\"#frmCreateOrder\").serialize();\r\n");
      out.write("                var submitUrl = $(\"#frmCreateOrder\").attr(\"action\");\r\n");
      out.write("                $.ajax({\r\n");
      out.write("                    type: \"POST\",\r\n");
      out.write("                    url: submitUrl,\r\n");
      out.write("                    data: postData,\r\n");
      out.write("                    dataType: 'JSON',\r\n");
      out.write("                    success: function (x) {\r\n");
      out.write("                        if (x.code === '00') {\r\n");
      out.write("                            if (window.vnpay) {\r\n");
      out.write("                                vnpay.open({width: 768, height: 600, url: x.data});\r\n");
      out.write("                            } else {\r\n");
      out.write("                                location.href = x.data;\r\n");
      out.write("                            }\r\n");
      out.write("                            return false;\r\n");
      out.write("                        } else {\r\n");
      out.write("                            alert(x.Message);\r\n");
      out.write("                        }\r\n");
      out.write("                    }\r\n");
      out.write("                });\r\n");
      out.write("                return false;\r\n");
      out.write("            });\r\n");
      out.write("        </script>       \r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
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
