package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.omg.CORBA.Request;

import model.LoginAction;
import model.MemberDto;
import model.SigninsertAction;

public class LoginService implements Cominterface {
	static LoginService impl = new LoginService();

	public static LoginService instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		String redirectPage = request.getParameter("uri");

		String loginid = request.getParameter("username");
		String loginpw = request.getParameter("password");
		HttpSession session = request.getSession();

		MemberDto MemberDto = new MemberDto();
		MemberDto.setId(loginid);
		MemberDto.setPw(loginpw);
		LoginAction loginmodel = LoginAction.instance();
		ArrayList<MemberDto> loginuser = (ArrayList<MemberDto>) loginmodel.login(MemberDto);
		request.setAttribute("data", loginuser);
		if (!loginuser.isEmpty()) {
			String id = loginuser.get(0).getId();
			String name = loginuser.get(0).getName();
			String pw = loginuser.get(0).getPw();
			String tel = loginuser.get(0).getTel();
			String email = loginuser.get(0).getEmail();
			String gender = loginuser.get(0).getGender();
			String address_code = loginuser.get(0).getAddress_code();
			String address_basic = loginuser.get(0).getAddress_basic();
			String address_detail = loginuser.get(0).getAddress_detail();
			String birth = loginuser.get(0).getBirth();
			String pic = loginuser.get(0).getPic();
			String level = loginuser.get(0).getLevel();
			String position = loginuser.get(0).getPosition();
			String second_pw = loginuser.get(0).getSecond_pw();
			String second_pwc = loginuser.get(0).getSecond_pwc();
			String bank_code = loginuser.get(0).getBank_code();
			String account_code = loginuser.get(0).getAccount_code();
			String account_holder = loginuser.get(0).getAccount_holder();

			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("pw", pw);
			session.setAttribute("tel", tel);
			session.setAttribute("email", email);
			session.setAttribute("gender", gender);
			session.setAttribute("address_code", address_code);
			session.setAttribute("address_basic", address_basic);
			session.setAttribute("address_detail", address_detail);		
			System.out.println(birth);
			session.setAttribute("birth", birth);
			session.setAttribute("pic", pic);
			session.setAttribute("level", level);
			session.setAttribute("position", position);
			session.setAttribute("second_pw", second_pw);
			session.setAttribute("second_pwc", second_pwc);
			session.setAttribute("bank_code", bank_code);
			session.setAttribute("account_code", account_code);
			session.setAttribute("account_holder", account_holder);

			request.setAttribute("check", 1);
			
		} else {
			request.setAttribute("check", 0);
		}
		String urr = request.getHeader("referer"); // 이전페이지 ->서블릿컨트롤러부분도 수정했음

		return urr;
	}
}
