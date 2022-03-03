package com.kaoni.Member.VO;


public class MemberVO {
	
	String emnum;
	String name;
	String position;
	int age;
	String id;
	String passwd;
	String gender;
	
	public MemberVO() {
	}
	public MemberVO(String emnum, String name, String position, int age, String id, String passwd, String gender) {
		this.emnum = emnum;
		this.name = name;
		this.position = position;
		this.age = age;
		this.id = id;
		this.passwd = passwd;
		this.gender = gender;
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
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
	public void setEmnum(String emnum) {
		this.emnum = emnum;
	}
	public String getEmnum() {
		return emnum;
	}
}
