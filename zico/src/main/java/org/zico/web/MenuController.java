package org.zico.web;


import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zico.domain.Menu;
import org.zico.dto.Criteria;
import org.zico.service.MenuService;

import lombok.extern.java.Log;
@Log
@Controller
@RequestMapping("/menu/*")
public class MenuController {
	@Autowired
	private MenuService service;
	@GetMapping("/insert")
	public void getinsert(Criteria cri) {}
	
	//파일 업로드
	@PostMapping("/insert")
	public String insert(Menu menu,Criteria cri, RedirectAttributes rttr,MultipartFile file,Model model) {
		 String uuid = UUID.randomUUID().toString();
	      
	      String uploadName =  uuid + "_" + file.getOriginalFilename();

	      model.addAttribute("uploadName", uploadName);

	      try {
	         OutputStream out = new FileOutputStream("C:\\zzz\\" + uploadName);
	         FileCopyUtils.copy(file.getInputStream(), out);

	         if (file.getContentType().startsWith("image") == true) {
	            model.addAttribute("isImage", file.getContentType().startsWith("image"));
	            makeThumbnail(uploadName);
	            // thumbnail image
	         }

	      } catch (Exception e) {
	         log.warning(e.getMessage());
	      }

		menu.setImgpath(thumbnailName);
		menu.setImgname(uploadName);
		service.insert(menu);
		rttr.addFlashAttribute("result","success");	// 일회성 parameter
		rttr.addFlashAttribute("criteria",cri);	// 일회성 parameter
		return "redirect:/menu/coffeelist";	
	}
	 BufferedImage sourceImg;
	   BufferedImage destImg;
	   String thumbnailName;
	   private String makeThumbnail(String fileName) throws Exception {

	      sourceImg = ImageIO.read(new File("C:\\zzz", fileName));

	      destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 300);

	      thumbnailName = "c:\\zzz" + File.separator +"s_"+ fileName;

	      File newFile = new File(thumbnailName);
	      String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
	      ImageIO.write(destImg, formatName.toUpperCase(), newFile);
	      log.info(thumbnailName);
	      return thumbnailName;
	   }

	   @GetMapping(value="/display", produces="image/jpeg")	// produces : 설정한 type으로 보냄
		@ResponseBody
		public byte[] display(String name) {
		
			try {
				FileInputStream in = new FileInputStream("c:\\zzz\\" + name);
				ByteArrayOutputStream bas = new ByteArrayOutputStream();
				FileCopyUtils.copy(in, bas);
				
				return bas.toByteArray();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return null;
		}
		
	   
	   
	   
	@GetMapping("/coffeelist")
	public void coffeelist(Criteria cri,Model model) {
		model.addAttribute("list",service.coffeelist(cri));
		model.addAttribute("total",service.getcoffeeListCount(cri));
	}
	@GetMapping("/dessertlist")
	public void dessertlist(Criteria cri,Model model) {
		model.addAttribute("list",service.dessertlist(cri));
		model.addAttribute("total",service.getdessertListCount(cri));
	}
	
	@GetMapping("/detail")
	public void detail(@RequestParam(name="menuno")int menuno,@ModelAttribute("cri")Criteria cri,Model model) {
		System.out.println("no : " + menuno);
		model.addAttribute("menu",service.read(menuno));
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam(name="menuno")int menuno) {
		service.delete(menuno);
		return "redirect:/menu/coffeelist";	
	}
	
}
