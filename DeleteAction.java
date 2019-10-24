package com.exam.controller.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.controller.Action;
import com.exam.controller.ActionForward;
import com.exam.dao.BoardDao;

public class DeleteAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("DeleteAcion");
		
		//파라미터값 가져오기
		String pageNum = request.getParameter("pageNum");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		//passwd 파라미터값은 로그인 사용자일 경우는 null
		String passwd = request.getParameter("passwd");
		//DAO객체 준비
		BoardDao boardDao=BoardDao.getInstance();
		

		

			if(!boardDao.isPasswdEqual(num, passwd)){
			response.setContentType("text/htlml; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<Script>");
			out.println("alert('글패스워드가 다릅니다.');");
			out.println("history.back();");
			out.println("</Script>");
			out.close();	
			
			
				return null;
			}
			
		//게시글 삭제하기 메소드 호출
		 boardDao.deleteBoard(num);
		 
		 //삭제처리 후 글목록 notice.do로 이동
		 ActionForward forward = new ActionForward();
		 forward.setPath("notice.do?pageNum="+pageNum);
		 forward.setRedirect(true);
		 
		
		return forward;
	}

}
