package model;

import java.sql.Date;

public class NoticeDto {
int nnum;
String ntitle;
Date ndate;
String ncontents;
String nfile;
int nreadcount;
int nref;
int nlev;
int nseq;


public String getNfile() {
	return nfile;
}
public void setNfile(String nfile) {
	this.nfile = nfile;
}
public int getNnum() {
	return nnum;
}
public void setNnum(int nnum) {
	this.nnum = nnum;
}
public String getNtitle() {
	return ntitle;
}
public void setNtitle(String ntitle) {
	this.ntitle = ntitle;
}

public Date getNdate() {
	return ndate;
}
public void setNdate(Date ndate) {
	this.ndate = ndate;
}
public String getNcontents() {
	return ncontents;
}
public void setNcontents(String ncontents) {
	this.ncontents = ncontents;
}
public int getNreadcount() {
	return nreadcount;
}
public void setNreadcount(int nreadcount) {
	this.nreadcount = nreadcount;
}
public int getNref() {
	return nref;
}
public void setNref(int nref) {
	this.nref = nref;
}
public int getNlev() {
	return nlev;
}
public void setNlev(int nlev) {
	this.nlev = nlev;
}
public int getNseq() {
	return nseq;
}
public void setNseq(int nseq) {
	this.nseq = nseq;
}


}
