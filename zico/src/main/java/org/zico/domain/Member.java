package org.zico.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Member {
	private String uid,upassword,uphone,birth,uname,pwhint,pwanswer;
	private Date joindate;
	private boolean admin;
	
}
