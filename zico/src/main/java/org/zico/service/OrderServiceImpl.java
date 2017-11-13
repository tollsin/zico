package org.zico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zico.domain.OrderRegister;
import org.zico.domain.OrderdetailRegister;
import org.zico.mappers.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper mapper;



	@Override
	@Transactional
	public void insertOrder(List<OrderdetailRegister> vo, OrderRegister o) {
		mapper.insertOrder(o);
		for(OrderdetailRegister test : vo) {
		    mapper.insertOdetail(test);
		}
	}
}
