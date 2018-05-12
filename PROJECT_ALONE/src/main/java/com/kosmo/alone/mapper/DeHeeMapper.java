package com.kosmo.alone.mapper;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.kosmo.alone.vo.HotRoutesVO;
import com.kosmo.alone.vo.HotspotsVO;
import com.kosmo.alone.vo.RoutesVO;
import com.kosmo.alone.vo.RoutesViewVO;

@Repository("dehee")
public interface DeHeeMapper {
	
	/**
	 * Map에 뿌릴 마커를 위한 관광지 리스트
	 * @return ArrayList<HotspotsVO>
	 */
	public ArrayList<HotspotsVO> hotList();	
	
	/**
	 * 추천하는 일정의 목록을 뿌리기 위한 리스트
	 * @return ArrayList<RoutesVO>
	 */
	public ArrayList<RoutesVO> routeList();
	
	/**
	 * 일정 내용이 없는 추천일정 목록을 뿌리기 위한 리스트
	 * @return ArrayList<RoutesVO>
	 */
	public ArrayList<RoutesVO> noRouteList();
	
	/**
	 * rouPk로 특정한 일정 하나의 내용물
	 * @param rouPk
	 * @return RoutesVO
	 */
	public RoutesVO getRoute(int rouPk);
	
	/**
	 * 추천 일정의 상세 내용을 보기 위한 view를 부르는 list
	 * @return ArrayList<RoutesViewVO>
	 */
	public ArrayList<RoutesViewVO> routeViewList(int rouPk);
	
	/**
	 * 일정 입력
	 * @param RoutesVO
	 */
	public int routeInsert(RoutesVO vo);
	
	/**
	 * 일정 리뷰수 ++
	 * @param RoutesVO
	 */
	public void routeReviewUpdate(RoutesVO vo);
	
	/**
	 * 내용 없는 일정 중 선택해서 삭제
	 * @param RoutesVO
	 */
	public int routeDelete(RoutesVO vo);
	
	/**
	 * 선택한 일정 삭제하면서 내용물도 삭제
	 * @param RoutesVO
	 */
	public int hotRouteDelete(RoutesVO vo);
	
	/**
	 * 일정에 내용을 채워넣는다
	 * @param HotRoutesVO
	 */
	public void hotRouteInsert(HotRoutesVO vo);
	
	/**
	 * 관광지를 입력
	 * @param HotspotsVO vo
	 */
	public void spotInsert(HotspotsVO vo);
	
}
