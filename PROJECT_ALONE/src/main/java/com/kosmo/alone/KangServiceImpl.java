package com.kosmo.alone;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.alone.mapper.KangMapper;
import com.kosmo.alone.vo.BoardScrapVO;
import com.kosmo.alone.vo.BoardsVO;
import com.kosmo.alone.vo.CategoriesVO;
import com.kosmo.alone.vo.MonstersVO;
import com.kosmo.alone.vo.ReplyVO;

@Service
public class KangServiceImpl implements KangService{

	@Autowired
	private KangMapper dao;

	@Override
	public ArrayList<BoardsVO> svcList() {
		return dao.boardsList();
	}

	@Override
	public HashMap<String, Object> svcCategoryList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<CategoriesVO> categoryList1 = dao.categoryList("유적지");
		ArrayList<CategoriesVO> categoryList2 = dao.categoryList("종교");
		ArrayList<CategoriesVO> categoryList3 = dao.categoryList("전시");
		ArrayList<CategoriesVO> categoryList4 = dao.categoryList("거리");
		ArrayList<CategoriesVO> categoryList5 = dao.categoryList("공원");
		ArrayList<CategoriesVO> categoryList6 = dao.categoryList("건축물");
		ArrayList<CategoriesVO> categoryList7 = dao.categoryList("교육");
		ArrayList<CategoriesVO> categoryList8 = dao.categoryList("자연");
		ArrayList<CategoriesVO> categoryList9 = dao.categoryList("문화");
		ArrayList<CategoriesVO> categoryList10 = dao.categoryList("테마파크");
		ArrayList<CategoriesVO> categoryList11 = dao.categoryList("스포츠");
		ArrayList<CategoriesVO> categoryList12 = dao.categoryList("기타");
		map.put("유적지", categoryList1);
		map.put("종교", categoryList2);
		map.put("전시", categoryList3);
		map.put("거리", categoryList4);
		map.put("공원", categoryList5);
		map.put("건축물", categoryList6);
		map.put("교육", categoryList7);
		map.put("자연", categoryList8);
		map.put("문화", categoryList9);
		map.put("테마파크", categoryList10);
		map.put("스포츠", categoryList11);
		map.put("기타", categoryList12);
		
		return map;
	}

	@Override
	public ArrayList<BoardsVO> svcCateBoardsAllList(BoardsVO vo) {
		return dao.cateBoardsAllList(vo);
	}

	@Override
	public int svcboardsAllCount(int catePk) {
		return dao.boardsAllCount(catePk);
	}

	@Override
	public ArrayList<BoardsVO> svcCateBoardsBestList(BoardsVO vo) {
		return dao.cateBoardsBestList(vo);
	}

	@Override
	public int svcBoardsBestCount(BoardsVO vo) {
		return dao.boardsBestCount(vo);
	}

	@Override
	public int svcBoardsInsert(BoardsVO vo) {
		return dao.boardsInsert(vo);
	}

	@Override
	public HashMap<String, Object> svcBoardsDetail(int boaPk) {
		BoardsVO vo = dao.boardsDetail(boaPk);
		ArrayList<ReplyVO> rList = dao.boardsReplyList(boaPk);
		int cnt = dao.boardsScrapCount(vo.getBoaPk());
		int rCnt = dao.boardsReplyCount(vo.getBoaPk());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rList", rList);
		map.put("bVO", vo);
		map.put("cnt", cnt);
		map.put("rCnt", rCnt);
		return map;
	}

	@Override
	public BoardsVO svcBoardsFirstRegdate() {
		return dao.boardsFirstRegdate();
	}

	@Override
	public ArrayList<BoardsVO> svcBoardsSearchAll(BoardsVO vo) {
		return dao.boardsSearchAll(vo);
	}

	@Override
	public ArrayList<BoardsVO> svcBoardsSearchGubun(BoardsVO vo) {
		return dao.boardsSearchGubun(vo);
	}

	@Override
	public int svcBoardsSearchAllCount(BoardsVO vo) {
		return dao.boardsSearchAllCount(vo);
	}

	@Override
	public int svcBoardsSearchGubunCount(BoardsVO vo) {
		return dao.boardsSearchGubunCount(vo);
	}

	@Override
	public ArrayList<ReplyVO> svcBoardsReplyList(int boaPk) {
		return dao.boardsReplyList(boaPk);
	}

	@Override
	public int svcBoardsReplyInsert(ReplyVO vo) {
		return dao.boardsReplyInsert(vo);
	}

	@Override
	public int svcBoardsReplyDelete(int repPk) {
		return dao.boardsReplyDelete(repPk);
	}

	@Override
	public int svcBoardsScrapInsert(BoardScrapVO vo) {
		dao.boardsScrapInsert(vo);
		int cnt = dao.boardsScrapCount(vo.getBoaPk());
		return cnt;
	}

	@Override
	public BoardScrapVO svcBoardsScrapSelect(BoardScrapVO vo) {
		return dao.boardsScrapSelect(vo);
	}

	@Override
	public int svcBoardsScrapDelete(BoardScrapVO vo) {
		dao.boardsScrapDelete(vo);
		int cnt = dao.boardsScrapCount(vo.getBoaPk());
		return cnt;
	}

	@Override
	public int svcBoardsReplyCount(int boaPk) {
		return dao.boardsReplyCount(boaPk);
	}

	@Override
	public int boardsScrapCount(int boaPk) {
		return dao.boardsScrapCount(boaPk);
	}

	@Override
	public ArrayList<BoardsVO> svcBrList(ArrayList<BoardsVO> list) {
		for(int i=0; i<list.size(); i++){
			int scnt = dao.boardsScrapCount(list.get(i).getBoaPk());
			int rcnt = dao.boardsReplyCount(list.get(i).getBoaPk());
			list.get(i).setScnt(scnt);
			list.get(i).setRcnt(rcnt);
		}
		return list;
	}

	@Override
	public int svcBoardsUpdate(BoardsVO vo) {
		return dao.boardsUpdate(vo);
	}

	@Override
	public ArrayList<BoardsVO> svcBoardsRcntList(BoardsVO vo) {
		return dao.boardsRcntList(vo);
	}

	@Override
	public ArrayList<BoardsVO> svcBoardsScntList(BoardsVO vo) {
		return dao.boardsScntList(vo);
	}

	@Override
	public ArrayList<BoardsVO> svcBoardsScntBestList(BoardsVO vo) {
		return dao.boardsScntBestList(vo);
	}

	@Override
	public ArrayList<BoardsVO> svcBoardsRcntBestList(BoardsVO vo) {
		return dao.boardsRcntBestList(vo);
	}

	@Override
	public int svcBoardsDelete(int boaPk) {
		return dao.boardsDelete(boaPk);
	}

	@Override
	public CategoriesVO svcSelectCateName(int catePk) {
		return dao.selectCateName(catePk);
	}

	@Override
	public ArrayList<BoardsVO> svcBoardScrapList(BoardsVO vo) {
		return dao.boardScrapList(vo);
	}

	@Override
	public int svcMyBoardScrapCount(int monPk) {
		return dao.myBoardScrapCount(monPk);
	}

	@Override
	public MonstersVO svcSelectMember(int monPk) {
		return dao.selectMember(monPk);
	}

}
