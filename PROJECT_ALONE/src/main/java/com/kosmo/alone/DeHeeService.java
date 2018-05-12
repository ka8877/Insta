package com.kosmo.alone;

import java.util.ArrayList;

import com.kosmo.alone.vo.HotRoutesVO;
import com.kosmo.alone.vo.HotspotsVO;
import com.kosmo.alone.vo.RoutesVO;
import com.kosmo.alone.vo.RoutesViewVO;

public interface DeHeeService {
	
	public ArrayList<HotspotsVO> hotList();
	public ArrayList<RoutesVO> routeList();
	public ArrayList<RoutesVO> noRouteList();
	public RoutesVO getRoute(int rouPk);
	public ArrayList<RoutesViewVO> routeViewList(int rouPk);
	public int routeInsert(RoutesVO vo);
	public void routeReviewUpdate(int rouPk);
	public void routeDelete(RoutesVO vo);
	public void hotRouteInsert(HotRoutesVO vo);
	public void spotInsert(HotspotsVO vo);
}
