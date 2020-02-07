package model;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.galModifyProService;

public class galModifyProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

		ActionForward forward = null;
		boolean isModifySuccess = false;
		int GB_NUM=Integer.parseInt(request.getParameter("GB_NUM"));
		GBbean article=new GBbean();
		galModifyProService galModifyProService = new galModifyProService();
		boolean isRightUser=galModifyProService.isArticleWriter(GB_NUM, request.getParameter("GB_ID"));

		if(!isRightUser){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			article.setGB_NUM(GB_NUM);
			article.setGB_SUBJECT(request.getParameter("GB_SUBJECT"));
			article.setGB_CONTENTS(request.getParameter("GB_CONTENTS")); 
			isModifySuccess = galModifyProService.modifyArticle(article);

			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('수정실패');");
				out.println("history.back()");
				out.println("</script>");
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("galDetail.bo?GB_NUM="+article.getGB_NUM()); 
			}

		}

		return forward;
	}

}