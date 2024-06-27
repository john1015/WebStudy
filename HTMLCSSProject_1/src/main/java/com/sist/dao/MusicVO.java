package com.sist.dao;


/*
 * 		 MNO                                       NOT NULL NUMBER
 		TIME                                      NOT NULL VARCHAR2(2000)
 		SINGER                                    NOT NULL VARCHAR2(2000)
 		ALBUM                                              VARCHAR2(2000)
 		POSTER                                    NOT NULL VARCHAR2(300)
 		STATE                                              CHAR(12)
 		IDCREMENT                                          NUMBER
 */
public class MusicVO {
	private int mno,idcrement;
	private String title,singer,album,poster,state;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getIdcrement() {
		return idcrement;
	}
	public void setIdcrement(int idcrement) {
		this.idcrement = idcrement;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

}
