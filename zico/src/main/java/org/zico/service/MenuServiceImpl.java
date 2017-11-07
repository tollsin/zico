package org.zico.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zico.domain.Menu;
import org.zico.mappers.MenuMapper;

@Service
public class MenuServiceImpl implements MenuService{

	@Autowired
	private MenuMapper mapper;
	@Override
	public void insert(Menu menu) {
		mapper.create(menu);
	}

}
