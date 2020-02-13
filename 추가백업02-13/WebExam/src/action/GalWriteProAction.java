package action;

import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.GalWriteProService;
import vo.ActionForward;

import vo.GalBoardDto;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class GalWriteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		System.out.println("Q_BoardWriteProAction.java");
		request.setCharacterEncoding("UTF-8");
		ActionForward forward=null;
		GalBoardDto boardBean = null;
		String realFolder="";
		String saveFolder="/boardUpload";
		int fileSize=5*1024*1024;
		
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);  
		
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		boardBean = new GalBoardDto();
		boardBean.setG_b_subject(multi.getParameter("GB_SUBJECT"));
		boardBean.setId(multi.getParameter("GB_ID"));
		
		boardBean.setG_b_contents(multi.getParameter("GB_CONTENTS"));
		boardBean.setG_b_file(
		multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		
		GalWriteProService boardWriteProService = new GalWriteProService();
		boolean isWriteSuccess = boardWriteProService.registArticle(boardBean);
		
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
			forward.setPath("galList.bo");
		}

		return forward;
		
	}  	
	
}