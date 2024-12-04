package com.myaws.myapp.persistance;

import java.util.ArrayList;
import java.util.HashMap;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface BoardMapper {
	
	public ArrayList<BoardVo> boardSelectAll(HashMap<String,Object> hm);

	public int boardTotalCount(SearchCriteria scri);
	
	public int boardInsert(BoardVo bv);
	
	public BoardVo boardSelectOne(int bidx);
	
	public int boardViewCntUpdate(int bidx);

	public int boardDelete(HashMap hm); // 매개변수가 3개이기때문에 -> impl에서 hashmap 설정
	
	public int boardUpdate(BoardVo bv);

}

