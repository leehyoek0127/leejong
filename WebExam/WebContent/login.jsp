<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%
	String redirectPage = request.getParameter("uri");

	String id = request.getParameter("username");
	String pw = request.getParameter("password");
	String url = (String) session.getAttribute("url");
	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/footsal", "root", "0000");
		if (conn == null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.<BR>");
		stmt = conn.createStatement();
		ResultSet rs = stmt
				.executeQuery("select * from sign " + "where id = '" + id + "' and pw = '" + pw + "';");
		if (rs.next()) {

			String name = rs.getString("name");
			String em1 = rs.getString("em1");
			String em2 = rs.getString("em2");
			String hp1 = rs.getString("hp1");
			String hp2 = rs.getString("hp2");
			String hp3 = rs.getString("hp3");
			String gender = rs.getString("gender");
			String hp = rs.getString("hp");
			String adr1 = rs.getString("adr1");
			String adr2 = rs.getString("adr2");
			String yy = rs.getString("yy");
			String mm = rs.getString("mm");
			String dd = rs.getString("dd");
			String pic = rs.getString("pic");
			String lv = rs.getString("lv");
			String team = rs.getString("team");
			String hobby = rs.getString("hobby");
			String passwd2 = rs.getString("passwd2");
			String passwd2ans = rs.getString("passwd2ans");
			String bank = rs.getString("bank");
			String accountnumber = rs.getString("accountnumber");
			String accountholder = rs.getString("accountholder");

			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			session.setAttribute("name", name);
			session.setAttribute("em1", em1);
			session.setAttribute("em2", em2);
			session.setAttribute("hp1", hp1);
			session.setAttribute("hp2", hp2);
			session.setAttribute("hp3", hp3);
			session.setAttribute("gender", gender);
			session.setAttribute("hp",hp);
			session.setAttribute("adr1",adr1);
			session.setAttribute("adr2",adr2);
			session.setAttribute("yy",yy);
			session.setAttribute("mm",mm);
			session.setAttribute("dd",dd);
			session.setAttribute("pic",pic);
			session.setAttribute("lv",lv);
			session.setAttribute("team",team);
			session.setAttribute("hobby",hobby);
			session.setAttribute("passwd2",passwd2);
			session.setAttribute("passwd2ans",passwd2ans);
			session.setAttribute("bank",bank);
			session.setAttribute("accountnumber",accountnumber);
			session.setAttribute("accountholder",accountholder);

			response.sendRedirect(request.getHeader("referer"));
			//RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			//dispatcher.forward(request, response);
			
		} else {
			out.println("<script>alert('아이디나 비밀번호가 틀렸습니다'); location.href='sign.jsp';</script>");

		}

	} finally {
		try {
			stmt.close();
		} catch (Exception ignored) {
		}
		try {
			conn.close();
		} catch (Exception ignored) {
		}
	}
%>