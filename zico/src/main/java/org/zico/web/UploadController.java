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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.java.Log;

@Log
@Controller
public class UploadController {
	@GetMapping("upload/ex1")
	public void ex1() {
		
	}
	// file 업로드 설정
		@PostMapping("/upload/ex1")				// model = upload된 파일의 이름
		public String ex1Post(MultipartFile f1, Model model) {
			
			log.info(f1.getOriginalFilename());
			log.info(f1.getContentType());
			log.info("" + f1.getSize());
			
			// 파일 이름 중복 방지 처리
			String uuid = UUID.randomUUID().toString();
			
			// uuid와 파일 원본이름 사이에 "_"
			String uploadName = uuid + "_" + f1.getOriginalFilename();
			
			model.addAttribute("uploadName", uploadName);
			
			try {
				OutputStream out = new FileOutputStream("c:\\zzz\\" + uploadName);
				FileCopyUtils.copy(f1.getInputStream(), out);
				
				// image일 경우에만 썸네일 생성
				if(f1.getContentType().startsWith("image")) {
					model.addAttribute("isImage", f1.getContentType().startsWith("image"));
					makeThumbnail(uploadName);
				}
				
			} catch(Exception e) {
				log.warning(e.getMessage());
			}
			
			return "/upload/result";
		}
		
		private String makeThumbnail(String fileName) throws Exception{	          
			BufferedImage sourceImg = ImageIO.read(new File("c:\\zzz\\", fileName));
			BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
																					// 이미지가 깨지지 않도록 height 100으로 설정
			// s_로 시작 = 썸네일이미지
			String thumbnailName = "c:\\zzz\\" + File.separator +"s_"+ fileName;
			  
			File newFile = new File(thumbnailName);
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			  
			ImageIO.write(destImg, formatName.toUpperCase(), newFile);
			log.info(thumbnailName);
			return thumbnailName;
		}
		@GetMapping(value="/display",produces="image/jpeg")
		@ResponseBody
		public byte[] display(String name) {
			try {
				FileInputStream in =new FileInputStream("c:\\zzz\\"+name);
				ByteArrayOutputStream bas=new ByteArrayOutputStream();
				FileCopyUtils.copy(in, bas);
				return bas.toByteArray();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
}
