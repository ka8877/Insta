package com.kosmo.alone.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.kosmo.alone.vo.HotPicsVO;
import com.kosmo.alone.vo.HotReviewsVO;
import com.kosmo.alone.vo.HotScrapsVO;
import com.kosmo.alone.vo.HotspotsVO;
import com.kosmo.alone.vo.MonstersVO;



@Repository("dongwoo")
public interface DongWooMapper {
	
	
	//리스트페이지
	public ArrayList<HotspotsVO> hotSpotList(HotspotsVO vo);
	public int hotSpotCount(HotspotsVO vo);
	
	
	//디테일페이지
	public HotspotsVO detailSpot(HotspotsVO vo);
	public HotspotsVO detailScrap(HotspotsVO vo);
	public ArrayList<HotspotsVO> detailPic(HotspotsVO vo);
	public ArrayList<HotspotsVO> detailReview(HotspotsVO vo); 
	public HotspotsVO detailReviewCostCnt(HotspotsVO vo);
	
	//스크랩 + - 
	public int insertScrap(HotspotsVO vo);
	public int deleteScrap(HotspotsVO vo);

	//리뷰 +-
	public int revInsert(HotReviewsVO vo);
	public int findRevCurrvall();//가장 최근 인서트한 리뷰seq 반환
	public HotReviewsVO myRevSelect(HotReviewsVO vo);
	public int revDelete(HotReviewsVO vo);
	
	
	//스크랩페이지
	public MonstersVO monInfo(MonstersVO vo);
	public ArrayList<HotspotsVO> scrapListPage(MonstersVO vo);
	
}
