package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GroundDto;

public class ControllerServlet extends HttpServlet {

	@Override

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		Cominterface inter = null;
		String viewName = "";
		

		try {
			if (command.equals("idcheck")) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				inter = ConfirmIdService.instance();;
				String count = inter.showData(request, response);
				System.out.println("222");
				String id = request.getParameter("id");
				if(count.equals("123")) {
					out.println(id + "��(��) �̹� ������� ID�Դϴ�");
				}else {
					out.println(id + "��(��)����� �� �ִ�  ID�Դϴ�");
				}
			} else if (command.equals("loginbutton")) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				inter = LoginService.instance();
				viewName = inter.showData(request, response);
				int check=(int)request.getAttribute("check");
				if(check==0) {
					out.println("<script>alert('���̵� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.');</script>");
				}else {
					out.println("ok");
				}
			} else if (command.equals("signinput")) {
				System.out.println("������ǲ��Ʈ�ѷ�");
				response.setContentType("text/html;charset=UTF-8");
				inter = SigninsertService.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("mypage")){
				System.out.println("111");
				inter = SignImpl.instance();
				viewName = inter.showData(request, response);		
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("pwchange")){
				inter = PwModify.instance();
				inter.showData(request, response);
				//request.getRequestDispatcher("sangpum_insert.jsp").forward(request, response);
			}
			else if(command.equals("signmodify")){
				inter = SignModify.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
				
			}else if(command.equals("signdel")){//���� ��Ʈ�ѷ� �߰�
				System.out.println("��Ʈ�ѷ�����");
				inter = SignDel.instance();
				viewName = inter.showData(request, response);
				PrintWriter out=response.getWriter();
				int check=(int) request.getAttribute("check");
				System.out.println(check);
				if(check==0) {
					
					out.println("<script>alert('��й�ȣ�� Ȯ�����ּ���.')</script>");
				}else {
					out.println("<script>alert('������ �Ϸ�Ǿ����ϴ�.')</script>");
				}
			}
			else if(command.equals("teamlist")){  //������Ʈ  ���
				System.out.println("teamlist ���");
				inter = TeamListView_Service.instance();
				viewName = inter.showData(request, response);		
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("teaminfo")){  //������ ���
				System.out.println("teaminfo ���");
				inter = TeamInfoService.instance();
				viewName = inter.showData(request, response);		
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("team_regist")){  //����� 
			
				response.setContentType("text/html;charset=UTF-8");
				inter = TeamRegistService.instance();
				viewName = inter.showData(request, response);		
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("team_modify")){  //������  ���
				System.out.println("team modify ���");
				inter = TeamModifyService.instance();
				viewName = inter.showData(request, response);		
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("teamsearch")){  //������Ʈ �˻�  ���
				System.out.println("team search ���");
				inter = TeamSearchService.instance();
				viewName = inter.showData(request, response);		
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("teamranking")){  //����ŷ  ���
				System.out.println("team ranking ���");
				inter = TeamRanking_Service.instance();
				viewName = inter.showData(request, response);		
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("teamplayer")){  //����ŷ  ���
				System.out.println("team player ���");
				inter = TeamPlayer_Service.instance();
				viewName = inter.showData(request, response);		
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("branchlistview")){
				System.out.println("��Ʈ�ѷ�����");
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				inter = BranchList_Service.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("index")){
				System.out.println("�ε�����Ʈ�ѷ�����");
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				inter = Index_Service.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("branchlistview")){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				inter = BranchList_Service.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("branchdetail")){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				inter = BranchDetail_Service.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("qnasearch")){  //qna �˻� ���
				System.out.println("qna �˻� ���");
				inter = QnaSearch.instance();
				viewName = inter.showData(request, response);		
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("teamboardlist")){  
				System.out.println("���Խ�����Ʈ�ѷ�");
				inter = TeamBoardListService.instance();
				viewName = inter.showData(request, response);		
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("team_board_list_writeform")){  
				System.out.println("���Խ��Ǳ۾���������");
				viewName = "team_board_list_writeform.jsp";
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("team_board_list_write")){  
				System.out.println("���Խ��Ǳ۾���");
				response.setContentType("text/html;charset=UTF-8");
				inter = TeamboardListWriteService.instance();
				viewName = inter.showData(request, response);		
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if (command.equals("reservationclick")) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				inter = ReservationClick_Service.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("teamboarddetail")){  
				System.out.println("teamboarddetail");
				inter = TeamBoardDetail_Service.instance();
				viewName = inter.showData(request, response);		
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("teamboardrepinsert")){  
				System.out.println("teamboardrepinsert");
				response.setContentType("text/html;charset=UTF-8");
				inter = TeamBoardRepInsert_Service.instance();
				viewName = inter.showData(request, response);		
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("teamboardmodifyform")){  
				
				response.setContentType("text/html;charset=UTF-8");
				inter = Teamboardmodifyform_Service.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("teamboardmodify")){  
				
				response.setContentType("text/html;charset=UTF-8");
				inter = Teamboardmodify_Service.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("teamboarddelete")){  
				
				response.setContentType("text/html;charset=UTF-8");
				inter = Teamboarddelete_Service.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("league_join_step1")){  
				
				response.setContentType("text/html;charset=UTF-8");
				inter = League_join_step1_Service.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("league_join_step2")){  
				
				response.setContentType("text/html;charset=UTF-8");
				inter = League_join_step2_Service.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if (command.equals("leaguestep2teamcheck")) { // reservation.jsp
				
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				
				inter = League_join_teamcheck_Service.instance();
				String leagueteamresult = inter.showData(request, response);
				System.out.println("��Ʈ�ѷ��������� true�� ������ : "+leagueteamresult);
				
				if (leagueteamresult.equals("true")) {
					out.println(
							"[ {" 
							+ "\"leagueteamresult\": \'" + "ture" + "\'"
							+ "}" + "]");
				}else if(leagueteamresult.equals("true+")) {
					out.println(
							"[ {" 
							+ "\"leagueteamresult\": \'" + "ture+" + "\'"
							+ "}" + "]");
				}
			}
			else if(command.equals("league_join_step3")){  
				
				response.setContentType("text/html;charset=UTF-8");
				inter = League_join_step3_Service.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			
			
			
			else if (command.equals("branchlistview")) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				inter = BranchList_Service.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if (command.equals("branchdetail")) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				inter = BranchDetail_Service.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if (command.equals("reservationclick")) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				inter = ReservationClick_Service.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if (command.equals("reservation_input")) { // ǲ���� ���
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				inter = Reservation_Service.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} 
			else if (command.equals("selectground")) { // reservation.jsp
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				inter = SelectgroundService.instance();
				String count = inter.showData(request, response);
				ArrayList<GroundDto> GroundList = (ArrayList<GroundDto>) request.getAttribute("data");
				if (count.equals("123")) {
					out.println(
							"[ {" 
							+ "\"clickground_no\": '" + GroundList.get(0).getGround_no() + "',"
							+ "\"weekAM_charge\": '" + GroundList.get(0).getGround_weekdaydaytime_charge() + "',"
							+ "\"weekPM_charge\": '" + GroundList.get(0).getGround_weekdaynight_charge() + "',"
							+ "\"weekendAM_charge\": '" + GroundList.get(0).getGround_weekenddaytime_charge() + "',"
							+ "\"weekendPM_charge\": '" + GroundList.get(0).getGround_weekendnight_charge() + "'"
							+ "}" + "]");
				}
			}
			
			
			
			else {
				viewName = "error.jsp";
				response.sendRedirect(viewName);
			}
		} catch (Exception e) {
			System.out.println("service err : " + e);
		}
	}
}