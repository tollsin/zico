package org.zico.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.zico.domain.TOrder;
import org.zico.domain.TOrderdetail;
import org.zico.service.OrderService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@Autowired
	OrderService service;
	
	@GetMapping("/index")
	public void main(@CookieValue(name="order",required=false)Cookie cookie, Model mm) {
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
	public String payProcess(@CookieValue(name="order",required=false)Cookie cookie) {
		TOrder o = new TOrder();
		o.setSno(11);
		o.setUid("jaeik");
		TOrderdetail vo = new TOrderdetail();
		String [] or = cookie.getValue().split("!");
		List<TOrderdetail> tor = new ArrayList<TOrderdetail>();
		for(int i=0; i < or.length; i++) {
			TOrderdetail aa = new TOrderdetail();
			String[] or1 = or[i].split("_");
			aa.setCount(Integer.parseInt(or1[3]));
			aa.setMenuno(or1[2]);
			aa.setRestime(null);
			tor.add(aa);
		}
		try {
			service.insertOrder(tor, o);
		} catch (Exception e) {
			return "redirect:/order/index";
		}
		ModelAndView mav = new ModelAndView();
		return "redirect:/";
		/*mav.setViewName("redirect:/order/index");
		mav.addObject("order", cookie);
		return mav;*/
	}
	
	
}