package vo;

import java.sql.Date;


public class QnaDto {

	int q_b_no;
	String q_b_name;
	String q_b_secret;
	String q_b_secretcode;//secretnum
	Date q_b_date;//qDate;
	int q_b_readcount;//qCount;
	String q_b_contents;//qContents;
	String q_b_title;//qTitle;
	String qEmail;
	String id;
	public int getQ_b_no() {
		return q_b_no;
	}
	public void setQ_b_no(int q_b_no) {
		this.q_b_no = q_b_no;
	}
	public String getQ_b_name() {
		return q_b_name;
	}
	public void setQ_b_name(String q_b_name) {
		this.q_b_name = q_b_name;
	}
	public String getQ_b_secret() {
		return q_b_secret;
	}
	public void setQ_b_secret(String q_b_secret) {
		this.q_b_secret = q_b_secret;
	}
	public String getQ_b_secretcode() {
		return q_b_secretcode;
	}
	public void setQ_b_secretcode(String q_b_secretcode) {
		this.q_b_secretcode = q_b_secretcode;
	}
	public Date getQ_b_date() {
		return q_b_date;
	}
	public void setQ_b_date(Date q_b_date) {
		this.q_b_date = q_b_date;
	}
	public int getQ_b_readcount() {
		return q_b_readcount;
	}
	public void setQ_b_readcount(int q_b_readcount) {
		this.q_b_readcount = q_b_readcount;
	}
	public String getQ_b_contents() {
		return q_b_contents;
	}
	public void setQ_b_contents(String q_b_contents) {
		this.q_b_contents = q_b_contents;
	}
	public String getQ_b_title() {
		return q_b_title;
	}
	public void setQ_b_title(String q_b_title) {
		this.q_b_title = q_b_title;
	}
	public String getqEmail() {
		return qEmail;
	}
	public void setqEmail(String qEmail) {
		this.qEmail = qEmail;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	

	
	
}
