package com.kosmo.alone;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.alone.mapper.InYeeMapper;
import com.kosmo.alone.vo.CurrentLocVO;
import com.kosmo.alone.vo.DestinationVO;
import com.kosmo.alone.vo.LikesVO;
import com.kosmo.alone.vo.MessagesVO;
import com.kosmo.alone.vo.MonstersVO;
import com.kosmo.alone.vo.PaymentsVO;
import com.kosmo.alone.vo.ProductsVO;
import com.kosmo.common.common.OpenVO;
import com.kosmo.common.common.PagingUtil;

@Service
public class InYeeServiceImpl implements InYeeService{
	
	@Autowired
	private InYeeMapper inYeeMapper;

	public Map<String,Object> svcCurrentUsersList(int monPk, HttpServletRequest request) {

		
		/*유저 개인정보 출력*/
		MonstersVO mvo = inYeeMapper.personalInfo(monPk);
		
		/*페이징 유틸*/
		int currentPage = 1;
		int totalPage = inYeeMapper.curUserTotal(mvo.getCurrentLocVO());
		if ( request.getParameter("currentPage") != null ) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		PagingUtil pu = new PagingUtil("/community/main.do?", currentPage, totalPage , 12, 5);
		String html = pu.getPagingHtml();
		mvo.getCurrentLocVO().setSseq(pu.getStartSeq());
		mvo.getCurrentLocVO().setEseq(pu.getEndSeq());
		ArrayList<MonstersVO> curUserList = inYeeMapper.curUserList(mvo.getCurrentLocVO());
		
		/*매칭 리스트*/
		ArrayList<MessagesVO> msgList = inYeeMapper.msgList(monPk);
		
		/*Map에 담기*/
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mvo", mvo);
		map.put("curUserList", curUserList);
		map.put("msgList", msgList);
		map.put("html", html);
		
		return map;
	}
	

	@Override
	public Map<String, Object> svcSameDestination(String name, String start, String end, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int monPk = Integer.parseInt(session.getAttribute("monPk").toString());
		
		
		/*유저 개인정보 출력*/
		MonstersVO mvo = inYeeMapper.personalInfo(monPk);
		mvo.getDestinationVO().setMonPk(monPk);
		mvo.getDestinationVO().setDesName(name);
		mvo.getDestinationVO().setDesDateIn(start);
		mvo.getDestinationVO().setDesDateOut(end);
		
		/*페이징 유틸*/
		int currentPage = 1;
		int totalPage = inYeeMapper.sameDestinationCount(mvo.getDestinationVO());
		System.out.println("totalpage: "+ totalPage);
		if ( request.getParameter("currentPage") != null ) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		PagingUtil pu = new PagingUtil("/community/search.do?name="+mvo.getDestinationVO().getDesName()+"&start="+mvo.getDestinationVO().getDesDateIn()+"&end="+mvo.getDestinationVO().getDesDateOut(), currentPage, totalPage , 12, 5);
		String html = pu.getPagingHtml();
		mvo.getDestinationVO().setSseq(pu.getStartSeq());
		mvo.getDestinationVO().setEseq(pu.getEndSeq());
		ArrayList<MonstersVO> sameDestination = inYeeMapper.sameDestination(mvo.getDestinationVO());
		System.out.println("사이즈:" + sameDestination.size());
		/*매칭 리스트*/
		ArrayList<MessagesVO> msgList = inYeeMapper.msgList(monPk);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("mvo", mvo);
		map.put("sameDestination", sameDestination);
		map.put("msgList", msgList);
		map.put("html", html);
		
		return map;
	}

	@Override
	public Map<String,Object> svcInsertLike(LikesVO lvo) {
		Map<String,Object> map = new HashMap<String,Object>();
		MonstersVO mvo = new MonstersVO();
		MonstersVO subject = new MonstersVO();
		int insert = inYeeMapper.insertLike(lvo);
		int isMatched = 0;
		int greeting = 0;
		if( insert >= 1) {
			isMatched = inYeeMapper.checkLike(lvo);
			inYeeMapper.minusLoveball(lvo.getMonPk());
			subject = inYeeMapper.personalInfo(lvo.getMonPk());
			if ( isMatched >= 1) {
				greeting = inYeeMapper.insertGreeting(lvo);
				mvo = inYeeMapper.personalInfo(lvo.getLikeObject());
				map.put("isMatched", isMatched);
				map.put("mvo", mvo);
			}
			map.put("subject", subject);
		}
		return map;
	}

	@Override
	public int svcDeleteLike(LikesVO lvo) {
		int delete = inYeeMapper.deleteLike(lvo);
		int result = 0;
		if( delete >= 1) {
			MessagesVO mvo = new MessagesVO();
			mvo.setMonPk(lvo.getMonPk());
			mvo.setMesReceiver(lvo.getLikeObject());
			result = inYeeMapper.deleteMsg(mvo);
		}
		return result;
	}

	@Override
	public int svcCheckLike(LikesVO lvo) {
		return inYeeMapper.checkLike(lvo);
	}

	@Override
	public int svcCountLoveball(LikesVO lvo) {
		MonstersVO mvo = inYeeMapper.countLoveball(lvo);
		return mvo.getMonLoveball();
	}

	@Override
	public ArrayList<ProductsVO> svcProductList() {
		return inYeeMapper.productList();
	}

	@Override
	public int svcInsertPayments(int monPk, int proPk, int cnt) {
		int update = 0;
		PaymentsVO pvo = new PaymentsVO();
		pvo.setMonPk(monPk);
		pvo.setProPk(proPk);
		int insert = inYeeMapper.insertPayments(pvo);
		if(insert >= 1){
			update = inYeeMapper.updateLoveball(cnt, monPk);
		}
		
		return update;
	}

	@Override
	public ProductsVO svcKakaoPay(OpenVO ovo) {
		return inYeeMapper.paidProduct(ovo);
	}


	@Override
	public ArrayList<MessagesVO> svcSelectMessages(MessagesVO mvo) {
		ArrayList<MessagesVO> list = new ArrayList<MessagesVO>();
		inYeeMapper.updateUnread(mvo);
		if(mvo.getMesCon() == null) {
			list = inYeeMapper.selectMessages(mvo);
		} else {
			int result = inYeeMapper.insertMsg(mvo);
			if (result >= 1 ){
				list =  inYeeMapper.selectMessages(mvo);
			}
		}
		return list;
	}


	@Override
	public int svcDeleteMsg(MessagesVO mvo) {
		return inYeeMapper.deleteMsg(mvo);
	}


	@Override
	public int svcInsertCurrent(CurrentLocVO cvo) {
		return inYeeMapper.insertCurrent(cvo);
	}


	@Override
	public int svcChangeCharged(int monPk) {
		return inYeeMapper.changeCharged(monPk);
	}





}
