package org.zico.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Order {
	private int ono,sno;
	private String uid;
	private Date ordertime,chktime;
}
