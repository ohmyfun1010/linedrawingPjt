package kr.co.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.beans.ReviewContentBean;
import kr.co.beans.UserBean;
import kr.co.service.BoardService;

public class CheckWriterInterceptor2 implements HandlerInterceptor {

	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Autowired
	private BoardService boardService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		String str1 = request.getParameter("content_idx");
		int content_idx = Integer.parseInt(str1);
		
		ReviewContentBean currentContentBean = boardService.getReviewContentInfo(content_idx);
		
		if(currentContentBean.getContent_writer_idx() != loginUserBean.getUser_idx()) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/board/not_writer");
			return false;
		}
		
		return true;
	}
}
