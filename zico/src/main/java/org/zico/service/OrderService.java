 package org.zico.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zico.domain.TOrder;
import org.zico.domain.TOrderdetail;
@Service
public interface OrderService {
	public void insertOrder(List<TOrderdetail> vo,TOrder o);
}
