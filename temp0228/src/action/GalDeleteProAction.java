package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import vo.ActionForward;
import svc.GalDeleteProService;

public class GalDeleteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{	 

		ActionForward forward = null;
		int GB_NUM=Integer.parseInt(request.getParameter("GB_NUM"));
		String nowPage = request.getParameter("page");
		GalDeleteProService galDeleteProService = new GalDeleteProService();
		boolean isArticleWriter =galDeleteProService.isArticleWriter(GB_NUM, request.getParameter("GB_ID"));

		if(!isArticleWriter){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}

		else{
			
			boolean isDeleteSuccess = galDeleteProService.removeArticle(GB_NUM);

			if(!isDeleteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('삭제실패');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("galList.bo?page=" + nowPage);
			}
			
		}


		return forward;
	}

}