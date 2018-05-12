package com.kosmo.alone;

import java.util.ArrayList;
import java.util.HashMap;

import com.kosmo.alone.vo.BoardScrapVO;
import com.kosmo.alone.vo.BoardsVO;
import com.kosmo.alone.vo.CategoriesVO;
import com.kosmo.alone.vo.MonstersVO;
import com.kosmo.alone.vo.ReplyVO;

public interface KangService {
	
	public ArrayList<BoardsVO> svcList();
	public HashMap<String, Object> svcCategoryList();
	public ArrayList<BoardsVO> svcCateBoardsAllList(BoardsVO vo);
	public int svcboardsAllCount(int catePk);
	public ArrayList<BoardsVO> svcCateBoardsBestList(BoardsVO vo);
	public int svcBoardsBestCount(BoardsVO vo);
	public int svcBoardsInsert(BoardsVO vo);
	public int svcBoardsUpdate(BoardsVO vo);
	public HashMap<String, Object> svcBoardsDetail(int boaPk);
	public BoardsVO svcBoardsFirstRegdate();
	public ArrayList<BoardsVO> svcBoardsSearchAll(BoardsVO vo);
	public ArrayList<BoardsVO> svcBoardsSearchGubun(BoardsVO vo);
	public int svcBoardsSearchAllCount(BoardsVO vo);
	public int svcBoardsSearchGubunCount(BoardsVO vo);
	public ArrayList<ReplyVO> svcBoardsReplyList(int boaPk);
	public int svcBoardsReplyInsert(ReplyVO vo);
	public int svcBoardsReplyDelete(int repPk);
	public int svcBoardsScrapInsert(BoardScrapVO vo);
	public BoardScrapVO svcBoardsScrapSelect(BoardScrapVO vo);
	public int svcBoardsScrapDelete(BoardScrapVO vo);
	public int boardsScrapCount(int boaPk);
	public int svcBoardsReplyCount(int boaPk);
	public ArrayList<BoardsVO> svcBrList(ArrayList<BoardsVO> list);
	public ArrayList<BoardsVO> svcBoardsRcntList(BoardsVO vo);
	public ArrayList<BoardsVO> svcBoardsScntList(BoardsVO vo);
	public ArrayList<BoardsVO> svcBoardsScntBestList(BoardsVO vo);
	public ArrayList<BoardsVO> svcBoardsRcntBestList(BoardsVO vo);
	public int svcBoardsDelete(int boaPk);
	public CategoriesVO svcSelectCateName(int catePk);
	public ArrayList<BoardsVO> svcBoardScrapList(BoardsVO vo);
	public int svcMyBoardScrapCount(int monPk);
	public MonstersVO svcSelectMember(int monPk);
	
}
