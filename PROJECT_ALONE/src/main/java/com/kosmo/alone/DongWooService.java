package com.kosmo.alone;

import java.util.ArrayList;
import java.util.HashMap;

import com.kosmo.alone.vo.HotReviewsVO;
import com.kosmo.alone.vo.HotspotsVO;
import com.kosmo.alone.vo.MonstersVO;



public interface DongWooService {

	/**
	 * 핫스팟 목록 데이터.
	 * @param vo String-hotCity, int-hotCatePk ...+ 페이징 
	 * @return ArrayList<HotspotsVO>
	 */
	public  HashMap<String,Object> svcHotSpotList(HotspotsVO vo);
	
	/**
	 * 선택된 장소의 디테일 데이터
	 * 장소,리뷰,사진,스크랩
	 * @param vo int-hotPk
	 * @return HashMap
	 */
	public HashMap<String,Object> svcHotSpotDetail(HotspotsVO vo);
	
	/**
	 * 스크랩추가
	 * @param vo mon_pk, hot_pk
	 */
	public int svcInsertScrap(HotspotsVO vo);
	
	/**
	 * 스크랩삭제
	 * @param vo mon_pk, hot_pk
	 */
	public int svcDeleteScrap(HotspotsVO vo);
	
	
	/**
	 * 리뷰 작성
	 * @param vo monPk, hotPk, hotRevCon, hotCostRating
	 */
	public HotReviewsVO svcRevInsert(HotReviewsVO vo);
	
	/**
	 * 리뷰 삭제
	 * @param vo hotRevPk
	 * @return
	 */
	public int svcRevDelete(HotReviewsVO vo);
	
	/**
	 * 방금 작성한 리뷰 뿌리기
	 * @param vo
	 * @return
	 */
	
	/**
	 * 나의 스크랩 페이지. (명소)
	 * @param vo monPk
	 * @return HashMap
	 */
	public HashMap<String,Object> svcSpotScrapList(MonstersVO vo);
	
	/**
	 * 내정보.
	 * @param vo monPk
	 * @return MonstersVO
	 */
	public MonstersVO svcBoardScrapList(MonstersVO vo);
	
}
