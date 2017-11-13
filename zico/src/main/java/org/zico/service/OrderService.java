 package org.zico.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zico.domain.OrderRegister;
import org.zico.domain.OrderdetailRegister;
@Service
public interface OrderService {
	public void insertOrder(List<OrderdetailRegister> vo,OrderRegister o);
}
