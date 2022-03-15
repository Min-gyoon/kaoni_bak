package com.kaoni.Member.VO;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
public class MemberVO {
		 String emnum;
		 
		 @NotBlank(message = "이름 공백")
		 String name;
		 
		 @NotBlank(message = "ID 공백")
		 String id;
		 
		 @NotBlank(message = "비밀번호 공백")
 
		 //@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$\r\n"
		 //, message = "최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자")

		 String passwd;
		 
		 String position;
		 String gender;
		 String Dname;
		 String deleteyn;
		
		public MemberVO() {
		}
		public MemberVO(String emnum, String name, String position, String id, String passwd, String gender, String dname, String deleteyn) {
			this.emnum = emnum;
			this.name = name;
			this.position = position;
			this.id = id;
			this.passwd = passwd;
			this.gender = gender;
			this.Dname = dname;
			this.deleteyn = deleteyn;
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
		public String getDeleteyn() {
			return deleteyn;
		}
		public void setDeleteyn(String deleteyn) {
			this.deleteyn = deleteyn;
		}
		
}
