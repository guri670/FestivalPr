package com.myaws.myapp.service;

import java.util.ArrayList;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface HomeService {

	public ArrayList<BoardVo> reviewBoardSelectAll(SearchCriteria scri);

	public int reviewBoardTotalCount(SearchCriteria scri);
}
