package org.zico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zico.domain.Store;
import org.zico.dto.Criteria;
import org.zico.mappers.StoreMapper;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreMapper mapper;
	
	@Override
	public void register(Store store) {
		mapper.create(store);
	}

	@Override
	public Store get(int sno) {
		return mapper.read(sno);
	}

	@Override
	public void modify(Store store) {
		mapper.update(store);
	}

	@Override
	public void remove(int sno) {
		mapper.delete(sno);
	}

	@Override
	public List<Store> getList(Criteria cri) {
		return mapper.getList(cri);
	}

	@Override
	public int getListCount(Criteria cri) {
		return mapper.getTotal(cri);
	}

}
