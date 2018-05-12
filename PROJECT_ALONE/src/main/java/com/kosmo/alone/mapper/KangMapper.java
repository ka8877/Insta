package com.kosmo.alone.mapper;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.kosmo.alone.vo.BoardScrapVO;
import com.kosmo.alone.vo.BoardsVO;
import com.kosmo.alone.vo.CategoriesVO;
import com.kosmo.alone.vo.MonstersVO;
import com.kosmo.alone.vo.ReplyVO;

@Repository("kang")
public interface KangMapper {
	
	public ArrayList<BoardsVO> boardsList();
	public ArrayList<CategoriesVO> categoryList(String cateGubun);
	public ArrayList<BoardsVO> cateBoardsAllList(BoardsVO vo);
	public int boardsAllCount(int catePk);
	public ArrayList<BoardsVO> cateBoardsBestList(BoardsVO vo);
	public int boardsBestCount(BoardsVO vo);
	public int boardsInsert(BoardsVO vo);
	public int boardsUpdate(BoardsVO vo);
	public BoardsVO boardsDetail(int boaPk);
	public BoardsVO boardsFirstRegdate();
	public ArrayList<BoardsVO> boardsSearchAll(BoardsVO vo);
	public ArrayList<BoardsVO> boardsSearchGubun(BoardsVO vo);
	public int boardsSearchAllCount(BoardsVO vo);
	public int boardsSearchGubunCount(BoardsVO vo);
	public ArrayList<ReplyVO> boardsReplyList(int boaPk);
	public int boardsReplyInsert(ReplyVO vo);
	public int boardsReplyDelete(int repPk);
	public int boardsScrapInsert(BoardScrapVO vo);
	public BoardScrapVO boardsScrapSelect(BoardScrapVO vo);
	public int boardsScrapDelete(BoardScrapVO vo);
	public int boardsScrapCount(int boaPk);
	public int boardsReplyCount(int boaPk);
	public ArrayList<BoardsVO> boardsRcntList(BoardsVO vo);
	public ArrayList<BoardsVO> boardsScntList(BoardsVO vo);         
	public ArrayList<BoardsVO> boardsScntBestList(BoardsVO vo);
	public ArrayList<BoardsVO> boardsRcntBestList(BoardsVO vo);
	public int boardsDelete(int boaPk);
	public CategoriesVO selectCateName(int catePk);
	public ArrayList<BoardsVO> boardScrapList(BoardsVO vo);
	public int myBoardScrapCount(int monPk);
	public MonstersVO selectMember(int monPk);
	
}
