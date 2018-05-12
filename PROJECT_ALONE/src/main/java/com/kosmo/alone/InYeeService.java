package com.kosmo.alone;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.kosmo.alone.vo.CurrentLocVO;
import com.kosmo.alone.vo.DestinationVO;
import com.kosmo.alone.vo.LikesVO;
import com.kosmo.alone.vo.MessagesVO;
import com.kosmo.alone.vo.MonstersVO;
import com.kosmo.alone.vo.PaymentsVO;
import com.kosmo.alone.vo.ProductsVO;
import com.kosmo.common.common.OpenVO;

public interface InYeeService {
	public Map<String,Object> svcCurrentUsersList(int monPk, HttpServletRequest request);
	public Map<String,Object> svcInsertLike(LikesVO lvo);
	public int svcDeleteLike(LikesVO lvo);
	public int svcCheckLike(LikesVO lvo);
	public int svcCountLoveball(LikesVO lvo);
	public ArrayList<ProductsVO> svcProductList();
	public int svcInsertPayments(int monPk, int proPk, int cnt);
	public ArrayList<MessagesVO> svcSelectMessages(MessagesVO mvo);
	public int svcDeleteMsg(MessagesVO mvo);
	public ProductsVO svcKakaoPay(OpenVO ovo);
	public int svcInsertCurrent(CurrentLocVO cvo);
	public Map<String,Object> svcSameDestination(String name, String start, String end, HttpServletRequest request);
	public int svcChangeCharged(int monPk);
//	public ArrayList<MessagesVO> svcMsgList(int monPk);
//	public ProductsVO svcPaidProduct(PaymentsVO pvo);
//	public int svcInsertMsg(MessagesVO mvo);
//	public MonstersVO svcPersonalInfo(int monPk);
//	public ArrayList<MonstersVO> svcCurUserList(CurrentLocVO cvo);
//	public int svcCurUserTotal(CurrentLocVO cvo);
//	public int svcInsertGreeting(LikesVO lvo);
}
