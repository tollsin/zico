package org.zico.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TOrderdetail {
	private int count, ono;
	private String menuno;
	private Date restime;
}
