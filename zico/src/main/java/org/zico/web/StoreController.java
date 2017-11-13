package org.zico.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zico.domain.Store;
import org.zico.dto.Criteria;
import org.zico.service.StoreService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/store/*")
public class StoreController {

	// StoreService 주입
	@Autowired
	private StoreService ss;
	
	@GetMapping("/register")
	public void registerGet(Criteria cri) {}
	
	@GetMapping("/modify")
	public void modifyGet(@RequestParam(name="sno") int sno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("store", ss.get(sno));
	}
	
	// 키워드 검색(매장명)...???
	
	// 매장 전체 리스트
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", ss.getList(cri));
		model.addAttribute("total",ss.getListCount(cri));
	}
	
	// 매장 상세 조회
	@GetMapping("/detail")
	public void detail(@RequestParam(name="sno") int sno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("store", ss.get(sno));
	}
	
	// 매장 등록
	@PostMapping("/register")
	public String registerPost(Store store, Criteria cri, RedirectAttributes rttr) {
		ss.register(store);
		
		rttr.addFlashAttribute("cri", cri);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/store/list";
	}
	
	// 매장 정보 수정
	@PostMapping("/modify")
	public String modifyPost(Store store, Criteria cri, RedirectAttributes rttr) {
		ss.modify(store);
		
		rttr.addFlashAttribute("cri", cri);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/store/detail?sno=" + store.getSno()
				+ "&page=" + cri.getPage() + "&size=" + cri.getSize();
	}
	
	// 매장 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam(name="sno") int sno, Criteria cri, RedirectAttributes rttr) {
		ss.remove(sno);
		
		rttr.addFlashAttribute("cri", cri);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/store/list?page=" + cri.getPage() + "&size=" + cri.getSize();
	}
}
