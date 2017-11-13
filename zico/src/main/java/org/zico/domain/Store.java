package org.zico.domain;

import lombok.Data;

@Data
public class Store {

	private int sno;
	private String sname, addr, tel, sinfo;
	private double lat, lng;
	
}
