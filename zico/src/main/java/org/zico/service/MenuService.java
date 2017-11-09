package org.zico.service;

import java.util.List;

import org.zico.domain.Menu;
import org.zico.dto.Criteria;

public interface MenuService {

	public void insert(Menu menu);
	public Menu read(Integer menuno);
	public List<Menu> coffeelist(Criteria cri);
	public List<Menu> dessertlist(Criteria cri);
	public void update(Menu menu);
	public void delete(Integer menuno);
	public int getcoffeeListCount(Criteria cri);
	public int getdessertListCount(Criteria cri);
	
}
