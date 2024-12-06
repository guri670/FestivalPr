package com.myaws.myapp.service;

import java.util.ArrayList;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface BoardService {

	public ArrayList<BoardVo> festivalBoardSelectAll(SearchCriteria scri);

	public int festivalBoardTotalCount(SearchCriteria scri);
	
	public int festivalBoardInsert(BoardVo bv);
	
	public BoardVo festivalBoardSelectOne(int bidx);
	
	public int festivalBoardViewCntUpdate(int bidx);

	public int festivalBoardDelete(int bidx, int midx, String password); // update -> 되면 1 안돼면 0으로 반환하기때문에 int형

	public int festivalBoardUpdate(BoardVo bv);
	
	
	
	public ArrayList<BoardVo> qnaBoardSelectAll(SearchCriteria scri);

	public int qnaBoardTotalCount(SearchCriteria scri);
	
	public int qnaBoardInsert(BoardVo bv);
	
	public BoardVo qnaBoardSelectOne(int bidx);
	
	public int qnaBoardViewCntUpdate(int bidx);

	public int qnaBoardDelete(int bidx, int midx, String password); // update -> 되면 1 안돼면 0으로 반환하기때문에 int형

	public int qnaBoardUpdate(BoardVo bv);
	
	

	public ArrayList<BoardVo> reviewBoardSelectAll(SearchCriteria scri);

	public int reviewBoardTotalCount(SearchCriteria scri);
	
	public int reviewBoardInsert(BoardVo bv);
	
	public BoardVo reviewBoardSelectOne(int bidx);
	
	public int reviewBoardViewCntUpdate(int bidx);

	public int reviewBoardDelete(int bidx, int midx, String password); // update -> 되면 1 안돼면 0으로 반환하기때문에 int형

	public int reviewBoardUpdate(BoardVo bv);

	public ArrayList<BoardVo> reviewBoardSelectFive(SearchCriteria scri);
	
}
