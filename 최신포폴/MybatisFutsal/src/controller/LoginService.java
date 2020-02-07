package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;

import model.LoginAction;
import model.SignDto;
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
		PrintWriter out=response.getWriter();
		String loginid = request.getParameter("username");
		String loginpw = request.getParameter("password");
		HttpSession session = request.getSession();
		System.out.println("쇼데이타들어옴1");
		String headurl= (String) session.getAttribute("url");
		String reUrl= request.getRequestURI();
		System.out.println("쇼데이타들어옴2");
		SignDto SignDto = new SignDto();
		SignDto.setId(loginid);
		SignDto.setPw(loginpw);
		
		LoginAction loginmodel = LoginAction.instance();
		ArrayList<SignDto> loginuser = (ArrayList<SignDto>) loginmodel.login(SignDto);
		System.out.println("쇼데이타들어옴3");
		System.out.println(loginuser);
		System.out.println(loginuser.size());
		
		if(!loginuser.isEmpty()) {
			
		
		
		
			request.setAttribute("data", loginuser);
			System.out.println("쇼데이타들어옴4");
		
		
		
		
		
			String id = loginuser.get(0).getId();
			System.out.println("쇼데이타들어옴5");
			String name = loginuser.get(0).getName();
			String pw = loginuser.get(0).getPw();
			String em1 = loginuser.get(0).getEm1();
			String em2 = loginuser.get(0).getEm2();
			String hp1 = loginuser.get(0).getHp1();
			String hp2 = loginuser.get(0).getHp2();
			String hp3 = loginuser.get(0).getHp3();
			String gender = loginuser.get(0).getGender();
			String hp = loginuser.get(0).getHp();
			String adr1 = loginuser.get(0).getAdr1();
			String adr2 = loginuser.get(0).getAdr2();
			String yy = loginuser.get(0).getYy();
			String mm = loginuser.get(0).getMm();
			String dd = loginuser.get(0).getDd();
			String pic = loginuser.get(0).getPic();
			String lv = loginuser.get(0).getLv();
			String team = loginuser.get(0).getTeam();
			String hobby = loginuser.get(0).getHobby();
			String passwd2 = loginuser.get(0).getPasswd2();
			String passwd2ans = loginuser.get(0).getPasswd2ans();
			String bank = loginuser.get(0).getBank();
			String accountnumber = loginuser.get(0).getAccountnumber();
			String accountholder = loginuser.get(0).getAccountholder();
			System.out.println("���"+id+name+pw+em1+em2);

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
			System.out.println("여기오냐");
			request.setAttribute("check", 1);
			
			
			}else {
				System.out.println("없어서 else걸림");
				request.setAttribute("check", 0);
				
			}
			
			String urrrr=request.getHeader("referer");
			
		return urrrr;
	}
}
