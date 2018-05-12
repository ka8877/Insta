package com.kosmo.alone;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kosmo.alone.mapper.DeHeeMapper;
import com.kosmo.alone.vo.HotRoutesVO;
import com.kosmo.alone.vo.HotspotsVO;
import com.kosmo.alone.vo.RoutesVO;
import com.kosmo.alone.vo.RoutesViewVO;

@Service
public class DeHeeServiceImpl implements DeHeeService{
	
	@Autowired
	private DeHeeMapper dao;

	private String upload_file_dir = "C:\\Users\\dmdel\\Desktop\\myworkspace\\springkang\\PROJECT_ALONE\\src\\main\\webapp\\img\\route"; //절대경로.. 필요하면 바꿔야지 뭐
	
	@Override
	public ArrayList<HotspotsVO> hotList() {				
		return dao.hotList();
	}

	@Override
	public ArrayList<RoutesVO> routeList() {
		return dao.routeList();
	}

	@Override
	public ArrayList<RoutesVO> noRouteList() {
		return dao.noRouteList();
	}

	@Override
	public ArrayList<RoutesViewVO> routeViewList(int rouPk) {		
		return dao.routeViewList(rouPk);
	}

	@Override
	public RoutesVO getRoute(int rouPk) {
		return dao.getRoute(rouPk);
	}

	@Override
	public int routeInsert(RoutesVO vo) {
		MultipartFile ufile = vo.getUfile();
		if(!ufile.isEmpty()) {
			String fullPath = upload_file_dir+"\\"+ufile.getOriginalFilename();
			File newFile = new File(fullPath); //빈 파일생성
			try {
				ufile.transferTo(newFile);//간략화된 파일 write 방법
			} catch (IllegalStateException e) {
			} catch (IOException e) {
			} 
			vo.setRouImg("img\\route\\"+ufile.getOriginalFilename());
		}
		return dao.routeInsert(vo);
	}
	
	@Override
	public void routeReviewUpdate(int rouPk) {
		RoutesVO vo = dao.getRoute(rouPk);
		int oldView = vo.getRouView();
		oldView+=1;
		RoutesVO vo2 = new RoutesVO();
		vo2.setRouView(oldView);
		vo2.setRouPk(rouPk);
		dao.routeReviewUpdate(vo2);
	}

	@Override
	public void routeDelete(RoutesVO vo) {
		dao.routeDelete(vo);
		dao.hotRouteDelete(vo);
	}

	public void hotRouteInsert(HotRoutesVO vo) {
		int[] hotNum = vo.getHotArray();
		int rouPk = vo.getRouPk();
		
		for(int i=0; i<hotNum.length; i++){
			vo.setRouPk(rouPk);
			vo.setHotPk(hotNum[i]);
			vo.setRouOrder(i+1);
			
			dao.hotRouteInsert(vo);
		}
	}

	public void spotInsert(HotspotsVO vo){
		dao.spotInsert(vo);
	}

}
