package org.zico.mappers;

import org.apache.ibatis.annotations.Insert;
import org.zico.domain.OrderRegister;
import org.zico.domain.OrderdetailRegister;

public interface OrderMapper {
	
	@Insert("insert into zico_order (sno,uid,ordertime) values (${sno},'jaeik',current_timestamp)")
	public void insertOrder(OrderRegister o);
	
	public void insertOdetail(OrderdetailRegister vo);

}
