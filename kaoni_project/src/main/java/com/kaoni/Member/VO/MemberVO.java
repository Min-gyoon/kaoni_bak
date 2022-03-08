package com.kaoni.Member.VO;


import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberVO {
	 String emnum;
	
	 @NotEmpty(message = "1")
	 @NotBlank(message = "3")
	 String name;
	
	 String position;
	
	 String id;
	 String passwd;
	 String gender;
	 String Dname;
	
	public MemberVO() {
	}
	public MemberVO(String emnum, String name, String position, String id, String passwd, String gender, String dname) {
		this.emnum = emnum;
		this.name = name;
		this.position = position;
		this.id = id;
		this.passwd = passwd;
		this.gender = gender;
		this.Dname = dname;
	}
	public String getEmnum() {
		return emnum;
	}
	public void setEmnum(String emnum) {
		this.emnum = emnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDname() {
		return Dname;
	}
	public void setDname(String dname) {
		Dname = dname;
	}
	
	
	
}
