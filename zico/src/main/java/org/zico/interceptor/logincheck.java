package org.zico.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.java.Log;

@Log
public class logincheck extends HandlerInterceptorAdapter {


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// ------------------------------------------------
		// 세션 처리
		// 만일 session에 login 이름의 값이 없다면 /login으로 팅겨낸다.
		Object value = request.getSession().getAttribute("login");
	
		
		if(value != null) {
			log.info("이미 세션에 값이 존재한 사용자이다." + value);
			return true;
		}
		
		if(value == null) {
			log.info("세션에 없으므로 쿠키를 확인해보자. ");
			
			Cookie loginCookie = WebUtils.getCookie(request, "login");
			
			log.info("쿠키 :" + loginCookie);
			
			if(loginCookie != null) {
				log.info("쿠키는 존재하므로 세션에 담자");
				request.getSession().setAttribute("login", loginCookie.getValue());
				return true;
			}
			
		}
		
		log.info("세션에도 없고 쿠키도 없다 ");
		response.sendRedirect("/login");
		return false;
		
	}

}
