package org.zico.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zico.domain.Menu;
import org.zico.dto.Criteria;

public interface MenuMapper extends CRUDMapper<Menu, Integer>{

	@Select("select * from tb_menu where category='coffee' order by  menuno desc limit #{skip}, #{size}")
	public List<Menu> listcoffee(Criteria cri);
	
	@Select("select * from tb_menu where category='dessert' order by menuno desc limit #{skip}, #{size}")
	public List<Menu> listdessert(Criteria cri);
	
	@Select("select count(menuno) from tb_menu where category='coffee'")
	public int getcoffeeTotal(Criteria cri);
	
	@Select("select count(menuno) from tb_menu where category='dessert'")
	public int getdessertTotal(Criteria cri);
	
	
	
	 
}
