package com.kaoni.pcr.VO;

public class PcrVO {
	String poutcome;
	String emnum;
	String isolea;
	String isoleb;
	String pcontent;
	String deleteyn;
	
	public PcrVO(){}
	
	public PcrVO(String deleteyn, String poutcome, String emnum, String isolea, String isoleb, String pcontent) {
		super();
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
	
}
