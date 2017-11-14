package org.zico.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.zico.domain.Test;
import org.zico.service.MyPageService;

@Controller
public class MyPageController {

	@Autowired
	MyPageService myservice;
	
	@GetMapping("/mypagego")
	public String mypagetest() {
		
		return "redirect:/mypagetest";
		
	}
	@PostMapping("/mypagego")
	public String page(Test vo,@CookieValue(value = "login", required = false) String loginid ,Model model) {
		
		
		vo.setUid(loginid);
		
		model.addAttribute("result",myservice.pageview(vo));
		System.out.println( "벌쓰"+vo.getBirth());
		
		return "redirect:/mypage";
	}

	@PostMapping("/updatemypage")
	public void viw(Test vo,@CookieValue(value = "login", required = false) String loginid ,Model model) {
		vo.setUid(loginid);
		
		model.addAttribute("result",myservice.pageview(vo));
	
		System.out.println("설마이거");
	}
	
	@PostMapping("/updateresult")
	public void result(Test vo,@CookieValue(value = "login", required = false) String loginid) {
		
		vo.setUid(loginid);
		System.out.println("아이디이거"+vo.getUid());
		System.out.println("패스워드"+vo.getUpassword());
		myservice.pageupadte(vo);
	}

}
