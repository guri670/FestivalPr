package com.myaws.myapp.domain;

public class BoardVo {
	private int bidx;
	private String subject;
	private String contents;
	private String writer;
	private String fileName;
	private int viewCnt;
	private String writeday;
	private String delyn;
	private String modifyWriteday;
	private String boardInfo;
	private int midx;
	
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getModifyWriteday() {
		return modifyWriteday;
	}
	public void setModifyWriteday(String modifyWriteday) {
		this.modifyWriteday = modifyWriteday;
	}
	public String getBoardInfo() {
		return boardInfo;
	}
	public void setBoardInfo(String boardInfo) {
		this.boardInfo = boardInfo;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	
}
