package org.zico.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zico.domain.Menu;
import org.zico.service.MenuService;

@Controller
@RequestMapping("/menu/*")
public class MenuController {
	@Autowired
	private MenuService service;
	
	@PostMapping("/insert")
	public String insert(Menu menu) {
		
		service.insert(menu);
		
		return "키득키득";
	};
	
}
