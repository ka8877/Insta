package com.kosmo.alone.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosmo.alone.vo.CurrentLocVO;
import com.kosmo.alone.vo.DestinationVO;
import com.kosmo.alone.vo.LikesVO;
import com.kosmo.alone.vo.MessagesVO;
import com.kosmo.alone.vo.MonstersVO;
import com.kosmo.alone.vo.PaymentsVO;
import com.kosmo.alone.vo.ProductsVO;
import com.kosmo.common.common.OpenVO;

@Repository("inYeeMapper")
public interface InYeeMapper {
	public MonstersVO personalInfo(int monPk);
	public ArrayList<MonstersVO> curUserList(CurrentLocVO cvo);
	public int curUserTotal(CurrentLocVO cvo);
	public int insertLike(LikesVO lvo);
	public int deleteLike(LikesVO lvo);
	public int checkLike(LikesVO lvo);
	public ArrayList<MessagesVO> msgList(int monPk);
	public int insertGreeting(LikesVO lvo);
	public MonstersVO countLoveball(LikesVO lvo);
	public ArrayList<ProductsVO> productList();
	public int insertPayments(PaymentsVO pvo);
	public ArrayList<MessagesVO> selectMessages(MessagesVO mvo);
	public int insertMsg(MessagesVO mvo);
	public int updateUnread(MessagesVO mvo);
	public int deleteMsg(MessagesVO mvo);
	public ProductsVO paidProduct(OpenVO ovo);
	public int updateLoveball(@Param("cnt") int cnt, @Param("monPk") int monPk);
	public int insertCurrent(CurrentLocVO cvo);
	public ArrayList<MonstersVO> sameDestination(DestinationVO dvo);
	public int sameDestinationCount(DestinationVO dvo);
	public int minusLoveball(int monPk);
	public int changeCharged(int monPk);
}
