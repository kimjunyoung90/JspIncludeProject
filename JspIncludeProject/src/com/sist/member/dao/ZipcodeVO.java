package com.sist.member.dao;
/*
 *   JSP (Web) 기본 
 *    = 게시판
 *    = 회원가입(*아이디 체크,우편번호 검색 중요)
 *    = 로그인
 */
public class ZipcodeVO {
    private String zipcode;
    private String sido;
    private String gugun;
    private String dong;
    private String bunji;
    private String addr;
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getBunji() {
		return bunji;
	}
	public void setBunji(String bunji) {
		this.bunji = bunji;
	}
	public String getAddr() {
		return sido+" "+gugun+" "+dong+" "+bunji;
	}
	  
  
  
}








