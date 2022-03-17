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
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	private String pnum;
	private String search;

	public PcrVO() {
		

	}
	
	public PcrVO(String poutcome, String emnum, String isolea, String isoleb, String pcontent, String deleteyn,
			MemberVO memberVO, String pageSize, String groupSize, String curPage, String totalCount, String pnum, String search) {
	
		this.poutcome = poutcome;
		this.emnum = emnum;
		this.isolea = isolea;
		this.isoleb = isoleb;
		this.pcontent = pcontent;
		this.deleteyn = deleteyn;
		this.memberVO = memberVO;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.pnum = pnum;
		this.search = search;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
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

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String getGroupSize() {
		return groupSize;
	}

	public void setGroupSize(String groupSize) {
		this.groupSize = groupSize;
	}

	public String getCurPage() {
		return curPage;
	}

	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}

	public String getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
}
