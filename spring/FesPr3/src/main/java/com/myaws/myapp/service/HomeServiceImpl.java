package com.myaws.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.SearchCriteria;
import com.myaws.myapp.persistance.BoardMapper;

public class HomeServiceImpl implements HomeService {
	private BoardMapper bm;
	
	@Autowired // 이렇게도 사용이 가능하다.
	public HomeServiceImpl(SqlSession sqlSession) {
		this.bm = sqlSession.getMapper(BoardMapper.class); 
	}
	
	@Override
	public ArrayList<BoardVo> reviewBoardSelectAll(SearchCriteria scri) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("startPageNum",(scri.getPage()-1)*scri.getPerPageNum());
		hm.put("perPageNum", scri.getPerPageNum());
		hm.put("searchType", scri.getSearchType());
		hm.put("keyword", scri.getKeyword());	
		
		ArrayList<BoardVo> blist = bm.reviewBoardSelectAll(hm);
		
		
		return blist;
	}

	@Override
	public int reviewBoardTotalCount(SearchCriteria scri) {
		

		int cnt = bm.reviewBoardTotalCount(scri);

		return cnt;
	}
}
