package org.zico.service;

import org.zico.domain.Test;
import org.zico.mappers.MyPageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageService {
	
	@Autowired
	MyPageMapper mymapper; 
	
	public Test pageview(Test vo) {
		return mymapper.mypage(vo);
		 
	}
	
	public void pageupadte(Test vo) {
		mymapper.mypageupdate(vo);
	}
	
	
	
}
