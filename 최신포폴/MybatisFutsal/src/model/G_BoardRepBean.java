package model;

import java.sql.Date;

public class G_BoardRepBean {
	int GB_REP_NUM;
	int GB_NUM;
	String GB_REP_CONTENTS;
	Date GB_REP_DATE;
	String GB_ID;
	public int getGB_REP_NUM() {
		return GB_REP_NUM;
	}
	public void setGB_REP_NUM(int gB_REP_NUM) {
		GB_REP_NUM = gB_REP_NUM;
	}
	public int getGB_NUM() {
		return GB_NUM;
	}
	public void setGB_NUM(int gB_NUM) {
		GB_NUM = gB_NUM;
	}
	public String getGB_REP_CONTENTS() {
		return GB_REP_CONTENTS;
	}
	public void setGB_REP_CONTENTS(String gB_REP_CONTENTS) {
		GB_REP_CONTENTS = gB_REP_CONTENTS;
	}
	public Date getGB_REP_DATE() {
		return GB_REP_DATE;
	}
	public void setGB_REP_DATE(Date gB_REP_DATE) {
		GB_REP_DATE = gB_REP_DATE;
	}
	public String getGB_ID() {
		return GB_ID;
	}
	public void setGB_ID(String gB_ID) {
		GB_ID = gB_ID;
	}
	
}
