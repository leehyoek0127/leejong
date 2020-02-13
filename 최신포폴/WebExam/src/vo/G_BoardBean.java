package vo;

import java.sql.Date;

public class G_BoardBean {
	String GB_SUBJECT;
	String GB_CONTENTS;
	int GB_NUM;
	Date GB_DATE;
	int GB_READCOUNT;
	String GB_FILE;
	String GB_ID;
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
	public int getGB_NUM() {
		return GB_NUM;
	}
	public void setGB_NUM(int gB_NUM) {
		GB_NUM = gB_NUM;
	}
	public Date getGB_DATE() {
		return GB_DATE;
	}
	public void setGB_DATE(Date gB_DATE) {
		GB_DATE = gB_DATE;
	}
	public int getGB_READCOUNT() {
		return GB_READCOUNT;
	}
	public void setGB_READCOUNT(int gB_READCOUNT) {
		GB_READCOUNT = gB_READCOUNT;
	}
	public String getGB_FILE() {
		return GB_FILE;
	}
	public void setGB_FILE(String gB_FILE) {
		GB_FILE = gB_FILE;
	}
	public String getGB_ID() {
		return GB_ID;
	}
	public void setGB_ID(String gB_ID) {
		GB_ID = gB_ID;
	}
	
}
