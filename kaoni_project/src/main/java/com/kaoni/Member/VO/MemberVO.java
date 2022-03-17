package com.kaoni.Member.VO;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
public class MemberVO {
	
		 String emnum;
		 @NotBlank(message = "ID가 공백입니다")
		 @Pattern(regexp = "^[a-zA-z0-9]{4,12}$"
		 , message = "아이디는 영문 대소문자와 숫자 4~12자리로 입력해야 합니다`")
		 String id;
		 @NotBlank(message = "비밀번호 공백입니다")
		 @Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{8,16}$"
		 , message = "'숫자', '문자', '특수문자' 무조건 1개 이상, 비밀번호 '최소 8자에서 최대 16자'까지 허용")
		 String passwd;
		 
		 @NotBlank(message = "이름이 공백입니다")
		 String name;
		 String gender;
		 @NotBlank(message = "부서를 선택해야 합니다")
		 String Dname;
		 @NotBlank(message = "직위를 선택해야 합니다")
		 String position;
		
		
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
