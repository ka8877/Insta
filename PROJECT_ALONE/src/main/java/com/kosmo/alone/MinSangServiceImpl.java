package com.kosmo.alone;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kosmo.alone.mapper.MinSangMapper;
import com.kosmo.alone.vo.CurrentLocVO;
import com.kosmo.alone.vo.DestinationVO;
import com.kosmo.alone.vo.EventVO;
import com.kosmo.alone.vo.MonstersVO;
import com.kosmo.alone.vo.infoVO;

@Service
public class MinSangServiceImpl implements MinSangService{
	
	@Autowired
	private MinSangMapper dao;
	
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
//	==================================================================================google

	@Override
	public String oauthCode() {
		
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations(); 
		
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		System.out.println(url);
		
		url = url+"&access_type=offline";
		
		System.out.println(url);
		
		return url;
	}
	
	@Override
	public infoVO getToken(String code){
		
		System.out.println("code = " + code);
		
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations(); 
		
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(), null); 
		System.out.println(accessGrant);
		String accessToken = accessGrant.getAccessToken(); 
		System.out.println(accessToken);
		String refreshToken = accessGrant.getRefreshToken();
		System.out.println(refreshToken);
		Long expireTime = accessGrant.getExpireTime(); 
		System.out.println(expireTime);
		
		infoVO ivo = new infoVO();
		
		ivo.setAccessGrant(accessGrant);
		ivo.setAccessToken(accessToken);
		ivo.setExpireTime(expireTime);
		ivo.setRefreshToken(refreshToken);
		
