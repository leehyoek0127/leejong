/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.50
 * Generated at: 2020-03-03 07:59:08 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Mypage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

	request.setCharacterEncoding("UTF-8");

      out.write("\r\n");
      out.write("\r\n");

	//2020_01_02 수정부분
	String url = request.getServletPath();
	session.setAttribute("url", url);
	String includeurl = "header.jsp";
	String uss = (String) session.getAttribute("id");

	String log = "로그인";
	if (uss == null)
		uss = "GUEST";
	else {
		log = "로그아웃";
		includeurl = "sign_login.jsp";
	}
	//수정부분 끝

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<meta name=\"Generator\" content=\"EditPlus®\">\r\n");
      out.write("<meta name=\"Author\" content=\"\">\r\n");
      out.write("<meta name=\"Keywords\" content=\"\">\r\n");
      out.write("<meta name=\"Description\" content=\"\">\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css\\join.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/classic.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/classic.date.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/classic.time.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/style2.css\" media=\"screen\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/materialFormStyles.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/borderRightLeft.css\" media=\"screen\">\r\n");
      out.write("<script src=\"js/materialForm.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/signbutton.css\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!--기본적인 body등의 css-->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/basicStyle.css\" media=\"screen\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/navmid33.css\">\r\n");
      out.write("<!-- 합쳐지고 최소화된 최신 CSS -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css\">\r\n");
      out.write("<!-- 부가적인 테마 -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/jquery.infinitecarousel.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<title>sign</title>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/jquery-ui.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/datepicker.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/common.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/common/form_check.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css\\join.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/Mypage.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/classic.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/classic.date.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/classic.time.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/style2.css\" media=\"screen\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/materialFormStyles.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/borderRightLeft.css\" media=\"screen\">\r\n");
      out.write("<script src=\"js/materialForm.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/signbutton.css\">\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/galboardstyle.css\">\r\n");
      out.write("\r\n");
      out.write("<!-- -----------------다음 주소 api ----------------------------------------->\r\n");
      out.write("<script src=\"https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js\"></script>\r\n");
      out.write("<!--기본적인 body등의 css-->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/basicStyle.css\" media=\"screen\">\r\n");
      out.write("<!-- 합쳐지고 최소화된 최신 CSS -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css\">\r\n");
      out.write("<!-- 부가적인 테마 -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/jquery.infinitecarousel.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<!----------------------------alam form 추가 2020.01.06-------------------------->\r\n");
      out.write("<!----------------------------alam form 추가 2020.01.06-------------------------->\r\n");
      out.write("\r\n");
      out.write("<!--2020.01.03 추가 css 분리-->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/logform.css\" media=\"screen\">\r\n");
      out.write("<!--2020.01.03 추가 javascript.가입기능 분리-->\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/signjs.js\"></script>\r\n");
      out.write("<!----------------------------서브메뉴마우스오버기능-------------------------->\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/subMenuMouseOver.css\">\r\n");
      out.write("<!----------------------------회원가입스크립트랑 스타일(따로 빼면 에러)-------------------------->\r\n");
      out.write("<script type='text/javascript'>\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\t$('#forgot_username_link').tipsy({\r\n");
      out.write("\t\t\tgravity : 'w'\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("<link href=\"css/front.css\" media=\"screen, projection\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script src=\"js/jquery2.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<link href=\"css/frontlogin.css\" media=\"screen, projection\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t$(document).ready(function() {\r\n");
      out.write("\r\n");
      out.write("\t\t$(\".signin\").click(function(e) {\r\n");
      out.write("\t\t\te.preventDefault();\r\n");
      out.write("\t\t\t$(\"fieldset#signin_menu\").toggle();\r\n");
      out.write("\t\t\t$(\".signin\").toggleClass(\"menu-open\");\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t$(\"fieldset#signin_menu\").mouseup(function() {\r\n");
      out.write("\t\t\treturn false\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t$(document).mouseup(function(e) {\r\n");
      out.write("\t\t\tif ($(e.target).parent(\"a.signin\").length == 0) {\r\n");
      out.write("\t\t\t\t$(\".signin\").removeClass(\"menu-open\");\r\n");
      out.write("\t\t\t\t$(\"fieldset#signin_menu\").hide();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t$(document).ready(function() {\r\n");
      out.write("\t\t$(\".mypage\").click(function(e) {\r\n");
      out.write("\t\t\te.preventDefault();\r\n");
      out.write("\t\t\t$(\"fieldset#mypage_menu\").toggle();\r\n");
      out.write("\t\t\t$(\".mypage\").toggleClass(\"menu-open\");\r\n");
      out.write("\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t$(\"fieldset#mypage_menu\").mouseup(function() {\r\n");
      out.write("\t\t\treturn false\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t$(document).mouseup(function(e) {\r\n");
      out.write("\t\t\tif ($(e.target).parent(\"a.mypage\").length == 0) {\r\n");
      out.write("\t\t\t\t$(\".mypage\").removeClass(\"menu-open\");\r\n");
      out.write("\t\t\t\t$(\"fieldset#mypage_menu\").hide();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("<!----------------------------회원가입스크립트랑 스타일여기까지------------------------------------>\r\n");
      out.write("<script>\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\tvar shrinkHeader = 30;\r\n");
      out.write("\t\tvar shrinkhollow = 465;\r\n");
      out.write("\t\t$(window).scroll(function() {\r\n");
      out.write("\t\t\tvar scroll = getCurrentScroll();\r\n");
      out.write("\t\t\tif (scroll >= shrinkHeader) {\r\n");
      out.write("\t\t\t\t$('#navtop').addClass('shrink');\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\t$('#navtop').removeClass('shrink');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (scroll >= shrinkhollow) {\r\n");
      out.write("\t\t\t\t$('#navtop').addClass('shrinkhollow');\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\t$('#navtop').removeClass('shrinkhollow');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\tfunction getCurrentScroll() {\r\n");
      out.write("\t\t\treturn window.pageYOffset || document.documentElement.scrollTop;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<TITLE>마이페이지</TITLE>\r\n");
      out.write("<style>\r\n");
      out.write("#my_frame {\r\n");
      out.write("\tmargin-left: -60px;\r\n");
      out.write("\twidth: 1300px;\r\n");
      out.write("\theight: 1600px;\r\n");
      out.write("\toverflow: hidden;\r\n");
      out.write("\toverflow-x: hidden;\r\n");
      out.write("\toverflow-y: hidden;\r\n");
      out.write("\tcursor: pointer;\r\n");
      out.write("\tborder: 1px solid rgba(0, 0, 0, 0.1);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<script src=\"//code.jquery.com/jquery.min.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("\tfunction open_in_frame(url) {\r\n");
      out.write("\t\t$('#my_frame').attr('src', url);\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("<!-- 부트스트랩 -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\">\r\n");
      out.write("<style>\r\n");
      out.write("p {\r\n");
      out.write("\tmargin: 20px 0px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\"></script>\r\n");
      out.write("<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<header>\r\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, includeurl, out, false);
      out.write("\r\n");
      out.write("\t</header>\r\n");
      out.write("\r\n");
      out.write("\t<section id=\"main\">\r\n");
      out.write("\t\t<section id=\"mainright\" style=\"height: 160%;\">\r\n");
      out.write("\t\t\t<div id=\"matList\">\r\n");
      out.write("\t\t\t\t<div class=\"container\" id=\"formOutterWrapper\">\r\n");
      out.write("\t\t\t\t\t<center>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"sign_title\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("'sMypage</div>\r\n");
      out.write("\t\t\t\t\t</center>\r\n");
      out.write("\t\t\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"col\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<ul class=\"nav nav-tabs\" style=\"margin-bottom: -47px; border-bottom: none; margin-left: -75px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"nav-item\"><button class=\"nav-link active\" onclick='open_in_frame(\"mypage.do?command=mypage&id=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\")'>회원정보수정</button></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"nav-item\"><button class=\"nav-link active\" onclick='open_in_frame(\"\")'>대관내역</button></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"nav-item\"><button class=\"nav-link active\" onclick='open_in_frame(\"\")'>메뉴</button></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"nav-item\"><button class=\"nav-link active\" onclick='open_in_frame(\"\")'>메뉴</button></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"nav-item\"><button class=\"nav-link active\" onclick='open_in_frame(\"signdel.jsp\")'>회원탈퇴</button></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<iframe id='my_frame'></iframe>\r\n");
      out.write("\t\t\t\t\t</center>\r\n");
      out.write("\t\t\t\t\t<script src=\"https://code.jquery.com/jquery-2.2.3.min.js\" integrity=\"sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo=\" crossorigin=\"anonymous\">\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t<script src=\"js/materialForm.js\">\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t</script>\r\n");
      out.write("\t\t</section>\r\n");
      out.write("\t</section>\r\n");
      out.write("\t<footer>\r\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Footer.jsp", out, false);
      out.write("\r\n");
      out.write("\t</footer>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
