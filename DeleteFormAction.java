package com.exam.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.controller.Action;
import com.exam.controller.ActionForward;

public class DeleteFormAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("DeleteFormAction");
		
		
		String pageNum = request.getParameter("pageNum");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		//request 영역객체에 저장(뷰에서 사용할 데이터)
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("center/delete");
		forward.setRedirect(false);
		return forward;
		
	}

}
