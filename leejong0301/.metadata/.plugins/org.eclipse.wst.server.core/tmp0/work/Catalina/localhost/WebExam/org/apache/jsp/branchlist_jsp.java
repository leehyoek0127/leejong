/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.50
 * Generated at: 2020-03-02 05:22:06 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.GroundDto;
import model.BranchDto;
import java.util.ArrayList;

public final class branchlist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("model.BranchDto");
    _jspx_imports_classes.add("model.GroundDto");
    _jspx_imports_classes.add("java.util.ArrayList");
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

      out.write("\r\n");
      out.write("\r\n");
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

ArrayList<BranchDto> BranchList = (ArrayList<BranchDto>) request.getAttribute("BranchList");

      out.write("\r\n");
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
      out.write("<title>풋살장리스트</title>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/jquery-ui.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/datepicker.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/common.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/common/form_check.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css\\find.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/signbutton.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/find.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/classic.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/classic.date.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/classic.time.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/footer.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/style2.css\" media=\"screen\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/findid_materialFormStyles.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/borderRightLeft.css\" media=\"screen\">\r\n");
      out.write("<script src=\"js/materialForm.js\"></script>\r\n");
      out.write("<!--기본적인 body등의 css-->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/basicStyle.css\" media=\"screen\">\r\n");
      out.write("<!-- 합쳐지고 최소화된 최신 CSS -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css\">\r\n");
      out.write("<!-- 부가적인 테마 -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/jquery.infinitecarousel.js\"></script>\r\n");
      out.write("\r\n");
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
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t$(document).ready(function() {\r\n");
      out.write("\t\t$(\".signin\").click(function(e) {\r\n");
      out.write("\t\t\te.preventDefault();\r\n");
      out.write("\t\t\t$(\"fieldset#signin_menu\").toggle();\r\n");
      out.write("\t\t\t$(\".signin\").toggleClass(\"menu-open\");\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t$(\"fieldset#signin_menu\").mouseup(function() {\r\n");
      out.write("\t\t\treturn false\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t$(document).mouseup(function(e) {\r\n");
      out.write("\t\t\tif ($(e.target).parent(\"a.signin\").length == 0) {\r\n");
      out.write("\t\t\t\t$(\".signin\").removeClass(\"menu-open\");\r\n");
      out.write("\t\t\t\t$(\"fieldset#signin_menu\").hide();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
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
      out.write("<style>\r\n");
      out.write(".form-group {\r\n");
      out.write("\theight: 70px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".form-group input {\r\n");
      out.write("\tfloat: left;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".button {\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<style>\r\n");
      out.write(".signbutton {\r\n");
      out.write("\tbackground-color: #4CAF50; /* Green */\r\n");
      out.write("\tborder: none;\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("\tpadding: 9px 36px;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("\tdisplay: inline-block;\r\n");
      out.write("\tfont-size: 18px;\r\n");
      out.write("\tmargin: 4px 2px;\r\n");
      out.write("\t-webkit-transition-duration: 0.4s; /* Safari */\r\n");
      out.write("\ttransition-duration: 0.4s;\r\n");
      out.write("\tcursor: pointer;\r\n");
      out.write("\theight: 51px;\r\n");
      out.write("\twidth: 153px;\r\n");
      out.write("\tborder-radius: 5px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".signbutton5:hover {\r\n");
      out.write("\tbackground-color: #290080;\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".signbutton5 {\r\n");
      out.write("\tbackground-color: #2c5d88;\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".signbuttoncancel:hover {\r\n");
      out.write("\tbackground-color: #e0e0e0;\r\n");
      out.write("\tcolor: #c8c8c8;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".signbuttoncancel {\r\n");
      out.write("\tbackground-color: #e0e0e0;\r\n");
      out.write("\tcolor: black;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("<!--\r\n");
      out.write("-->\r\n");
      out.write(".signbutton2 {\r\n");
      out.write("\tbackground-color: #4CAF50; /* Green */\r\n");
      out.write("\tborder: none;\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("\tpadding: 9px 36px;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("\tdisplay: inline-block;\r\n");
      out.write("\tfont-size: 18px;\r\n");
      out.write("\tmargin: 4px 2px;\r\n");
      out.write("\t-webkit-transition-duration: 0.4s; /* Safari */\r\n");
      out.write("\ttransition-duration: 0.4s;\r\n");
      out.write("\tcursor: pointer;\r\n");
      out.write("\theight: 51px;\r\n");
      out.write("\twidth: 153px;\r\n");
      out.write("\tborder-radius: 5px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".signbutton2_5:hover {\r\n");
      out.write("\tbackground-color: #290080;\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".signbutton2_5 {\r\n");
      out.write("\tbackground-color: #bfd4e2;\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".signbutton2cancel:hover {\r\n");
      out.write("\tbackground-color: #e0e0e0;\r\n");
      out.write("\tcolor: #c8c8c8;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".signbutton2cancel {\r\n");
      out.write("\tbackground-color: #e0e0e0;\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<!-- 드롭다운메뉴 -->\r\n");
      out.write("<style>\r\n");
      out.write("* {\r\n");
      out.write("\tmargin: 0;\r\n");
      out.write("\tpadding: 0;\r\n");
      out.write("\tfont-family: 'Roboto', sans-serif;\r\n");
      out.write("\tbox-sizing: border-box;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("nav {\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\tbackground: #2a2a2a;\r\n");
      out.write("\tfont-size: 16px;\r\n");
      out.write("\tbox-shadow: 0 0 10px rgba(0, 0, 0, 1);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/* first stage */\r\n");
      out.write("nav>ul {\r\n");
      out.write("\tposition: relative;\r\n");
      out.write("\tdisplay: flex;\r\n");
      out.write("\tjustify-content: center;\r\n");
      out.write("\twidth: 1200px;\r\n");
      out.write("\tmargin: 0 auto;\r\n");
      out.write("\tpadding: 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("nav a {\r\n");
      out.write("\tdisplay: block;\r\n");
      out.write("\tcolor: #fff;\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("nav ul li {\r\n");
      out.write("\tcolor: #fff;\r\n");
      out.write("\tlist-style: none;\r\n");
      out.write("\ttransition: 0.5s;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("nav>ul>li>a {\r\n");
      out.write("\tpadding: 15px 25px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("nav ul>li.submenu>a:after {\r\n");
      out.write("\tposition: relative;\r\n");
      out.write("\tfloat: right;\r\n");
      out.write("\tcontent: '';\r\n");
      out.write("\tmargin-left: 17px;\r\n");
      out.write("\tmargin-top: 13px;\r\n");
      out.write("\tborder-left: 7px solid transparent;\r\n");
      out.write("\tborder-right: 7px solid transparent;\r\n");
      out.write("\tborder-top: 10px solid #fff;\r\n");
      out.write("\tborder-bottom: 7px solid transparent;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("nav ul>li.submenu:hover>a:after {\r\n");
      out.write("\tmargin-top: 7px;\r\n");
      out.write("\tborder-top: 7px solid transparent;\r\n");
      out.write("\tborder-bottom: 10px solid #fff;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("nav>ul>li:hover {\r\n");
      out.write("\tbackground: #2c5d88;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/* second stage (the mega-menu) */\r\n");
      out.write("nav ul.megamenu {\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\tdisplay: flex;\r\n");
      out.write("\tflex-wrap: wrap;\r\n");
      out.write("\twidth: 1200px;\r\n");
      out.write("\ttop: -9999px;\r\n");
      out.write("\tleft: 0;\r\n");
      out.write("\tpadding: 0px 98px 106px 128px;\r\n");
      out.write("\tbackground: #fff;\r\n");
      out.write("\ttext-align: left;\r\n");
      out.write("\tborder-top: 5px solid #2c5d88;\r\n");
      out.write("\tbox-shadow: 0 5px 10px rgba(0, 0, 0, 0.5);\r\n");
      out.write("\tz-index: 1;\r\n");
      out.write("\tmargin-top: 0px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("nav ul li:hover ul.megamenu {\r\n");
      out.write("\ttop: 100%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/* third stage (child-menus in the mega-menu) */\r\n");
      out.write("nav ul.megamenu ul {\r\n");
      out.write("\twidth: 25%;\r\n");
      out.write("\tmargin-bottom: 40px;\r\n");
      out.write("\tcolor: #000;\r\n");
      out.write("\tbox-shadow: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("nav ul.megamenu h4 {\r\n");
      out.write("\tmargin-bottom: 15px;\r\n");
      out.write("\ttext-transform: uppercase;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("nav ul.megamenu ul li {\r\n");
      out.write("\tdisplay: block;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("nav ul.megamenu ul li a {\r\n");
      out.write("\tmargin-top: 10px;\r\n");
      out.write("\ttransition: 0.5s;\r\n");
      out.write("\tcolor: #000;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("nav ul.megamenu ul li a:hover {\r\n");
      out.write("\tcolor: #4096ee;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<style>\r\n");
      out.write(".branchdetailicon {\r\n");
      out.write("\twidth: 86px;\r\n");
      out.write("\theight: 86px;\r\n");
      out.write("\tfloat: left;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<!-- --------- -->\r\n");
      out.write("<!-- 한글글씨체적용 /아이디찾기 제목-->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/galboardstyle.css\">\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("</head>\r\n");
      out.write("<!-- ---------------------------------------------------------------------------------------------- -->\r\n");
      out.write("<body>\r\n");
      out.write("\t<header>\r\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, includeurl, out, false);
      out.write("\r\n");
      out.write("\t</header>\r\n");
      out.write("\t<!-- 전체지점보기/내려오는메뉴 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->\r\n");
      out.write("\t<nav>\r\n");
      out.write("\t\t<ul>\r\n");
      out.write("\t\t\t<li class=\"submenu\"><a href=\"#\" title=\"Unser Produktsortiment\" style=\"pointer-events: none; cursor: default; text-decoration: none; color: white; text-align: bold; font-weight: bold; font-size: 22px;\">전체지점보기</a>\r\n");
      out.write("\t\t\t\t<ul class=\"megamenu\">\r\n");
      out.write("\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t");

							if (BranchList != null) {
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<h4>서울, 경기 지역</h4>\r\n");
      out.write("\t\t\t\t\t\t");
for (int i = 0; i < BranchList.size(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"branchlist.do?command=branchdetail&branch_no=");
      out.print(BranchList.get(i).getBranch_no());
      out.write("\" style=\"text-decoration: none; color: black;\">\r\n");
      out.write("\t\t\t\t\t\t");
if(BranchList.get(i).getBranch_location().contains("서울") || BranchList.get(i).getBranch_location().contains("경기")){
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.print( BranchList.get(i).getBranch_name());
} 
      out.write("</a></li>\r\n");
      out.write("\t\t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t<h4>대전, 충청 지역</h4>\r\n");
      out.write("\t\t\t\t\t\t");
for (int i = 0; i < BranchList.size(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"branchlist.do?command=branchdetail&branch_no=");
      out.print(BranchList.get(i).getBranch_no());
      out.write("\" style=\"text-decoration: none; color: black;\">\r\n");
      out.write("\t\t\t\t\t\t");
if(BranchList.get(i).getBranch_location().contains("대전") || BranchList.get(i).getBranch_location().contains("충청")){
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.print( BranchList.get(i).getBranch_name());
} 
      out.write("</a></li>\r\n");
      out.write("\t\t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t<h4>부산, 경상 지역</h4>\r\n");
      out.write("\t\t\t\t\t\t");
for (int i = 0; i < BranchList.size(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"branchlist.do?command=branchdetail&branch_no=");
      out.print(BranchList.get(i).getBranch_no());
      out.write("\" style=\"text-decoration: none; color: black;\">\r\n");
      out.write("\t\t\t\t\t\t");
if(BranchList.get(i).getBranch_location().contains("부산") || BranchList.get(i).getBranch_location().contains("경상")){
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.print( BranchList.get(i).getBranch_name());
} 
      out.write("</a></li>\r\n");
      out.write("\t\t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t<h4>광주, 전라 지역</h4>\r\n");
      out.write("\t\t\t\t\t\t");
for (int i = 0; i < BranchList.size(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"branchlist.do?command=branchdetail&branch_no=");
      out.print(BranchList.get(i).getBranch_no());
      out.write("\" style=\"text-decoration: none; color: black;\">\r\n");
      out.write("\t\t\t\t\t\t");
if(BranchList.get(i).getBranch_location().contains("광주") || BranchList.get(i).getBranch_location().contains("전라")){
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.print( BranchList.get(i).getBranch_name());
} 
      out.write("</a></li>\r\n");
      out.write("\t\t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t<h4>제주 지역</h4>\r\n");
      out.write("\t\t\t\t\t\t");
for (int i = 0; i < BranchList.size(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"branchlist.do?command=branchdetail&branch_no=");
      out.print(BranchList.get(i).getBranch_no());
      out.write("\" style=\"text-decoration: none; color: black;\">\r\n");
      out.write("\t\t\t\t\t\t");
if(BranchList.get(i).getBranch_location().contains("제주")){
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.print( BranchList.get(i).getBranch_name());
} 
      out.write("</a></li>\r\n");
      out.write("\t\t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t</ul></li>\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("\t</nav>\r\n");
      out.write("\t<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->\r\n");
      out.write("\t<div style=\"margin-top: 80px;\"></div>\r\n");
      out.write("\t<div id=\"mainleft\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t<div id=\"leftbanner\">\r\n");
      out.write("\t\t\t<div id=\"banner1\">\r\n");
      out.write("\t\t\t\t<img src=\"img/20191211.jpg\" width=\"100%\" height=\"100%\" />\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div id=\"banner3\">\r\n");
      out.write("\t\t\t\t<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d127.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr\" width=\"100%\" height=\"100%\" frameborder=\"0\" style=\"border: 0;\" allowfullscreen=\"\"></iframe>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<section id=\"main\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t<section id=\"mainright\">\r\n");
      out.write("\t\t\t<div id=\"matList\">\r\n");
      out.write("\t\t\t\t<div class=\"container\" id=\"formOutterWrapper\">\r\n");
      out.write("\t\t\t\t\t<center>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"writeboardtitle\" style=\"text-align: center; font-size: 45px; margin-bottom: 70px;\">풋살장 목록</div>\r\n");
      out.write("\t\t\t\t\t</center>\r\n");
      out.write("\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t");

								for (int i = 0; i < BranchList.size(); i++) {
									String[] convenarr = BranchList.get(i).getBranch_convenience().split(",");
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<td rowspan=\"6\"><img src=\"img/");
      out.print(BranchList.get(i).getBranch_pic());
      out.write("\" style=\"width: 430px; height: 285px; \"></td>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"color: #1b4367; width: 675px; height: 80px; font-weight: bold; font-size: 30px; padding-left: 20px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<!-- 지점이름 --> ");
      out.print(BranchList.get(i).getBranch_name());
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<hr style=\"width: 720px; border-top: 2.3px solid #254765;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"padding-left: 20px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div style=\"display: inline-flex;\">\r\n");
      out.write("<img src=");
if (convenarr[0].contains("o")) {
      out.write(" \"img/parking_o.png\"");
} else if (convenarr[0].contains("x")) {
      out.write("\"img/parking_x.png\"");
}
      out.write(" alt=\"주차장\" class=\"branchdetailicon\" />\r\n");
      out.write("<img src=");
if (convenarr[1].contains("o")) {
      out.write(" \"img/aircon_o.png\"");
} else if (convenarr[1].contains("x")) {
      out.write("\"img/aircon_x.png\"");
}
      out.write(" alt=\"냉난방\" class=\"branchdetailicon\" />\r\n");
      out.write("<img src=");
if (convenarr[2].contains("o")) {
      out.write(" \"img/shower_o.png\"");
} else if (convenarr[2].contains("x")) {
      out.write("\"img/shower_x.png\"");
}
      out.write(" alt=\"샤워실\" class=\"branchdetailicon\" />\r\n");
      out.write("<img src=");
if (convenarr[3].contains("o")) {
      out.write(" \"img/ball_o.png\"");
} else if (convenarr[3].contains("x")) {
      out.write("\"img/ball_x.png\"");
}
      out.write(" alt=\"공대여\" class=\"branchdetailicon\" />\r\n");
      out.write("<img src=");
if (convenarr[4].contains("o")) {
      out.write(" \"img/vest_o.png\"");
} else if (convenarr[4].contains("x")) {
      out.write("\"img/vest_x.png\"");
}
      out.write(" alt=\"팀조끼대여\" class=\"branchdetailicon\" />\r\n");
      out.write("<img src=");
if (convenarr[5].contains("o")) {
      out.write(" \"img/shoes_o.png\"");
} else if (convenarr[5].contains("x")) {
      out.write("\"img/shoes_x.png\"");
}
      out.write(" alt=\"풋살화대여\" class=\"branchdetailicon\" />\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"padding-left: 20px; font-size: 17px;\"><img src=\"img/iconlocation.png\" style=\"padding-right: 12px;\"> <!-- 지점주소 -->");
      out.print(BranchList.get(i).getBranch_location());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"padding-left: 20px; font-size: 17px; letter-spacing: 2px;\"><img src=\"img/iconphone.png\" style=\"padding-right: 12px;\"> <!-- 지점전화번호 -->");
      out.print(BranchList.get(i).getBranch_tel());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"button\" value=\"지점소개\" onclick=\"script: location.href='branchlist.do?command=branchdetail&branch_no=");
      out.print(BranchList.get(i).getBranch_no());
      out.write("'\" style=\"float: left; margin-left: 250px;\"class=\"signbutton2 signbutton2_5\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"button\" value=\"대관하기\" class=\"signbutton signbutton5\"  style=\"float: left;\" onclick=\"script: location.href='branchlist.do?command=reservationclick&branch_no=");
      out.print(BranchList.get(i).getBranch_no());
      out.write("'\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</tbody>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t");

						}
					
      out.write("\r\n");
      out.write("\t\t\t\t\t");

						}
					
      out.write("\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<script src=\"https://code.jquery.com/jquery-2.2.3.min.js\" integrity=\"sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo=\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("\t\t\t\t<script src=\"js/materialForm.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t</section>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t</section>\r\n");
      out.write("\t<footer id=\"footer\">\r\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Footer.jsp", out, false);
      out.write("\r\n");
      out.write("\t</footer>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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