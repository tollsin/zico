package org.zico.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Review {
	private int rno,sno;
	private String content,uid;
	private Date regdate,updatedate;
	
	
}
