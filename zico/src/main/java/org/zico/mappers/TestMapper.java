package org.zico.mappers;

import org.apache.ibatis.annotations.Insert;
import org.zico.domain.Test;

public interface TestMapper {
	
	@Insert("insert into zico.tb_member(uid,upassword,uphone,birth,uname,joindate,pwhint,pwanswer) values (#{uid},#{upassword},#{uphone},#{birth},#{uname},now(),#{pwhint},#{pwanswer})")
	public void insert(Test vo);
	
}
