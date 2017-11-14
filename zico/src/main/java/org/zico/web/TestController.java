package org.zico.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zico.domain.Test;
import org.zico.service.TestServiceImple;

import lombok.extern.java.Log;
@Log
@Controller
public class TestController {
	
	@Autowired
	TestServiceImple service;
	
	@GetMapping("/res")
	public String test() {
		return "resistration";
	}
	
	@PostMapping("/res")
	public String test1(Test tt,@RequestParam(name="uid",required=false)String uid) {
		log.info(uid);
		log.info(tt.toString());
		service.insert(tt);
		return "mypage";
	}
}
