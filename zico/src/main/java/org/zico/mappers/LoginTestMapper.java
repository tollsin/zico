package org.zico.mappers;

import org.apache.ibatis.annotations.Select;
import org.zico.domain.Test;

public interface LoginTestMapper {
	
	@Select("select * from tb_member where uid=#{uid} and upassword =#{upassword} ")
	public String idcheck(Test vo); 
		
		
	
}
