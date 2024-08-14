package com.sist.vo;
/*
 * NO      NOT NULL NUMBER         
	TYPE             NUMBER         
	NAME             VARCHAR2(50)   
	SUBJECT          VARCHAR2(2000) 
	CONTENT          CLOB           
	REGDATE          DATE           
	HIT              NUMBER   
 */
import java.util.Date;

import lombok.Data;
@Data
public class NoticeVO {
	private int no , type , hit; 
	private String subject , content , name , dbday,notice_type;
	private Date regdate;
}
