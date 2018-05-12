package com.kosmo.alone;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.alone.mapper.DongWooMapper;
import com.kosmo.alone.vo.HotPicsVO;
import com.kosmo.alone.vo.HotReviewsVO;
import com.kosmo.alone.vo.HotScrapsVO;
import com.kosmo.alone.vo.HotspotsVO;
import com.kosmo.alone.vo.MonstersVO;
import com.alone.common.PagingUtil;


@Service
public class DongWooServiceImpl implements DongWooService{
	
	@Autowired
	private DongWooMapper dao;



	@Override
	public HashMap<String,Object> svcHotSpotDetail(HotspotsVO vo) {
		HashMap<String,Object> map = new HashMap<String,Object>();
				
		//스크랩
		HotspotsVO scrapvo = dao.detailScrap(vo);
		map.put("scrapvo",scrapvo );
		//사진
		ArrayList<HotspotsVO> piclist = dao.detailPic(vo);
		map.put("piclist",piclist);
		//리뷰
		ArrayList<HotspotsVO> revlist = dao.detailReview(vo);
		map.put("revlist", revlist);
		//회원
		
		
		//별점
		double avgRating = 0; 
		int totalReviewer = revlist.size();		
		for( int i = 0 ; i<revlist.size(); i++){			
			avgRating += revlist.get(i).getHotCostRating();					
		}
		
		avgRating = avgRating/totalReviewer ; //평균 별점
		if(avgRating >= 1 ){
			avgRating = Double.parseDouble( String.format( "%.1f" , avgRating) ); //반올림
		}else
			avgRating = 0;
		 
		//개별 별점 합계
		HotspotsVO costcntvo = new HotspotsVO();
		costcntvo = dao.detailReviewCostCnt(vo);
		map.put("costcntvo", costcntvo);
		
		
		
		//장소정보
		HotspotsVO spotvo = dao.detailSpot(vo);
		spotvo.setAvgRating(avgRating);
		spotvo.setTotalReviewer(totalReviewer);
		
		map.put("spotvo", spotvo);		

		
		return map;
	}



	//스팟 스크랩 추가  필수 파람 monpk, hotpk 
	@Override
	public int svcInsertScrap(HotspotsVO vo) {
		return dao.insertScrap(vo);		
	}
	//스팟 스크랩 삭제 필수 파람 monpk, hotpk 
	@Override
	public int svcDeleteScrap(HotspotsVO vo) {
		return dao.deleteScrap(vo);		
	}
	

	@Override	
	public  HashMap<String,Object> svcHotSpotList(HotspotsVO vo) {
		
		HashMap<String,Object> map = new HashMap<String,Object>();

//카테고리 1 페이징	
		vo.setHotCateSeq(1);
		HotspotsVO cate1vo = new HotspotsVO();
//		map = svcPagingStr(vo);
		cate1vo = svcPagingStr(vo);
		vo.setSseq(cate1vo.getSseq());
		vo.setEseq(cate1vo.getEseq());
		String html1 = cate1vo.getHtml();
//		System.out.println("페이징잘 되었나? : " + html1);
		map.put("LVL_CATE1_LIST", dao.hotSpotList(vo));
		map.put("LVL_PAGING1", html1);
//--------------------------------------------------------------------
	//카테고리 2 페이징	
		vo.setHotCateSeq(2);
		HotspotsVO cate2vo = new HotspotsVO();
//		map = svcPagingStr(vo);
		cate2vo = svcPagingStr(vo);
		vo.setSseq(cate2vo.getSseq());
		vo.setEseq(cate2vo.getEseq());
		String html2 = cate2vo.getHtml();
		map.put("LVL_CATE2_LIST", dao.hotSpotList(vo));
		map.put("LVL_PAGING2", html2);
//--------------------------------------------------------------------	
		//카테고리 3 페이징	
		vo.setHotCateSeq(3);
		HotspotsVO cate3vo = new HotspotsVO();
//		map = svcPagingStr(vo);
		cate3vo = svcPagingStr(vo);
		vo.setSseq(cate3vo.getSseq());
		vo.setEseq(cate3vo.getEseq());
		String html3 = cate3vo.getHtml();
		map.put("LVL_CATE3_LIST", dao.hotSpotList(vo));
		map.put("LVL_PAGING3", html3);
//--------------------------------------------------------------------		
	return  map;
	
}

	
	public HotspotsVO svcPagingStr(HotspotsVO vo){
		PagingUtil pu
		= new PagingUtil("/hot_spot_list.do?hotCity="+vo.getHotCity()
				, vo.getCurrentPage()
				, dao.hotSpotCount(vo)  //------------
				, 9	//선택한 2번 블럭에 나타날 게시물 갯수
				, 5 // 1 2 [다음]
				);
		String  html = pu.getPagingHtml();
		vo.setSseq(pu.getStartSeq());
		vo.setEseq(pu.getEndSeq());
		
		vo.setHtml(html);
		
		return vo;
	}

	//리뷰작성
	@Override
	public HotReviewsVO svcRevInsert(HotReviewsVO vo) {
		int res = dao.revInsert(vo);//인서트 
		if(res!= 0){//성공시 방금 작성 한 리뷰 ajax 출력
//			System.out.println("리뷰 인서트@@@@@@@@@@@@@@@");
			vo.setHotRevPk(dao.findRevCurrvall());
//			System.out.println("리뷰 시퀀스 값"+vo.getHotRevPk());
			vo = dao.myRevSelect(vo);
		}		
		return vo;
	}

//리뷰 딜리트
	@Override
	public int svcRevDelete(HotReviewsVO vo) {
			System.out.println("여기는 서비스 리뷰 딜리트@@@");	
		int res = dao.revDelete(vo);
	
		return res;
	}


	
	@Override
	public HashMap<String,Object> svcSpotScrapList(MonstersVO vo) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		MonstersVO monvo = new MonstersVO();
		monvo = dao.monInfo(vo);
		ArrayList<HotspotsVO> list = new ArrayList<HotspotsVO>();
		list = dao.scrapListPage(vo);
		
		map.put("LVL_MON_VO", monvo);
		map.put("LVL_SCR_LIST", list);
		return map;
	}

	@Override
	public MonstersVO svcBoardScrapList(MonstersVO vo){
		MonstersVO monvo = new MonstersVO();
		monvo = dao.monInfo(vo);
		
		
		return monvo;
	};
	
	
	/**
	 * 페이징용 html 텍스트 출력 메서드
	 * @param vo String hotCity, int hotCateSeq, int currentPage
	 * @return String pagingSTR(html) , vo(sseq,eseq)
	 */
		/*
		public HashMap<String,Object> svcPagingStr(HotspotsVO vo){
			PagingUtil pu
			= new PagingUtil("/hot_spot_list_old.do?"
					, vo.getCurrentPage()
					, dao.hotSpotCount(vo)  //------------
					, 9	//선택한 2번 블럭에 나타날 게시물 갯수
					, 5 // 1 2 [다음]
					);
			String  html = pu.getPagingHtml();
			vo.setSseq(pu.getStartSeq());
			vo.setEseq(pu.getEndSeq());
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("LVL_PAGING", html);
			map.put("vo", vo);
			
			return map;
		}
		*/
	
}
