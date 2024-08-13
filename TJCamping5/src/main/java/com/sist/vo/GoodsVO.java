package com.sist.vo;
/*
 * CNO
NAME
BRAND
DELIVERY
SALEPRICE
PRICE
POSTER
DETAIL_POSTER
ORIGIN
TYPE
 */
public class GoodsVO {
	private int cno , delivery , type;
	private String name ,brand , saleprice , price , poster , detail_poster , origin;
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(String saleprice) {
		this.saleprice = saleprice;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getDetail_poster() {
		return detail_poster;
	}
	public void setDetail_poster(String detail_poster) {
		this.detail_poster = detail_poster;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	
}
