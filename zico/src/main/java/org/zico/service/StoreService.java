package org.zico.service;

import java.util.List;

import org.zico.domain.Store;
import org.zico.dto.Criteria;

public interface StoreService {

	public void register(Store store);
	public Store get(int sno);
	public void modify(Store store);
	public void remove(int sno);
	
	public List<Store> getList(Criteria cri);
	public int getListCount(Criteria cri);
	
}
