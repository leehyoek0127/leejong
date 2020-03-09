package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import vo.ActionForward;
import vo.GalBoardDto;
import svc.GalModifyProService;

public class GalModifyProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

		ActionForward forward = null;
		boolean isModifySuccess = false;
		int GB_NUM=Integer.parseInt(request.getParameter("GB_NUM"));
		GalBoardDto article=new GalBoardDto();
		GalModifyProService galModifyProService = new GalModifyProService();
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
			article.setG_b_no(GB_NUM);
			article.setG_b_subject(request.getParameter("GB_SUBJECT"));
			article.setG_b_contents(request.getParameter("GB_CONTENTS")); 
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
				forward.setPath("boardDetail.bo?board_num="+article.getG_b_no()); 
			}

		}

		return forward;
	}

}