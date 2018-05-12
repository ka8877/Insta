package com.kosmo.alone.mapper;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;


import com.kosmo.alone.vo.GalleryVO;
import com.kosmo.alone.vo.LikesVO;
import com.kosmo.alone.vo.MonstersVO;
import com.kosmo.alone.vo.ProductsVO;

@Repository("imgu")
public interface ImGuMapper {

	
	public ArrayList<GalleryVO> galleryList(GalleryVO vo);
		
	public MonstersVO monsterDetail(MonstersVO vo);
	
	public int profileUpdate(MonstersVO vo);
	
	public MonstersVO profileDetail(MonstersVO vo);
	
	public int monstersUpdate(MonstersVO vo);
	
	public int profileDelete(MonstersVO vo);
	
	public int galleryInsert(GalleryVO vo);
	
	public int galleryCount(int monPk);
	
	public int likesCount(int monPk);
	
	public int paymentsCount(int monPk);
	
	public int galleryDelete(GalleryVO vo);
	
	public ArrayList<LikesVO> likeList(MonstersVO vo);
	
	public ArrayList<ProductsVO> paymentsList(MonstersVO vo);
	
	public int monsterDeactivate(MonstersVO vo);
}
