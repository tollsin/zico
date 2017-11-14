
package org.zico.mappers;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.zico.domain.Test;

public interface MyPageMapper {

	@Select("select * from tb_member where uid=#{uid}")
	public Test mypage(Test vo);
	
	@Update("update tb_member set upassword=#{upassword}, uphone=#{uphone}, birth=#{birth},uname=#{uname},pwanswer=#{pwanswer},pwhint=#{pwhint} where uid=#{uid}" )
	public void mypageupdate(Test vo);
	
	
}
	