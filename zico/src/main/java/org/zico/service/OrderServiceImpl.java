package org.zico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zico.domain.TOrder;
import org.zico.domain.TOrderdetail;
import org.zico.mappers.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper mapper;



	@Override
	@Transactional
	public void insertOrder(List<TOrderdetail> vo, TOrder o) {
		mapper.insertOrder(o);
		for(TOrderdetail test : vo) {
		    mapper.insertOdetail(test);
		}
	}
}
