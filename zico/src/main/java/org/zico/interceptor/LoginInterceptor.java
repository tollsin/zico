package org.zico.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.java.Log;

@Log
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 세션으로 처리
		
		// 사용자가 정상적으로 로그인을 했다면..
		// Model 안에 memeber이름으로 값이 뭔가 있을 것이다.
		Object obj = modelAndView.getModel().get("member");
		
		if(obj == null) {
			response.sendRedirect("/login?msg=fail");
			System.out.println("실패");
			return;
		}
		
		// 값이 존재한다면..
		log.info("정상적으로 로그인 된 사용자: " + obj);
		request.getSession().setAttribute("login", obj);
		
		try {
			Boolean remember = (Boolean)modelAndView.getModel().get("remember");
			System.out.println("1");
			if(remember) {
				Cookie loginCookie = new Cookie("login", obj.toString());
				loginCookie.setMaxAge(60*60*24*7);
				response.addCookie(loginCookie);
				System.out.println("2");
			}
		}catch(Exception e) {
			
		}
			
			
		// HttpSession에다가 담자
		
		//-------------------------------------------------------
		// 쿠키로 처리
		/*
		// Model에 member라는 이름으로 값이 존재한다면..
		Object obj = modelAndView.getModel().get("member");
		
		// 쿠키를 생성하고..
		if(obj != null) {
			Cookie loginCookie = new Cookie("login", obj.toString());
			loginCookie.setMaxAge(60*5);
			response.addCookie(loginCookie);
		}
		*/
		// response에 추가
		
	}

}
