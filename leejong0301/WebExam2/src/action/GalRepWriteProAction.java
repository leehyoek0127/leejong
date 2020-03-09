package action;

import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import svc.GalRepWriteProService;

import vo.ActionForward;

import vo.GalRepDto;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class GalRepWriteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		System.out.println("G_BoardRepWriteProAction.java");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		ActionForward forward=null;
		GalRepDto boardBean = null;
		String realFolder="";
		String saveFolder="";
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		String GB_REP_CONTENTS=multi.getParameter("GB_REP_CONTENTS");
		System.out.println(GB_REP_CONTENTS);
		String GB_ID=(String)session.getAttribute("id");
		
		String GB_NUMst=multi.getParameter("GB_NUM");
		System.out.println(GB_NUMst);
		int GB_NUM=Integer.parseInt(GB_NUMst);
		System.out.println(44444);
		
		String nowpage=multi.getParameter("page");
		boardBean = new GalRepDto();
		boardBean.setId(GB_ID);
		
		boardBean.setG_b_no(GB_NUM);
		boardBean.setG_rep_contents(GB_REP_CONTENTS);
		System.out.println(22222);
		
		
		GalRepWriteProService boardWriteProService = new GalRepWriteProService();
		boolean isWriteSuccess = boardWriteProService.registArticle(boardBean);
		System.out.println(33333);
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardDetail.bo?board_num="+GB_NUM+"&page="+nowpage);
		}

		return forward;
		
	}  	
	
}