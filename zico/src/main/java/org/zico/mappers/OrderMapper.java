package org.zico.mappers;

import org.apache.ibatis.annotations.Insert;
import org.zico.domain.TOrder;
import org.zico.domain.TOrderdetail;

public interface OrderMapper {
	
	@Insert("insert into zico_order (sno,uid,ordertime) values (${sno},'jaeik',current_timestamp)")
	public void insertOrder(TOrder o);
	
	public void insertOdetail(TOrderdetail vo);

}
