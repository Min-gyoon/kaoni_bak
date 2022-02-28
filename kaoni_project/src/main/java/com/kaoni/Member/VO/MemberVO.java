package com.kaoni.Member.VO;

public class MemberVO {

	String name;
	String gender;
	String age;
	String address;
	
	public MemberVO() {}
	public MemberVO(String name, String gender, String age, String address) {
		super();
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
