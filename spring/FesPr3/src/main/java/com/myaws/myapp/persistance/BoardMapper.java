package com.myaws.myapp.persistance;

import java.util.ArrayList;
import java.util.HashMap;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface BoardMapper {
	
	public ArrayList<BoardVo> festivalBoardSelectAll(HashMap<String,Object> hm);

	public int festivalBoardTotalCount(SearchCriteria scri);
	
	public int festivalBoardInsert(BoardVo bv);
	
	public BoardVo festivalBoardSelectOne(int bidx);
	
	public int festivalBoardViewCntUpdate(int bidx);

	public int festivalBoardDelete(HashMap hm); // 매개변수가 3개이기때문에 -> impl에서 hashmap 설정
	
	public int festivalBoardUpdate(BoardVo bv);

	
	
	
	public ArrayList<BoardVo> qnaBoardSelectAll(HashMap<String,Object> hm);

	public int qnaBoardTotalCount(SearchCriteria scri);
	
	public int qnaBoardInsert(BoardVo bv);
	
	public BoardVo qnaBoardSelectOne(int bidx);
	
	public int qnaBoardViewCntUpdate(int bidx);

	public int qnaBoardDelete(HashMap hm); // 매개변수가 3개이기때문에 -> impl에서 hashmap 설정
	
	public int qnaBoardUpdate(BoardVo bv);

	
	
	
	public ArrayList<BoardVo> reviewBoardSelectAll(HashMap<String,Object> hm);

	public int reviewBoardTotalCount(SearchCriteria scri);
	
	public int reviewBoardInsert(BoardVo bv);
	
	public BoardVo reviewBoardSelectOne(int bidx);
	
	public int reviewBoardViewCntUpdate(int bidx);

	public int reviewBoardDelete(HashMap hm); // 매개변수가 3개이기때문에 -> impl에서 hashmap 설정
	
	public int reviewBoardUpdate(BoardVo bv);

}

