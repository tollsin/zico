package org.zico.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.zico.domain.Test;
import org.zico.service.LoginTestService;

import lombok.extern.java.Log;
@Log
@Controller
@RequestMapping
public class LoginTestController extends HandlerInterceptorAdapter {
	
	@Autowired
	LoginTestService loginservice;
	
	@GetMapping("/sample")
	public void sample() {
		log.info("sample");
	}
	@GetMapping("/login")
	public void login() {
		log.info("login");
	}
	
	@PostMapping("/loginPost")
	public String loginpost(Test vo, boolean remember, Model model) {
		String id = vo.getUid();
		try {
			String ps="";
		 ps= loginservice.idcheck(vo);
		 log.info("이것이 ps"+ps);
		 
		 if(ps!=null) {
				log.info("로그인!!!");
				model.addAttribute("member", vo.getUid());
				model.addAttribute("remember", remember);
				return "redirect:test";
			} 
			else {
				log.info("틀림");
				return "redirect:test";
			}
		} catch(Exception e){
			
			

		}
		log.info("1번"+vo.getUid());
		log.info("2번"+vo.getUpassword());

		return "redirect:test";
	
	
	}
	@GetMapping("/test")
	public void test() {
		log.info("test");
	}
	
}
