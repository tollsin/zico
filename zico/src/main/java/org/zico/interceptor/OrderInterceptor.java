package org.zico.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.java.Log;

@Log
public class OrderInterceptor extends HandlerInterceptorAdapter{

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		Object loginVal = request.getSession().getAttribute("login");
		Cookie menuCookie = WebUtils.getCookie(request, "menu");
		// 1. 로그인 세션 검사
		if(loginVal == null) {
			Cookie loginCookie = WebUtils.getCookie(request, "login");
			// 2. 로그인 쿠키가 없을 경우 로그인화면으로 이동 시킴
			if(loginCookie == null) {
					//로그인 화면으로 복귀 시킴 return값 입력해 줄 것
			}
			// 3. 로그인 쿠키가 있을 경우 세션에담음
			request.getSession().setAttribute("login", loginCookie.getValue());
		}
		// 4. menuCookie에 있는 주문정보를 뽑아 orderController로 POST 전송
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		return super.preHandle(request, response, handler);
	}

	
	
}
