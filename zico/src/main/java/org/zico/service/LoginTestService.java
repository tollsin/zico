package org.zico.service;

import org.zico.domain.Test;
import org.zico.mappers.LoginTestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginTestService {

	@Autowired
	private LoginTestMapper servicemapper;
	
	
	
	public String idcheck(Test vo) {
		
		String result;
		if(null==servicemapper.idcheck(vo)) {
			String dd="아이디랑 비밀번호를 잘못입력했습니다";
			return result=null;
		}else{
			return result=vo.getUpassword();
		}
	}
	
	
}
