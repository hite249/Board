package kr.co.testproj.main.vo;

public class MainVO {
	private String rn;
	private String no;
	private String subject;
	private String content;
	public String getRn() {
		return rn;
	}
	public void setRn(String rn) {
		this.rn = rn;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "MainVO [rn=" + rn + ", no=" + no + ", subject=" + subject
				+ ", content=" + content + "]";
	}
	
}
