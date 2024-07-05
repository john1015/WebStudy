package com.sist.dao;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int no,hit;
	private String name,subject,content,pwd,db_day;
	private Date regdate;
}
