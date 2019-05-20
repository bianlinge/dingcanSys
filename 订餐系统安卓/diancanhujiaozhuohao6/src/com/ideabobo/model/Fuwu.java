package com.ideabobo.model;

/**
 * Shop entity. @author MyEclipse Persistence Tools
 */

public class Fuwu implements java.io.Serializable {
	// Fields
	private Integer id;
	private String title;
	private String note;
	private String state;
	private String username;
	private String ndate;
	
	
	public String getNdate() {
		return ndate;
	}
	public void setNdate(String ndate) {
		this.ndate = ndate;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

}