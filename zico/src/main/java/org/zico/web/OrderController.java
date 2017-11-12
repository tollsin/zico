package org.zico.web;

import javax.servlet.http.Cookie;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@GetMapping("/index")
	public void main() {
		log.info("dd");
	}
	@PostMapping("/index")
	public void dain(@CookieValue(name="order",required=false)Cookie cookie, Model mm) {
		log.info("aa");
		if(cookie != null) {
			log.info("쿠키 있다!");
			String str = cookie.getValue();
			mm.addAttribute("order",str);
		}
		else {
			log.info("쿠키 없다!");
		}
	}
	
	@GetMapping("/test")
	public void test() {
		Object obj = ("1:Americano:2,2:HoneyBread:3");
		Cookie menuCookie = new Cookie("menu",obj.toString());
		menuCookie.setMaxAge(60*60*5);
		log.info(menuCookie.getValue());
	}
	
	@PostMapping("/pay")
	public void payProcess(@CookieValue(name="order",required=false)Cookie cookie) {
		log.info(cookie.getValue());
	}
	
}