package kr.co.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;
import kr.co.beans.UserBean;

public class CheckWriterInterceptor implements HandlerInterceptor {

	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	int check;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		check = loginUserBean.getUser_idx();
		if (check == 1) {
			return true;

		} else {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/board/not_writer");
			return false;
		}

	}
}
