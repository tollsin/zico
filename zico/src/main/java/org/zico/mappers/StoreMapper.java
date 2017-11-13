package org.zico.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zico.domain.Store;
import org.zico.dto.Criteria;

public interface StoreMapper extends CRUDMapper<Store, Integer>{

	// 매장 전체 리스트
	@Select("select * from tb_store order by sno desc limit #{skip}, #{size}")
	public List<Store> getList(Criteria cri);
	
	// 전체 매장 수
	@Select("select count(sno) from tb_store")
	public int getTotal(Criteria cri);
}
