package org.zico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zico.domain.Menu;
import org.zico.dto.Criteria;
import org.zico.mappers.MenuMapper;

@Service
public class MenuServiceImpl implements MenuService{

	@Autowired
	private MenuMapper mapper;
	@Override
	public void insert(Menu menu) {
		mapper.create(menu);
	}
	@Override
	public Menu read(Integer menuno) {
		return mapper.read(menuno);
	}
	@Override
	public List<Menu> coffeelist(Criteria cri) {
		return mapper.listcoffee(cri);
	}
	@Override
	public void update(Menu menu) {
		mapper.update(menu);
		
	}
	@Override
	public void delete(Integer menuno) {
		mapper.delete(menuno);
		
	}
	@Override
	public int getcoffeeListCount(Criteria cri) {
		return mapper.getcoffeeTotal(cri);
	}
	@Override
	public List<Menu> dessertlist(Criteria cri) {
		return mapper.listdessert(cri);
	}
	@Override
	public int getdessertListCount(Criteria cri) {
		return mapper.getdessertTotal(cri);
	}
	
}