		return ivo;
	}
	
	@Override
	public String getRefresh(String refreshToken){
		
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations(); 
		AccessGrant accessGrant = oauthOperations.refreshAccess(refreshToken, null); 
		
		return accessGrant.getAccessToken();
	}
	
	@Override
	public Person getGoogleProfile(infoVO ivo){
		
		Connection<Google> connection = googleConnectionFactory.createConnection(ivo.getAccessGrant()); 
		Google google = connection == null ? new GoogleTemplate(ivo.getAccessToken()) : connection.getApi(); 
		PlusOperations plusOperations = google.plusOperations(); 
		Person person = plusOperations.getGoogleProfile();
		
		return person;
	}
	
	@Override
	public String insertGoogleCal(String accessToken, String desName){
		
		String result = null;
		String desId = null;
		
		try{
			URL url = new URL(
					"https://www.googleapis.com/calendar/v3/calendars"
							+ "?access_token=" 
							+ accessToken
					);
			
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setDoOutput(true); conn.setDoInput(true); conn.setDefaultUseCaches(false);
			conn.setRequestMethod("POST"); conn.setRequestProperty("content-type", "application/json");
			
//			ajax setting
			Gson gson = new Gson();
			JsonObject jo = new JsonObject();
			JsonElement je = null;
			JsonParser jp = new JsonParser();
			
//			제목 세팅
			jo.addProperty("summary", "alone_Calendar_" + desName);
			String json = gson.toJson(jo);
			System.out.println(json);
			
			StringBuffer buffer = new StringBuffer();
			
			buffer.append(json);	//파라미터
			
			PrintWriter pw = new PrintWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
			pw.write(buffer.toString());  pw.flush();
			
			//구글에서 온 답변 받기
			int responseCode = conn.getResponseCode();
			System.out.println("insertGoogleCal 응답받기 ::::  " + responseCode);
			
			if (responseCode == HttpURLConnection.HTTP_OK) { //success
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				StringBuilder builder = new StringBuilder();
				String inputLine;
				while ((inputLine = br.readLine()) != null) {
					builder.append(inputLine + "\n");
				}
				br.close();
				result = builder.toString();
				System.out.println(result);
				
				je = jp.parse(result);
				desId = je.getAsJsonObject().get("id").getAsString();
				System.out.println(desId);
				String summary = je.getAsJsonObject().get("summary").getAsString();
				System.out.println(summary);
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return desId;
	}
	
	@Override
	public ArrayList<EventVO> listGoogleEvt(String accessToken, String desId){
		
//		setting
		String result = null;
		ArrayList<EventVO> list = new ArrayList<EventVO>();
		
//		ajax setting
		JsonElement je = null;
		JsonParser jp = new JsonParser();
		
		try {
			
			URL url = new URL(
    				"https://www.googleapis.com/calendar/v3/calendars/"
    				+ desId
    				+ "/events?access_token=" 
    				+ accessToken
    				);
			
    		HttpURLConnection conn = (HttpURLConnection)url.openConnection();

			conn.setDoInput(true);
			conn.setDefaultUseCaches(false);
			conn.setRequestMethod("GET");
			
			int responseCode = conn.getResponseCode();
    		System.out.println("listGoogleEvt 응답받기 ::::  " + responseCode);
    		
    		if (responseCode == HttpURLConnection.HTTP_OK) { //success
    			
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				StringBuilder builder = new StringBuilder();
				String inputLine;
				while ((inputLine = br.readLine()) != null) {
					builder.append(inputLine + "\n");
				}
				br.close();
				
				result = builder.toString();
				System.out.println(result);
				
//				Json타입의 String을 json으로 만들어서 꺼내기
				je = jp.parse(result);
				JsonArray itemArray = je.getAsJsonObject().getAsJsonArray("items");
				System.out.println(itemArray);
				
//				JSONArray에 담은 array형태의 json꺼내기
				for(JsonElement jeItem: itemArray){
					String id = jeItem.getAsJsonObject().get("id").getAsString();
//					String htmlLink = jeItem.getAsJsonObject().get("htmlLink").getAsString();
					System.out.println(id);
					String summary = null;
					String description = null;
					String colorId = null;
					String location = null;
					EventVO evo = new EventVO();
					
					if(jeItem.getAsJsonObject().get("location") != null){
						summary = jeItem.getAsJsonObject().get("location").getAsString();
						System.out.println(summary);
					} else if(jeItem.getAsJsonObject().get("summary") != null){
						summary = jeItem.getAsJsonObject().get("summary").getAsString();
						System.out.println(summary);
					}
					
					if(jeItem.getAsJsonObject().get("description") != null){
						description = jeItem.getAsJsonObject().get("description").getAsString();
						System.out.println(description);
					}
					if(jeItem.getAsJsonObject().get("colorId") != null){
						colorId = jeItem.getAsJsonObject().get("colorId").getAsString();
						System.out.println(colorId);
						evo.setColorId(colorId);
						evo = colorPaser(evo);
						
					}
					
					JsonElement jeStrart = jp.parse(jeItem.getAsJsonObject().get("start").toString());
					evo.setStartDate(jeStrart.getAsJsonObject().get("dateTime").getAsString());
					System.out.println(evo.getStartDate());
					
					JsonElement jeEnd = jp.parse(jeItem.getAsJsonObject().get("end").toString());
					evo.setEndDate(jeEnd.getAsJsonObject().get("dateTime").getAsString());
					System.out.println(evo.getEndDate());
					
					evo = inverseDatePaser(evo);
					
					System.out.println(evo.getStartDate());
					System.out.println(evo.getEndDate());
					
					evo.setSummary(summary);
					evo.setEvtId(id);
//					
		    		list.add(evo);
				}
				
//	    		확인용
				for(int i=0;i<list.size();i++){
					System.out.println(list.get(i).getEvtId());
				}
				
    		}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	@Override
	public Map<String, String> getGoogleEvt(String accessToken, String desId, EventVO evo){
		
		String result;
		Map<String, String> map = new HashMap<String, String>();
		
//		ajax setting
		JsonElement je = null;
		JsonParser jp = new JsonParser();
		
		try {
			URL url = new URL(
					"https://www.googleapis.com/calendar/v3/calendars/"
							+ desId
							+ "/events/"
							+ evo.getEvtId()
							+ "?access_token=" 
							+ accessToken
					);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setDoInput(true); conn.setDefaultUseCaches(false); conn.setRequestMethod("GET");
			
			int responseCode = conn.getResponseCode();
			System.out.println("응답받기 ::::  " + responseCode);
			
			if (responseCode == HttpURLConnection.HTTP_OK) { //success
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				StringBuilder builder = new StringBuilder();
				String inputLine;
				while ((inputLine = br.readLine()) != null) {
					builder.append(inputLine + "\n");
				}
				br.close();
				result = builder.toString();
				System.out.println(result);
				

				je = jp.parse(result);
				String evtId = je.getAsJsonObject().get("id").getAsString();
				System.out.println(evtId);
				
				if(je.getAsJsonObject().get("location") != null){
					String summary = je.getAsJsonObject().get("location").getAsString();
					map.put("summary", summary);
				} else if(je.getAsJsonObject().get("summary") != null){
					String summary = je.getAsJsonObject().get("summary").getAsString();
					map.put("summary", summary);
				}
				if(je.getAsJsonObject().get("description") != null){
					String description = je.getAsJsonObject().get("description").getAsString();
					map.put("description", description);
				}
				
				String htmlLink = je.getAsJsonObject().get("htmlLink").getAsString();
				map.put("htmlLink", htmlLink);
				
				String location = null;
				if(je.getAsJsonObject().get("location") != null){
					location = je.getAsJsonObject().get("location").getAsString();
					map.put("location", location);
				}
				
			}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
	
	
	@Override
	public Map<String, String> insertGoogleEvt(String accessToken, String desId, EventVO evo){
		
		String result = null;
		String evtId = null;
		Map<String, String> map = new HashMap<String, String>();
		
		try {
			
			URL url = new URL(
					"https://www.googleapis.com/calendar/v3/calendars/"
							+ desId
							+ "/events?access_token=" 
							+ accessToken
					);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setDoOutput(true); conn.setDoInput(true); conn.setDefaultUseCaches(false);
    		conn.setRequestMethod("POST"); conn.setRequestProperty("content-type", "application/json");
			
    		JsonObject startjo = new JsonObject();
    		JsonObject endjo = new JsonObject();
    		JsonObject wrapperjo = new JsonObject();
			
//			ajax setting
			Gson gson = new Gson();
			JsonElement je = null;
			JsonParser jp = new JsonParser();
			
			//날짜포맷
			evo = datePaser(evo);
			//칼라매치
			evo = colorPaser(evo);
			
    		startjo.addProperty("dateTime", evo.getStartDate());
    		System.out.println(gson.toJson(startjo));
    		endjo.addProperty("dateTime", evo.getEndDate());
    		System.out.println(gson.toJson(endjo));
    		
			
//    		json에 json담을 때
    		wrapperjo.add("start", gson.toJsonTree(startjo));
    		wrapperjo.add("end", gson.toJsonTree(endjo));
//    		json에 일반 String 담을 때
    		if(evo.getSummary() != null){
    			wrapperjo.addProperty("summary", evo.getSummary());
    		}
    		if(evo.getLocation() != null){
    			wrapperjo.addProperty("location", evo.getLocation());
    		}
    		if(evo.getColorId() != null){
    			wrapperjo.addProperty("colorId", evo.getColorId());
    		}
    		System.out.println(wrapperjo);
    		
    		String json = gson.toJson(wrapperjo);
    		System.out.println(json);
    		
    		
    		PrintWriter pw = new PrintWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
	        pw.write(json);
    		pw.flush();
    		
			int responseCode = conn.getResponseCode();
			System.out.println("insertGoogleEvt 응답받기 ::::  " + responseCode);
			
			if (responseCode == HttpURLConnection.HTTP_OK) { //success
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				StringBuilder builder = new StringBuilder();
				String inputLine;
				while ((inputLine = br.readLine()) != null) {
					builder.append(inputLine + "\n");
				}
				br.close();
				result = builder.toString();
				System.out.println(result);
				
				je = jp.parse(result);
    			evtId = je.getAsJsonObject().get("id").getAsString();
    			System.out.println(evtId);
    			
    			if( je.getAsJsonObject().get("location") != null){
    				String summary = je.getAsJsonObject().get("location").getAsString();
    				System.out.println(summary);
    				map.put("summary", summary);
    			} else if( je.getAsJsonObject().get("summary") != null){
    				String summary = je.getAsJsonObject().get("summary").getAsString();
    				System.out.println(summary);
    				map.put("summary", summary);
    			}
    			
//    			String description = je.getAsJsonObject().get("description").getAsString();
    			String htmlLink = je.getAsJsonObject().get("htmlLink").getAsString();

				JsonElement jeStrart = jp.parse(je.getAsJsonObject().get("start").toString());
				evo.setStartDate(jeStrart.getAsJsonObject().get("dateTime").getAsString());
				System.out.println(evo.getStartDate());
				
				JsonElement jeEnd = jp.parse(je.getAsJsonObject().get("end").toString());
				evo.setEndDate(jeEnd.getAsJsonObject().get("dateTime").getAsString());
				System.out.println(evo.getEndDate());
				
//	    		날짜 세팅
				evo = inverseDatePaser(evo);
				System.out.println(evo.getStartDate());
				System.out.println(evo.getEndDate());
				
//    			System.out.println(description);
    			System.out.println(htmlLink);
    			map.put("evtId", evtId);
    			map.put("start", evo.getStartDate());
    			map.put("end", evo.getEndDate());
    			
			}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return map;
	}
	
	@Override
	public Map<String, String> updateGoogleEvt(String accessToken, String desId, EventVO evo){
		
		String result = null;
		Map<String, String> map = new HashMap<String, String>();
		try{
			URL url = new URL(
					"https://www.googleapis.com/calendar/v3/calendars/"
							+ desId
							+ "/events/"
							+ evo.getEvtId()
							+ "?access_token=" 
							+ accessToken
					);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setDefaultUseCaches(false);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("X-HTTP-Method-Override", "PATCH");
			conn.setRequestProperty("content-type", "application/json");
			
//			ajax setting
			Gson gson = new Gson();
			JsonParser jp = new JsonParser();
			JsonElement je = null;
			
			StringBuffer buffer = new StringBuffer();
			
			
			JsonObject wrapperjo = new JsonObject();
			
			if(evo.getLocation() != null){
				wrapperjo.addProperty("location", evo.getLocation());
			} else if(evo.getSummary() != null){
				wrapperjo.addProperty("summary", evo.getSummary());
			}
			if(evo.getDescription() != null){
				wrapperjo.addProperty("description", evo.getDescription());
			}
			if(evo.getEndDate() != null){
				evo = datePaser(evo);
				JsonObject endjo = new JsonObject();
				endjo.addProperty("dateTime", evo.getEndDate());
				wrapperjo.add("end", gson.toJsonTree(endjo));
			}
			if(evo.getStartDate() != null){
				evo = datePaser(evo);
				JsonObject startjo = new JsonObject();
				startjo.addProperty("dateTime", evo.getStartDate());
				wrapperjo.add("start", gson.toJsonTree(startjo));
			}
			
			String json = gson.toJson(wrapperjo);
			System.out.println(json);
			
			buffer.append(json);	//파라미터
			
			PrintWriter pw = new PrintWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
			pw.write(buffer.toString());
			pw.flush();
			
			
			//구글에서 온 답변 받기
			int responseCode = conn.getResponseCode();
			System.out.println("updateGoogleEvt 응답받기 ::::  " + responseCode);
			
			if (responseCode == HttpURLConnection.HTTP_OK) { //success
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				StringBuilder builder = new StringBuilder();
				String inputLine;
				
				while ((inputLine = br.readLine()) != null) {
					builder.append(inputLine + "\n");
				}
				br.close();
				result = builder.toString();
				System.out.println(result);
				
				je = jp.parse(result);
				String evtId = je.getAsJsonObject().get("id").getAsString();
				System.out.println(evtId);
				if(je.getAsJsonObject().get("location") != null){
					String summary = je.getAsJsonObject().get("location").getAsString();
					System.out.println(summary);
					map.put("summary", summary);
				} else if(je.getAsJsonObject().get("summary") != null){
					String summary = je.getAsJsonObject().get("summary").getAsString();
					System.out.println(summary);
					map.put("summary", summary);
				}
				String htmlLink = je.getAsJsonObject().get("htmlLink").getAsString();
				
				if(je.getAsJsonObject().get("description") != null){
					String description = je.getAsJsonObject().get("description").getAsString();
					System.out.println(description);
					map.put("description", description);
				}
				
				System.out.println(htmlLink);
				
				map.put("htmlLink", htmlLink);
				
			}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return map; 
	}
	
	@Override
	public String quickGoogleEvt(String accessToken, String desId, EventVO evo){
		
		String result = null;
		try {
			
			URL url = new URL(
    				"https://www.googleapis.com/calendar/v3/calendars"
    						+ "/"
    						+ desId
    						+ "/events/quickAdd"
    						+ "?access_token=" 
							+ accessToken
    				);
			
			evo.setSummary(URLEncoder.encode(evo.getSummary(), "UTF-8"));
			
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			StringBuffer buffer = new StringBuffer();
			buffer.append("text").append("=");	//파라미터
			buffer.append(evo.getSummary());
			byte[] textPram = buffer.toString().getBytes("UTF-8");
			
    		conn.setDoOutput(true);
    		conn.setDoInput(true);
    		conn.setDefaultUseCaches(false);
    		conn.setRequestMethod("POST");
    		conn.setRequestProperty("content-type", "application/x-www-form-urlencoded");
    		conn.setRequestProperty("content-length", "" + textPram.length);
    		
    		conn.getOutputStream().write(textPram);
    		conn.getOutputStream().flush();
    		
//			ajax setting
    		JsonParser jp = new JsonParser();
    		JsonElement je = null;
    		
    		//구글에서 온 답변 받기
    		int responseCode = conn.getResponseCode();
    		System.out.println("quickGoogleEvt 응답받기 ::::  " + responseCode);
    		
    		if (responseCode == HttpURLConnection.HTTP_OK) { //success
    			
    			InputStreamReader isr = new InputStreamReader(conn.getInputStream(), "UTF-8");
    			BufferedReader br = new BufferedReader(isr);
    			StringBuilder builder = new StringBuilder();
    			String inputLine;
    			while ((inputLine = br.readLine()) != null) {
    				builder.append(inputLine + "\n");
    			}
    			br.close();
    			result = builder.toString();
    			System.out.println(result);
    			
    			je = jp.parse(result);
    			String evtId = je.getAsJsonObject().get("id").getAsString();
    			System.out.println(evtId);
    			String summary = je.getAsJsonObject().get("summary").getAsString();
    			System.out.println(summary);
    			String htmlLink = je.getAsJsonObject().get("htmlLink").getAsString();
    			System.out.println(htmlLink);
//    			String description = je.getAsJsonObject().get("description").getAsString();
//    			System.out.println(description);
    			
    		}
    		
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteGoogleEvt(String accessToken, String desId, String evtId){
		
		int result = 0;
		try{
			URL url = new URL(
					"https://www.googleapis.com/calendar/v3/calendars/"
							+ desId
							+ "/events/"
							+ evtId
							+ "?access_token=" 
							+ accessToken
					);
			
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setDefaultUseCaches(false);
			conn.setRequestMethod("DELETE");
			conn.setRequestProperty("content-type", "application/json");
			
			//구글에서 온 답변 받기
			int responseCode = conn.getResponseCode();
			System.out.println("deleteGoogleEvt 응답받기 ::::  " + responseCode);
			if (responseCode == 204) { //success
				System.out.println("Delete Success");
				result = 1;
			} else {
				System.out.println("Delete Fuck");
			}
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	
//	==================================================================================mapper
	
	
	@Override
	public MonstersVO monLogin(String monEmail, String monId){
		return dao.monSelect(monEmail, monId);
	}
	
	@Override
	public int monInsert(MonstersVO mvo){
		return dao.monInsert(mvo);
	}
	
	@Override
	public int desInsert(DestinationVO dvo){
		return dao.desInsert(dvo);
	}
	
	@Override
	public ArrayList<DestinationVO> desList(int monPk){
		return dao.desList(monPk);
	}
	
	@Override
	public String desDtail(int desPk){
		return dao.desDetail(desPk).getDesId();
	}
	
	@Override
	public int desNewPk(int monPk){
		return dao.desNewPk(monPk);
	}
	@Override
	public int svcInsertCurrent(CurrentLocVO cvo) {
		return dao.insertCurrent(cvo);
	}
	@Override
	public int disabled(int monPk){
		return dao.disabledMon(monPk);
	}
	
//	==================================================================================etc

	
	@Override
	public MonstersVO personToMvo(Person person, String monToken){
		
		MonstersVO mvo = new MonstersVO();
		mvo.setMonEmail(person.getAccountEmail());
		if(person.getBirthday() != null){
			mvo.setMonBirthday(new SimpleDateFormat("yyyy-MM-dd").format(person.getBirthday()));
		}
		mvo.setMonName(person.getDisplayName());
		mvo.setMonSex(person.getGender());
		mvo.setMonProfile("/img/profile/no_images.jpg");
		mvo.setMonIntro(person.getAboutMe());
		mvo.setMonToken(monToken);
		mvo.setMonId(person.getId());
		
		return mvo;
	}
	
	
	public EventVO colorPaser(EventVO evo){
		if(evo.getColorId()  != null){
			if(evo.getColorId().equals("bg-success")){
				evo.setColorId("2");
				return evo;
			}
			else if(evo.getColorId().equals("bg-pink")){
				evo.setColorId("4");
				return evo;
			}
			else if(evo.getColorId().equals("bg-warning")){
				evo.setColorId("5");
				return evo;
			}
			else if(evo.getColorId().equals("bg-info")){
				evo.setColorId("7");
				return evo;
			}
			else if(evo.getColorId().equals("bg-primary")){
				evo.setColorId("9");
				return evo;
			}
			else if(evo.getColorId().equals("bg-danger")){
				evo.setColorId("11");
				return evo;
			}
			else if(evo.getColorId().equals("2")){
				evo.setColorId("bg-success");
				return evo;
			}
			else if(evo.getColorId().equals("4")){
				evo.setColorId("bg-pink");
				return evo;
			}
			else if(evo.getColorId().equals("5")){
				evo.setColorId("bg-warning");
				return evo;
			}
			else if(evo.getColorId().equals("7")){
				evo.setColorId("bg-info");
				return evo;
			}
			else if(evo.getColorId().equals("9")){
				evo.setColorId("bg-primary");
				return evo;
			} 
			else if(evo.getColorId().equals("11")){
				evo.setColorId("bg-danger");
				return evo;
			} else {
				System.out.println("color miss match!!");
				return evo;
			}
		} else {
			System.out.println("color miss match!!");
			return evo;
		}
	}
	
	public EventVO datePaser(EventVO evo){
		
		SimpleDateFormat rfcFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssXXX");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		
		System.out.println("처음 온 값 start "+evo.getStartDate());
		System.out.println("처음 온 값 end "+evo.getEndDate());
		
		try {
			int	start = 0;
			if(evo.getStartDate() != null){
				start = evo.getStartDate().replaceAll("[^0-9]", "").length();
				if(start <= 8){
					evo.setStartDate(rfcFormat.format(dateFormat.parse(evo.getStartDate().replaceAll("[^0-9]", "") + "000000")));
				} else {
					evo.setStartDate(rfcFormat.format(dateFormat.parse(evo.getStartDate().replaceAll("[^0-9]", ""))));
				}
			}
			
			if(evo.getEndDate() != null){
				int end = evo.getEndDate().replaceAll("[^0-9]", "").length();
				if(end <= 8){
					evo.setEndDate(rfcFormat.format(dateFormat.parse(evo.getEndDate().replaceAll("[^0-9]", "") + "000000")));
				} else {
					evo.setEndDate(rfcFormat.format(dateFormat.parse(evo.getEndDate().replaceAll("[^0-9]", ""))));
				}
			} else {
				Calendar cal = Calendar.getInstance();
				if(start == 8){
					cal.setTime(rfcFormat.parse(evo.getStartDate()));
					cal.add(cal.HOUR_OF_DAY, 24);
					evo.setEndDate(rfcFormat.format(cal.getTime()));
					System.out.println("수정1++++++++++++++++++++++++++++++++++++++++++++++" + evo.getEndDate());
				} else if(start > 8){
					cal.setTime(rfcFormat.parse(evo.getStartDate()));
					cal.add(cal.HOUR_OF_DAY, 2);
					evo.setEndDate(rfcFormat.format(cal.getTime()));
					System.out.println("수정2++++++++++++++++++++++++++++++++++++++++++++++" + evo.getEndDate());
				}
			}
			
			System.out.println(evo.getStartDate());
			System.out.println(evo.getEndDate());
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return evo;
	}
	
	public EventVO inverseDatePaser(EventVO evo){
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat rfcFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssXXX");
		try {
			
			if(evo.getStartDate() != null){
				if(evo.getStartDate().replaceAll("[^0-9]", "").length() <= 8){
					evo.setStartDate(dateFormat.format(rfcFormat.parse(evo.getStartDate())));
				} else {
					evo.setStartDate(dateFormat.format(rfcFormat.parse(evo.getStartDate())));
				}
			}
			
			if(evo.getEndDate() != null){
				if(evo.getEndDate().replaceAll("[^0-9]", "").length() <= 8){
					evo.setEndDate(dateFormat.format(rfcFormat.parse(evo.getEndDate())));
				} else {
					evo.setEndDate(dateFormat.format(rfcFormat.parse(evo.getEndDate())));
				}
			}
			
			System.out.println(evo.getStartDate());
			System.out.println(evo.getEndDate());
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return evo;
	}
	
}
