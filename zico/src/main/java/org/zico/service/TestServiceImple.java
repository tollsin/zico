package org.zico.service;

import org.zico.domain.Test;
import org.zico.mappers.TestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class TestServiceImple  {
	
	@Autowired
	private TestMapper mapper;

	
	public void insert(Test vo) {
		mapper.insert(vo);
	}
	
	


	
	
}
