package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;

import action.GalDetailAction;
import action.GalListAction;



import action.GalRepWriteProAction;
import action.GalWriteProAction;
import action.GalDeleteProAction;
import action.GalModifyFormAction;
import action.GalModifyProAction;
import vo.ActionForward;


public class GalBoardFrontController extends javax.servlet.http.HttpServlet 
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("BoardFrontController.java");
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;

		if(command.equals("/galWriteForm.bo")){
			forward=new ActionForward();
			forward.setPath("/gal_board_write.jsp");
		}
		else if(command.equals("/galList.bo")){
			action = new GalListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardDetail.bo")){
			action = new GalDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/galModifyForm.bo")){
			action = new GalModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/galModifyPro.bo")){
			action = new GalModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/galDeleteForm.bo")){
			String nowPage = request.getParameter("page");
			request.setAttribute("page", nowPage);
			int GB_NUM = Integer.parseInt(request.getParameter("GB_NUM"));
			request.setAttribute("GB_NUM", GB_NUM);
			forward = new ActionForward();
			forward.setPath("/gal_board_delete.jsp");
		}
		else if(command.equals("/galDeletePro.bo")){
			action = new GalDeleteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/galwrite.bo")){
			System.out.println(0);
			action  = new GalWriteProAction();
			System.out.println(1);
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/galRepPro.bo")){
			System.out.println(0);
			action  = new GalRepWriteProAction();
			System.out.println(1);
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
	
}