package com.sist.vo;
/*
 CAMP_NO                                   NOT NULL NUMBER
 CAMP_PRICE                                         NUMBER
 CAMP_NAME                                 NOT NULL VARCHAR2(4000)
 CAMP_ADDR                                          VARCHAR2(4000)
 CAMP_PHONE                                         VARCHAR2(4000)
 CAMP_CONTENT                                       CLOB
 CAMP_IMAGE                                         VARCHAR2(4000)
 CAMP_WIFI                                          VARCHAR2(4000)
 CAMP_STORE                                         VARCHAR2(4000)
 CAMP_ANIMAL                                        VARCHAR2(4000)
 */

import lombok.Data;

@Data
public class CampVO {

	private int camp_no,camp_price;
	private String camp_name,camp_addr,camp_phone,camp_content,
		camp_image,camp_wifi,camp_store,camp_animal;
	public int getCamp_no() {
		return camp_no;
	}
	public void setCamp_no(int camp_no) {
		this.camp_no = camp_no;
	}
	public int getCamp_price() {
		return camp_price;
	}
	public void setCamp_price(int camp_price) {
		this.camp_price = camp_price;
	}
	public String getCamp_name() {
		return camp_name;
	}
	public void setCamp_name(String camp_name) {
		this.camp_name = camp_name;
	}
	public String getCamp_addr() {
		return camp_addr;
	}
	public void setCamp_addr(String camp_addr) {
		this.camp_addr = camp_addr;
	}
	public String getCamp_phone() {
		return camp_phone;
	}
	public void setCamp_phone(String camp_phone) {
		this.camp_phone = camp_phone;
	}
	public String getCamp_content() {
		return camp_content;
	}
	public void setCamp_content(String camp_content) {
		this.camp_content = camp_content;
	}
	public String getCamp_image() {
		return camp_image;
	}
	public void setCamp_image(String camp_image) {
		this.camp_image = camp_image;
	}
	public String getCamp_wifi() {
		return camp_wifi;
	}
	public void setCamp_wifi(String camp_wifi) {
		this.camp_wifi = camp_wifi;
	}
	public String getCamp_store() {
		return camp_store;
	}
	public void setCamp_store(String camp_store) {
		this.camp_store = camp_store;
	}
	public String getCamp_animal() {
		return camp_animal;
	}
	public void setCamp_animal(String camp_animal) {
		this.camp_animal = camp_animal;
	}
	
}
