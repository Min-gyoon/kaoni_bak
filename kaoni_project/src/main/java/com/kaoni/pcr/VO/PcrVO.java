package com.kaoni.pcr.VO;

import com.kaoni.Member.VO.MemberVO;

public class PcrVO {
	private String poutcome;
	private String emnum;
	private String isolea;
	private String isoleb;
	private String pcontent;
	private String deleteyn;
	private MemberVO memberVO;
	
	public PcrVO() {
		

	}
	
	public PcrVO(String deleteyn, String poutcome, String emnum, String isolea, String isoleb, String pcontent, 
			MemberVO memberVO) {
		this.memberVO = memberVO;
		this.poutcome = poutcome;
		this.emnum = emnum;
		this.isolea = isolea;
		this.isoleb = isoleb;
		this.deleteyn = deleteyn;

	}
	public String getPoutcome() {
		return poutcome;
	}
	public void setPoutcome(String poutcome) {
		this.poutcome = poutcome;
	}
	public String getEmnum() {
		return emnum;
	}
	public void setEmnum(String emnum) {
		this.emnum = emnum;
	}
	public String getIsolea() {
		return isolea;
	}
	public void setIsolea(String isolea) {
		this.isolea = isolea;
	}
	public String getIsoleb() {
		return isoleb;
	}
	public void setIsoleb(String isoleb) {
		this.isoleb = isoleb;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getDeleteyn() {
		return deleteyn;
	}

	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
}
