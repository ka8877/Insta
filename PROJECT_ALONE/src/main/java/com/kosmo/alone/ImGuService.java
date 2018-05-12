package com.kosmo.alone;

import java.util.ArrayList;

import com.kosmo.alone.vo.GalleryVO;
import com.kosmo.alone.vo.LikesVO;
import com.kosmo.alone.vo.MonstersVO;
import com.kosmo.alone.vo.ProductsVO;

public interface ImGuService {
	
	public ArrayList<GalleryVO> svcGalleryList(GalleryVO vo);
	

	public MonstersVO svcMonsterDetail(MonstersVO vo);
	
	public int svcProfileUpdate(MonstersVO vo);
	
	public MonstersVO svcProfileDetail(MonstersVO vo);
	
	public int svcMonstersUpdate(MonstersVO vo);
	
	public int svcProfileDelete(MonstersVO vo);
	
	public int svcGalleryInsert(GalleryVO vo);
	
	public int svcGalleryCount(int monPk);
	
	public int svcLikesCount(int monPk);
	
	public int svcPaymentsCount(int monPk);
	
	public int svcGalleryDelete(GalleryVO vo);
	
	public ArrayList<LikesVO> svclikeList(MonstersVO vo);
	
	public ArrayList<ProductsVO> svcPaymentsList(MonstersVO vo);
	
	public int svcMonsterDeactivate(MonstersVO vo);



}


