package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_choose;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_otherwise;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_when_test;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_choose = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_otherwise = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_when_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_choose.release();
    _jspx_tagPool_c_otherwise.release();
    _jspx_tagPool_c_when_test.release();
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Document</title>\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\"\n");
      out.write("              integrity=\"sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN\" crossorigin=\"anonymous\">\n");
      out.write("        <style>\n");
      out.write("            * {\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            a {\n");
      out.write("                text-decoration: none;\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header {\n");
      out.write("                background: #fefae0;\n");
      out.write("                transition: all 0.5s ease-out;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header .main__navbar .container {\n");
      out.write("                margin: 0 auto;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header .main__navbar .container .logo {\n");
      out.write("                width: 80px;\n");
      out.write("                height: auto;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header .main__navbar .container .logo img {\n");
      out.write("                width: 80px;\n");
      out.write("                height: auto;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header .main__navbar .container .logo h3 {\n");
      out.write("                color: #000;\n");
      out.write("                margin: 0px;\n");
      out.write("                font-size: 25px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header .main__navbar .container .menu {\n");
      out.write("                display: flex;\n");
      out.write("                align-items: center;\n");
      out.write("                column-gap: 2.7rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header .main__navbar .container .menu .menu_items {\n");
      out.write("                color: black;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header .main__navbar .container .menu .btn_login {\n");
      out.write("                background-color: #d4a373;\n");
      out.write("                border: 1px solid #d4a373;\n");
      out.write("                padding: 5px 15px;\n");
      out.write("                color: white;\n");
      out.write("                border-radius: 10px;\n");
      out.write("                transition: all 0.5s ease-out;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header .main__navbar .container .menu .menu_items:hover {\n");
      out.write("                border-bottom: 2px solid #d4a373;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header .main__navbar .container .menu .menu_items_active {\n");
      out.write("                border-bottom: 2px solid #d4a373;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header .main__navbar .container .menu .btn_login:hover {\n");
      out.write("                background-color: #457b9d;\n");
      out.write("                border: 1px solid #457b9d;\n");
      out.write("                color: white;\n");
      out.write("                transition: all 0.5s ease-out;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* hero slides */\n");
      out.write("            #slideshow {\n");
      out.write("                margin: 0 auto;\n");
      out.write("                overflow: hidden;\n");
      out.write("                position: relative;\n");
      out.write("                height: 500px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .slide {\n");
      out.write("                display: none;\n");
      out.write("                width: 100%;\n");
      out.write("                height: 100%;\n");
      out.write("                object-fit: cover;\n");
      out.write("                transition: all 0.5s ease-in-out;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .slide.active {\n");
      out.write("                display: block;\n");
      out.write("                opacity: 1;\n");
      out.write("                transition: all 0.5s ease-in-out;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .overlay {\n");
      out.write("                position: absolute;\n");
      out.write("                top: 0;\n");
      out.write("                left: 0;\n");
      out.write("                width: 100%;\n");
      out.write("                height: 100%;\n");
      out.write("                background: rgba(0, 0, 0, 0.6);\n");
      out.write("                display: flex;\n");
      out.write("                flex-direction: column;\n");
      out.write("                justify-content: center;\n");
      out.write("                align-items: center;\n");
      out.write("                color: white;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .overlay-text {\n");
      out.write("                font-size: 24px;\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .overlay-button {\n");
      out.write("                background-color: #d4a373;\n");
      out.write("                border: 1px solid #d4a373;\n");
      out.write("                padding: 10px 20px;\n");
      out.write("                color: white;\n");
      out.write("                border-radius: 10px;\n");
      out.write("                transition: all 0.5s ease-out;\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .overlay-button:hover {\n");
      out.write("                background-color: #457b9d;\n");
      out.write("                border: 1px solid #457b9d;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /*  */\n");
      out.write("\n");
      out.write("            .info-section {\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .info-section h2 {\n");
      out.write("                font-size: 24px;\n");
      out.write("                margin-bottom: 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .info-section p {\n");
      out.write("                font-size: 16px;\n");
      out.write("                line-height: 1.5;\n");
      out.write("                margin-bottom: 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .bullet-points {\n");
      out.write("                list-style-type: disc;\n");
      out.write("                margin-left: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .bullet-points li {\n");
      out.write("                margin-bottom: 5px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <header class=\"header\">\n");
      out.write("            <div class=\"main__navbar\">\n");
      out.write("                <div class=\"container mx-auto d-flex align-items-center gap-1 justify-content-between\">\n");
      out.write("                    <div class=\"logo\">\n");
      out.write("                        <a to=\"/#\" class=\"d-flex align-items-center gap-2\">\n");
      out.write("                            <img src=\"https://cdn-icons-png.flaticon.com/512/6556/6556219.png\" alt=\"Logo\" class=\"w-8 h-8\" />\n");
      out.write("                            <h3 class=\"text-xl font-bold uppercase\">DaoTaoLaiXe</h3>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"menu\">\n");
      out.write("                        <a class=\"menu_items \" to=\"/#\">Home</a>\n");
      out.write("                        <a class=\"menu_items\" to=\"/#\">Hỗ trợ</a>\n");
      out.write("                        <a class=\"menu_items\" to=\"/#\">Thông tin lý thuyết</a>\n");
      out.write("                        <!--Cho nay la feature cua mentor, can cao navarbar rieng cho mentor nha-->\n");
      out.write("                        <a class=\"menu_items\" href=\"MainController?action=regisSchedule\" >Đăng kí lịch dạy</a>\n");
      out.write("                        <a class=\"menu_items\" href=\"MainController?action=viewSchedule\" >Lịch dạy</a>\n");
      out.write("                        <a class=\"menu_items\" to=\"/#\">Lịch thi</a>\n");
      out.write("                        <a class=\"menu_items\" href=\"test-exam.jsp\">Thi thử trắc nghiệm</a>\n");
      out.write("                        ");
      if (_jspx_meth_c_choose_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("\n");
      out.write("        <div class=\"hero-slides\">\n");
      out.write("            <div id=\"slideshow\">\n");
      out.write("                <img class=\"slide\" src=\"https://daotaolaixehcm.vn/wp-content/uploads/2019/04/dyh1539090792.jpg\"\n");
      out.write("                     alt=\"Hình ảnh 1\">\n");
      out.write("                <img class=\"slide\"\n");
      out.write("                     src=\"https://giaypheplaixe.edu.vn/wp-content/uploads/2019/09/hoc-lai-xe-o-to-o-dau-tot.jpg\"\n");
      out.write("                     alt=\"Hình ảnh 2\">\n");
      out.write("                <img class=\"slide\" src=\"https://daotaolaixehd.com.vn/wp-content/uploads/2018/04/lich-sat-hach.jpg\"\n");
      out.write("                     alt=\"Hình ảnh 3\">\n");
      out.write("                <img class=\"slide\"\n");
      out.write("                     src=\"https://daotaolaixehd.com.vn/wp-content/uploads/2017/02/1000000000000000000-1024x768.jpg\"\n");
      out.write("                     alt=\"Hình ảnh 4\">\n");
      out.write("                <div class=\"overlay\">\n");
      out.write("                    <div class=\"overlay-text\">\n");
      out.write("                        <h3>Chào mừng bạn đến với hệ thống thi thử trắc nghiệm bằng lái xe</h3>\n");
      out.write("                    </div>\n");
      out.write("                    <button class=\"overlay-button\">Thi thử ngay</button>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- nội dung web -->\n");
      out.write("        <div id=\"content\" class=\"container mt-4\">\n");
      out.write("            <h2>Thông Tin Lý Thuyết</h2>\n");
      out.write("            <p>\n");
      out.write("                Nhờ việc áp dụng quy trình đào tạo lái xe mới mẻ, tân tiến và có sự cải tiến theo tiêu chí cấp tốc. Qua các\n");
      out.write("                khóa học được tổ chức, đa phần học viên của chúng tôi luôn nắm vững được kiến thức và kỹ năng cũng như hài\n");
      out.write("                lòng với chất lượng đào tạo tại Trường.\n");
      out.write("            </p>\n");
      out.write("            <p>\n");
      out.write("                Khi đánh giá một khóa học lái xe ô tô chất lượng, mọi người đều tin tưởng vào những điều thực tế chứ không\n");
      out.write("                phải qua lời nói mời mọc hấp dẫn. Và tại đây, các hình ảnh và video thực hiện qua mỗi khóa học luôn được lưu\n");
      out.write("                trữ để học viên có thể tin tưởng.\n");
      out.write("            </p>\n");
      out.write("            <p>\n");
      out.write("                Đây là bằng chứng có sức thuyết phục nhằm giúp các bạn có thể tin tưởng vào chương trình dạy học lái xe bằng\n");
      out.write("                B2 của chúng tôi. Hiện tại Hoclaixemoto.com đang áp dụng theo 2 quy trình, mời các bạn hãy cùng tham khảo\n");
      out.write("                sau đây.\n");
      out.write("            </p>\n");
      out.write("            <ul class=\"bullet-points\">\n");
      out.write("                <li>Đạo đức người lái xe: giáo trình bài giảng được quy định của Bộ GTVT ban hành, áp dụng dành cho người\n");
      out.write("                    học lái xe tất cả các hạng.</li>\n");
      out.write("                <li>Kinh doanh vận tải: mô hình kinh doanh thịnh hành áp dụng cho người học lái xe B2.</li>\n");
      out.write("                <li>Cấu tạo, kỹ thuật ô tô: nắm rõ kiến thức cấu tạo máy và cách xử lý kỹ thuật khi phương tiện gặp phải lỗi\n");
      out.write("                    cơ bản.</li>\n");
      out.write("                <li>Biển báo giao thông: liên quan đến các loại biển báo giao thông cơ bản nhưng đặc biệt quan trọng, người\n");
      out.write("                    lái xe phải nắm rõ để không phải vi phạm.</li>\n");
      out.write("                <li>Phương pháp giải sa hình: hướng dẫn mẹo học và các phương pháp giải sa hình thực tế xuyên suốt trong quá\n");
      out.write("                    trình học lái xe. Áp dụng vào cả thực tiễn liên quan đến kiến thức Luật và cách tham gia giao thông đúng\n");
      out.write("                    quy định.</li>\n");
      out.write("                <li>Kinh nghiệm đường trường: Truyền đạt kiến thức tham gia giao thông theo hướng văn hóa và nghiêm chỉnh.\n");
      out.write("                    Kinh nghiệm thực tế và cách xử lý khi điều khiển phương tiện tham gia giao thông ở Việt Nam.</li>\n");
      out.write("            </ul>\n");
      out.write("\n");
      out.write("            <h2>Thông Tin Thực Hành</h2>\n");
      out.write("            <p>\n");
      out.write("                Phần thực hành bài thi bằng lái xe loại B2 là một phần quan trọng của kỳ thi. Dưới đây là một số thông tin\n");
      out.write("                cần bạn biết về phần thực hành:\n");
      out.write("            </p>\n");
      out.write("            <ul class=\"bullet-points\">\n");
      out.write("                <li>Thời gian thực hành: Phần thực hành thường kéo dài trong khoảng 30-45 phút.</li>\n");
      out.write("                <li>Yêu cầu thi: Bạn sẽ được yêu cầu thực hiện các kỹ năng lái xe cơ bản, bao gồm lùi xe, đỗ xe, quay đầu,\n");
      out.write("                    thay đổi làn đường, và tuân thủ luật giao thông.</li>\n");
      out.write("                <li>Điểm đánh giá: Phần thực hành sẽ được đánh giá dựa trên sự thực hiện chính xác và an toàn của các kỹ\n");
      out.write("                    năng lái xe.</li>\n");
      out.write("                <li>Đỗ bài thi: Để đỗ kỳ thi thực hành, bạn cần đạt điểm đủ theo quy định của cơ quan quản lý giao thông.\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            const menuItems = document.querySelectorAll(\".menu_items\");\n");
      out.write("\n");
      out.write("            menuItems.forEach(item => {\n");
      out.write("                item.addEventListener(\"click\", function () {\n");
      out.write("                    menuItems.forEach(item => item.classList.remove(\"menu_items_active\"));\n");
      out.write("                    this.classList.add(\"menu_items_active\");\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("\n");
      out.write("            //hero-slides \n");
      out.write("            const slides = document.querySelectorAll('.slide');\n");
      out.write("            let currentSlide = 0;\n");
      out.write("\n");
      out.write("            function showSlide(index) {\n");
      out.write("                slides.forEach((slide, i) => {\n");
      out.write("                    if (i === index) {\n");
      out.write("                        slide.classList.add('active');\n");
      out.write("                    } else {\n");
      out.write("                        slide.classList.remove('active');\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function nextSlide() {\n");
      out.write("                currentSlide = (currentSlide + 1) % slides.length;\n");
      out.write("                showSlide(currentSlide);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            setInterval(nextSlide, 3000);\n");
      out.write("\n");
      out.write("            showSlide(currentSlide);\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("\n");
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

  private boolean _jspx_meth_c_choose_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:choose
    org.apache.taglibs.standard.tag.common.core.ChooseTag _jspx_th_c_choose_0 = (org.apache.taglibs.standard.tag.common.core.ChooseTag) _jspx_tagPool_c_choose.get(org.apache.taglibs.standard.tag.common.core.ChooseTag.class);
    _jspx_th_c_choose_0.setPageContext(_jspx_page_context);
    _jspx_th_c_choose_0.setParent(null);
    int _jspx_eval_c_choose_0 = _jspx_th_c_choose_0.doStartTag();
    if (_jspx_eval_c_choose_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                            ");
        if (_jspx_meth_c_when_0((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_choose_0, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("                            ");
        if (_jspx_meth_c_otherwise_0((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_choose_0, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("                        ");
        int evalDoAfterBody = _jspx_th_c_choose_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_choose_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_choose.reuse(_jspx_th_c_choose_0);
      return true;
    }
    _jspx_tagPool_c_choose.reuse(_jspx_th_c_choose_0);
    return false;
  }

  private boolean _jspx_meth_c_when_0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_choose_0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:when
    org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_when_0 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _jspx_tagPool_c_when_test.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
    _jspx_th_c_when_0.setPageContext(_jspx_page_context);
    _jspx_th_c_when_0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_choose_0);
    _jspx_th_c_when_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${account != null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_when_0 = _jspx_th_c_when_0.doStartTag();
    if (_jspx_eval_c_when_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                                ");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${account.getId()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("\n");
        out.write("                            ");
        int evalDoAfterBody = _jspx_th_c_when_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_when_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_0);
      return true;
    }
    _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_0);
    return false;
  }

  private boolean _jspx_meth_c_otherwise_0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_choose_0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:otherwise
    org.apache.taglibs.standard.tag.common.core.OtherwiseTag _jspx_th_c_otherwise_0 = (org.apache.taglibs.standard.tag.common.core.OtherwiseTag) _jspx_tagPool_c_otherwise.get(org.apache.taglibs.standard.tag.common.core.OtherwiseTag.class);
    _jspx_th_c_otherwise_0.setPageContext(_jspx_page_context);
    _jspx_th_c_otherwise_0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_choose_0);
    int _jspx_eval_c_otherwise_0 = _jspx_th_c_otherwise_0.doStartTag();
    if (_jspx_eval_c_otherwise_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                                <a class=\"btn_login\"  href=\"login.jsp\">Log in</a>\n");
        out.write("                            ");
        int evalDoAfterBody = _jspx_th_c_otherwise_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_otherwise_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_otherwise.reuse(_jspx_th_c_otherwise_0);
      return true;
    }
    _jspx_tagPool_c_otherwise.reuse(_jspx_th_c_otherwise_0);
    return false;
  }
}
