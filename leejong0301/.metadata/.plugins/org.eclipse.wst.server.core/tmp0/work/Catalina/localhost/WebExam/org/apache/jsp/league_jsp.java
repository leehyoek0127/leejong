/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.50
 * Generated at: 2020-03-01 13:39:54 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class league_jsp extends org.apache.jasper.runtime.HttpJspBase
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

//2020_01_02 수정부분
	String url = request.getServletPath();
	session.setAttribute("url",url);
	String includeurl = "header.jsp";
	String uss = (String)session.getAttribute("id");
	String log = "로그인";
	if(uss==null)
		uss="GUEST";
	 else{
	 	log="로그아웃";
		includeurl = "sign_login.jsp";
	 }
//수정부분 끝

      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<meta name=\"Generator\" content=\"EditPlus®\">\r\n");
      out.write("<meta name=\"Author\" content=\"\">\r\n");
      out.write("<meta name=\"Keywords\" content=\"\">\r\n");
      out.write("<meta name=\"Description\" content=\"\">\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n");
      out.write("<title>League</title>\r\n");
      out.write("<!--기본적인 body등의 css-->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/basicStyle.css\" media=\"screen\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/navmid33.css\">\r\n");
      out.write("<!--Q&A에 펠요한 css-->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/Q&Astyle.css\" media=\"screen\">\r\n");
      out.write("<!-- Q&A에 필요한 script -->\r\n");
      out.write("<script type=\"text/javascript\" src=\"Q&Ascript.js\"></script>\r\n");
      out.write("<!--주메뉴밑줄기능-->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/borderRightLeft.css\" media=\"screen\">\r\n");
      out.write("<!-- 광호Q&A -->\r\n");
      out.write("<script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js\"></script>\r\n");
      out.write("<!-- 합쳐지고 최소화된 최신 CSS -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css\">\r\n");
      out.write("<!-- 부가적인 테마 -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css\">\r\n");
      out.write("<!--2020.01.03 추가 css 분리-->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/logform.css\" media=\"screen\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/leaguestyle.css\" media=\"screen\">\r\n");
      out.write("<!--2020.01.03 추가 javascript.가입기능 분리-->\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/signjs.js\"></script>\r\n");
      out.write("<!--서브메뉴부르는css-->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/style2.css\" media=\"screen\">\r\n");
      out.write("<!--2020.01.06footer css추가 -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/footer.css\">\r\n");
      out.write("<!--배너2 자동슬라이드-->\r\n");
      out.write("<script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/jquery.infinitecarousel.js\"></script>\r\n");
      out.write("<!----------------------------서브메뉴마우스오버기능-------------------------->\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/subMenuMouseOver.css\">\r\n");
      out.write("<!----------------------------회원가입스크립트랑 스타일(따로 빼면 에러)-------------------------->\r\n");
      out.write("<script type='text/javascript'>\r\n");
      out.write("\t\t$(function() {\r\n");
      out.write("\t\t  $('#forgot_username_link').tipsy({gravity: 'w'});   \r\n");
      out.write("\t\t});\r\n");
      out.write("\t</script>\r\n");
      out.write("<link href=\"css/front.css\" media=\"screen, projection\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script src=\"js/jquery2.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t$(document).ready(function() {\r\n");
      out.write("\t\t\t\t$(\".signin\").click(function(e) {          \r\n");
      out.write("\t\t\t\t\te.preventDefault();\r\n");
      out.write("\t\t\t\t\t$(\"fieldset#signin_menu\").toggle();\r\n");
      out.write("\t\t\t\t\t$(\".signin\").toggleClass(\"menu-open\");\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\t$(\"fieldset#signin_menu\").mouseup(function() {\r\n");
      out.write("\t\t\t\t\treturn false\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\t$(document).mouseup(function(e) {\r\n");
      out.write("\t\t\t\t\tif($(e.target).parent(\"a.signin\").length==0) {\r\n");
      out.write("\t\t\t\t\t\t \r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t$(\".signin\").removeClass(\"menu-open\");\r\n");
      out.write("\t\t\t\t\t\t$(\"fieldset#signin_menu\").hide();\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t</script>\r\n");
      out.write("<!----------------------------alam form 추가 2020.01.06-------------------------->\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t$(document).ready(function() {\r\n");
      out.write("\t\t\t\t$(\".mypage\").click(function(e) {          \r\n");
      out.write("\t\t\t\t\te.preventDefault();\r\n");
      out.write("\t\t\t\t\t$(\"fieldset#mypage_menu\").toggle();\r\n");
      out.write("\t\t\t\t\t$(\".mypage\").toggleClass(\"menu-open\");\r\n");
      out.write("\t\t\t\t});\t\t\r\n");
      out.write("\t\t\t\t$(\"fieldset#mypage_menu\").mouseup(function() {\r\n");
      out.write("\t\t\t\t\treturn false\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\t$(document).mouseup(function(e) {\r\n");
      out.write("\t\t\t\t\tif($(e.target).parent(\"a.mypage\").length!=0) {\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t$(\".mypage\").removeClass(\"menu-open\");\r\n");
      out.write("\t\t\t\t\t\t$(\"fieldset#mypage_menu\").hide();\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t</script>\r\n");
      out.write("<!----------------------------회원가입스크립트랑 스타일여기까지------------------------------------>\r\n");
      out.write("<script>\r\n");
      out.write("\t /*스크롤 내리면 메뉴 위치 이동하는 기능------따로빼면 작동xxxxxx*/\r\n");
      out.write("\t\t$(function(){\r\n");
      out.write("\t\t\t var shrinkHeader = 30;\r\n");
      out.write("\t\t\t var shrinkhollow = 465;\r\n");
      out.write("\t\t\t  $(window).scroll(function() {\r\n");
      out.write("\t\t\t\tvar scroll = getCurrentScroll();\r\n");
      out.write("\t\t\t\t  if ( scroll >= shrinkHeader ) {\r\n");
      out.write("\t\t\t\t\t   $('#navtop').addClass('shrink');  \r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\telse {\r\n");
      out.write("\t\t\t\t\t\t$('#navtop').removeClass('shrink');\t\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t   if(scroll>= shrinkhollow ){\r\n");
      out.write("\t\t\t\t\t\t$('#navtop').addClass('shrinkhollow');  \r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\telse {\r\n");
      out.write("\t\t\t\t\t\t$('#navtop').removeClass('shrinkhollow');\t\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\tfunction getCurrentScroll() {\r\n");
      out.write("\t\t\treturn window.pageYOffset || document.documentElement.scrollTop;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<header>\r\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, includeurl, out, false);
      out.write("\r\n");
      out.write("\t</header>\r\n");
      out.write("\t<div id=\"mainleft\">\r\n");
      out.write("\t\t<div id=\"leftbanner\">\r\n");
      out.write("\t\t\t<div id=\"banner1\">\r\n");
      out.write("\t\t\t\t<img src=\"img/20191211.jpg\" width=\"100%\" height=\"100%\" />\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div id=\"banner3\">\r\n");
      out.write("\t\t\t\t<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d127.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr\" width=\"100%\" height=\"100%\" frameborder=\"0\" style=\"border: 0;\" allowfullscreen=\"\"> </iframe>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<section id=\"main\">\r\n");
      out.write("\t\t<section id=\"mainright\">\r\n");
      out.write("\t\t\t<div id=\"matList\">\r\n");
      out.write("\t\t\t\t<div class=\"sec_ban2\">\r\n");
      out.write("\t\t\t\t\t<ul class=\"nav_ban\">\r\n");
      out.write("\t\t\t\t\t\t<li>리그 랭킹</li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t<table class=\"table table-striped\">\r\n");
      out.write("\t\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t\t<tr id=\"tabletitle\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<th></th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th scope=\"col\" class=\"thtitle\" style=\"text-align: center\"><span>제목</span></th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th scope=\"col\" class=\"thname\"><span>작성자</span></th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th scope=\"col\" class=\"thdate\"><span>작성일</span></th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th scope=\"col\" class=\"thview\"><span>조회</span></th>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"thgongji\">공지</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"thtitle\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a href>필 독 !! 그린컴퓨터 풋살팀 공지사항</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"thname\">김 팡 호</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"thdate\">2019. 12. 10</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"thview\">30,589</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"thgongji\">공지</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"thtitle\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a href> 사진 깨짐 현상이 일어나는 이유 !</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"thname\">김 팡 호</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"thdate\">2019. 12. 08</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"thview\">89,152</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"thgongji\">공지</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"thtitle\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a href> 자유롭게 팀의 사진을 올리시면 됩니다 !</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"thname\">김 팡 호</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"thdate\">2019. 12. 05</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"thview\">60,895</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<a class=\"btn btn-default pull-right\">글쓰기</a>\r\n");
      out.write("\t\t\t\t<div class=\"text-center\">\r\n");
      out.write("\t\t\t\t\t<ul class=\"pagination\">\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#\">1</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#\">2</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#\">3</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#\">4</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#\">5</a></li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"galsearch\">\r\n");
      out.write("\t\t\t\t\t<img src=\"img/search.jpg\" id=\"leaguesearchimg\">\r\n");
      out.write("\t\t\t\t\t<select class=\"form-control\" id=\"leagueyear\" name=\"lyear\">\r\n");
      out.write("\t\t\t\t\t\t<option>2019</option>\r\n");
      out.write("\t\t\t\t\t\t<option>2018</option>\r\n");
      out.write("\t\t\t\t\t\t<option>2017</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t<select class=\"form-control\" id=\"leaguemonth\" name=\"lcode\">\r\n");
      out.write("\t\t\t\t\t\t<option>리그선택</option>\r\n");
      out.write("\t\t\t\t\t\t<option>2019 Green Computer-League</option>\r\n");
      out.write("\t\t\t\t\t\t<option>2018 Green Computer-League</option>\r\n");
      out.write("\t\t\t\t\t\t<option>2017 Green Computer-League</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn_search\" onclick=\"this.form.submit();\">리그선택</button>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"teamrank\">\r\n");
      out.write("\t\t\t\t\t<h4 class=\"h_bar\">\r\n");
      out.write("\t\t\t\t\t\t<strong>TEAM</strong> RANKING\r\n");
      out.write("\t\t\t\t\t</h4>\r\n");
      out.write("\t\t\t\t\t<div class=\"rank\">\r\n");
      out.write("\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t<caption>TEAM RANKING 테이블</caption>\r\n");
      out.write("\t\t\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t\t\t<col style=\"width: 13%;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<col style=\"\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<col style=\"width: 11%\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<col style=\"width: 11%\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<col style=\"width: 11%\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<col style=\"width: 11%\">\r\n");
      out.write("\t\t\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr id=\"rankhead\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th scope=\"col\">순위</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th scope=\"col\">팀명</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th scope=\"col\">승점</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th scope=\"col\">승</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th scope=\"col\">무</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th scope=\"col\">패</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>1</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"emb_wrap\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"team_info.asp?tcode=T1635\"> <span class=\"emb\"><img src=\"/files/team/emblem_1635.jpg\" alt=\"\"></span> <span class=\"team\">기흥FC</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>23</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>7</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>2</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>1</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>2</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"emb_wrap\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"team_info.asp?tcode=T1653\"> <span class=\"emb\"><img src=\"/images/content/default_team.png\" alt=\"\"></span> <span class=\"team\">NTP FS</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>23</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>7</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>2</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>1</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>3</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"emb_wrap\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"team_info.asp?tcode=T1602\"> <span class=\"emb\"><img src=\"/files/team/emblem_1602.jpg\" alt=\"\"></span> <span class=\"team\">P.K FC</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>16</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>5</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>1</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>4</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>4</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"emb_wrap\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"team_info.asp?tcode=T1326\"> <span class=\"emb\"><img src=\"/files/team/emblem_1326.PNG\" alt=\"\"> </span> <span class=\"team\">FC로이드</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>12</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>4</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>0</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>6</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>5</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"emb_wrap\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"team_info.asp?tcode=T1553\"> <span class=\"emb\"><img src=\"/files/team/emblem_1553.jpg\" alt=\"\"></span> <span class=\"team\">FC BTC7</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>7</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>2</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>1</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>7</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>6</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"emb_wrap\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"team_info.asp?tcode=T1627\"> <span class=\"emb\"><img src=\"/files/team/emblem_1627.png\" alt=\"\"></span> <span class=\"team\">FC이그니스</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>6</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>2</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>0</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>8</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"playerrank\">\r\n");
      out.write("\t\t\t\t\t<h4 class=\"h_bar\">\r\n");
      out.write("\t\t\t\t\t\t<strong>PLAYER</strong> RANKING\r\n");
      out.write("\t\t\t\t\t</h4>\r\n");
      out.write("\t\t\t\t\t<div class=\"player\">\r\n");
      out.write("\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t<caption>TEAM RANKING 테이블</caption>\r\n");
      out.write("\t\t\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr id=\"rankhead\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<img src=\"img/son.jpg\" width=150px height=140px style=\"float: left\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>득점 1위 손흥민</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<img src=\"img/son.jpg\" width=150px height=140px style=\"float: left\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>득점 2위 손흥민</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"cbox\">\r\n");
      out.write("\t\t\t\t\t<div class=\"text-center\">\r\n");
      out.write("\t\t\t\t\t\t<ul class=\"pagination\">\r\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"#\">1</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"#\">2</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"#\">3</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"#\">4</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"#\">5</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"#\">6</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"#\">7</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"#\">8</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"#\">9</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"#\">10</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"#\">다음 ></a></li>\r\n");
      out.write("\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<form>\r\n");
      out.write("\t\t\t\t\t\t<select class=\"form-control\" style=\"width: 200px; float: left; margin-left: 200px;\">\r\n");
      out.write("\t\t\t\t\t\t\t<option>전체기간\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t<select class=\"form-control\" style=\"width: 200px; float: left; margin-left: 10px;\">\r\n");
      out.write("\t\t\t\t\t\t\t<option>제목+내용\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" id=\"exampleInputEmail1\" placeholder=\"검색어를 입력하세요\" class=\"form-control\" style=\"width: 300px; float: left; margin-left: 10px;\">\r\n");
      out.write("\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</section>\r\n");
      out.write("\t</section>\r\n");
      out.write("\r\n");
      out.write("\t<footer id=\"footer\">\r\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Footer.jsp", out, false);
      out.write("\r\n");
      out.write("\t</footer>\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "quickbar.jsp", out, false);
      out.write("\r\n");
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
