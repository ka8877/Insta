package com.kosmo.alone;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.social.google.api.plus.Person;

import com.kosmo.alone.vo.CurrentLocVO;
import com.kosmo.alone.vo.DestinationVO;
import com.kosmo.alone.vo.EventVO;
import com.kosmo.alone.vo.MonstersVO;
import com.kosmo.alone.vo.infoVO;

public interface MinSangService {

	public String oauthCode();
	public infoVO getToken(String code);
	public String getRefresh(String refreshToken);
	public Person getGoogleProfile(infoVO ivo);
	public String insertGoogleCal(String accessToken, String desName);
	public ArrayList<EventVO> listGoogleEvt(String accessToken, String desId);
	public Map<String, String> getGoogleEvt(String accessToken, String desId, EventVO evo);
	public Map<String, String> insertGoogleEvt(String accessToken, String desId, EventVO evo);
	public Map<String, String> updateGoogleEvt(String accessToken, String desId, EventVO evo);
	public String quickGoogleEvt(String accessToken, String desId, EventVO evo);
	public int deleteGoogleEvt(String accessToken, String desId, String evtId);
	
	public MonstersVO monLogin(String monEmail, String monId);
	public int monInsert(MonstersVO mvo);
	public int desInsert(DestinationVO dvo);
	public ArrayList<DestinationVO> desList(int monPk);
	public String desDtail(int desPk);
	public int desNewPk(int monPk);
	public int svcInsertCurrent(CurrentLocVO cvo);
	public int disabled(int monPk);
	
	public MonstersVO personToMvo(Person person, String monToken);
}
