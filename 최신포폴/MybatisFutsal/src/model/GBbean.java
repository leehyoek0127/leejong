package model;

import java.sql.Date;

public class GBbean {
	
	private int GB_NUM;
	private String GB_ID;
	private String GB_SUBJECT;
	private String GB_CONTENTS;
	private String GB_FILE;
	private int GB_READCOUNT;
	private Date GB_DATE;
	private int GB_RE_REF;
	private int GB_RE_LEV;
	private int GB_RE_SEQ;
	
	public int getGB_NUM() {
		return GB_NUM;
	}
	public void setGB_NUM(int gB_NUM) {
		GB_NUM = gB_NUM;
	}
	public String getGB_ID() {
		return GB_ID;
	}
	public void setGB_ID(String gB_ID) {
		GB_ID = gB_ID;
	}
	public String getGB_SUBJECT() {
		return GB_SUBJECT;
	}
	public void setGB_SUBJECT(String gB_SUBJECT) {
		GB_SUBJECT = gB_SUBJECT;
	}
	
	public String getGB_CONTENTS() {
		return GB_CONTENTS;
	}
	public void setGB_CONTENTS(String gB_CONTENTS) {
		GB_CONTENTS = gB_CONTENTS;
	}
	public String getGB_FILE() {
		return GB_FILE;
	}
	public void setGB_FILE(String gB_FILE) {
		GB_FILE = gB_FILE;
	}
	public int getGB_READCOUNT() {
		return GB_READCOUNT;
	}
	public void setGB_READCOUNT(int gB_READCOUNT) {
		GB_READCOUNT = gB_READCOUNT;
	}
	public Date getGB_DATE() {
		return GB_DATE;
	}
	public void setGB_DATE(Date gB_DATE) {
		GB_DATE = gB_DATE;
	}
	public int getGB_RE_REF() {
		return GB_RE_REF;
	}
	public void setGB_RE_REF(int gB_RE_REF) {
		GB_RE_REF = gB_RE_REF;
	}
	public int getGB_RE_LEV() {
		return GB_RE_LEV;
	}
	public void setGB_RE_LEV(int gB_RE_LEV) {
		GB_RE_LEV = gB_RE_LEV;
	}
	public int getGB_RE_SEQ() {
		return GB_RE_SEQ;
	}
	public void setGB_RE_SEQ(int gB_RE_SEQ) {
		GB_RE_SEQ = gB_RE_SEQ;
	}
	
	
	
	
	
}