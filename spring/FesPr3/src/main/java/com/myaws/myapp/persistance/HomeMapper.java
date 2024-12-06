package com.myaws.myapp.persistance;

import java.util.ArrayList;
import java.util.HashMap;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface HomeMapper {
	
	public ArrayList<BoardVo> reviewBoardSelectAll(HashMap<String,Object> hm);

	public int reviewBoardTotalCount(SearchCriteria scri);
}
