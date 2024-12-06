package com.myaws.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.SearchCriteria;
import com.myaws.myapp.persistance.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	private BoardMapper bm;
	
	@Autowired // 이렇게도 사용이 가능하다.
	public BoardServiceImpl(SqlSession sqlSession) {
		this.bm = sqlSession.getMapper(BoardMapper.class); 
	}

	@Override
	public ArrayList<BoardVo> festivalBoardSelectAll(SearchCriteria scri) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("startPageNum",(scri.getPage()-1)*scri.getPerPageNum());
		hm.put("perPageNum", scri.getPerPageNum());
		hm.put("searchType", scri.getSearchType());
		hm.put("keyword", scri.getKeyword());	
		
		ArrayList<BoardVo> blist = bm.festivalBoardSelectAll(hm);
		
		
		return blist;
	}

	@Override
	public int festivalBoardTotalCount(SearchCriteria scri) {
		

		int cnt = bm.festivalBoardTotalCount(scri);

		return cnt;
	}
	
	@Override
	public BoardVo festivalBoardSelectOne(int bidx) {
		BoardVo bv = bm.festivalBoardSelectOne(bidx);
		
		return bv;
	}

	@Override
	public int festivalBoardViewCntUpdate(int bidx) {
		int cnt = bm.festivalBoardViewCntUpdate(bidx);
		
		return cnt;
	}
	
	@Override
	@Transactional
	public int festivalBoardInsert(BoardVo bv) {
		
		int value = bm.festivalBoardInsert(bv);
		
		return value;
	}

	@Override
	public int festivalBoardUpdate(BoardVo bv) {

		int value = bm.festivalBoardUpdate(bv);
		
		return value;
	}
	
	@Override
	public int festivalBoardDelete(int bidx, int midx, String password) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("bidx", bidx);
		hm.put("midx", midx);
		hm.put("password", password);
		// bidx, midx password 매개변수를 hashmap에 담는다
		
		int cnt = bm.festivalBoardDelete(hm);
		
		return cnt;
	}
	
	
	
	@Override
	public ArrayList<BoardVo> qnaBoardSelectAll(SearchCriteria scri) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("startPageNum",(scri.getPage()-1)*scri.getPerPageNum());
		hm.put("perPageNum", scri.getPerPageNum());
		hm.put("searchType", scri.getSearchType());
		hm.put("keyword", scri.getKeyword());	
		
		ArrayList<BoardVo> blist = bm.qnaBoardSelectAll(hm);
		
		
		return blist;
	}

	@Override
	public int qnaBoardTotalCount(SearchCriteria scri) {
		

		int cnt = bm.qnaBoardTotalCount(scri);

		return cnt;
	}
	
	@Override
	public BoardVo qnaBoardSelectOne(int bidx) {
		BoardVo bv = bm.qnaBoardSelectOne(bidx);
		
		return bv;
	}

	@Override
	public int qnaBoardViewCntUpdate(int bidx) {
		int cnt = bm.qnaBoardViewCntUpdate(bidx);
		
		return cnt;
	}
	
	@Override
	@Transactional
	public int qnaBoardInsert(BoardVo bv) {
		
		int value = bm.qnaBoardInsert(bv);
		
		return value;
	}

	@Override
	public int qnaBoardUpdate(BoardVo bv) {

		int value = bm.qnaBoardUpdate(bv);
		
		return value;
	}
	
	@Override
	public int qnaBoardDelete(int bidx, int midx, String password) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("bidx", bidx);
		hm.put("midx", midx);
		hm.put("password", password);
		// bidx, midx password 매개변수를 hashmap에 담는다
		
		int cnt = bm.qnaBoardDelete(hm);
		
		return cnt;
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
	
	@Override
	public BoardVo reviewBoardSelectOne(int bidx) {
		BoardVo bv = bm.reviewBoardSelectOne(bidx);
		
		return bv;
	}

	@Override
	public int reviewBoardViewCntUpdate(int bidx) {
		int cnt = bm.reviewBoardViewCntUpdate(bidx);
		
		return cnt;
	}
	
	@Override
	@Transactional
	public int reviewBoardInsert(BoardVo bv) {
		
		int value = bm.reviewBoardInsert(bv);
		
		return value;
	}

	@Override
	public int reviewBoardUpdate(BoardVo bv) {

		int value = bm.reviewBoardUpdate(bv);
		
		return value;
	}
	
	@Override
	public int reviewBoardDelete(int bidx, int midx, String password) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("bidx", bidx);
		hm.put("midx", midx);
		hm.put("password", password);
		// bidx, midx password 매개변수를 hashmap에 담는다
		
		int cnt = bm.reviewBoardDelete(hm);
		
		return cnt;
	}
}
