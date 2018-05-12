package com.kosmo.alone;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kosmo.alone.mapper.ImGuMapper;
import com.kosmo.alone.vo.GalleryVO;
import com.kosmo.alone.vo.LikesVO;
import com.kosmo.alone.vo.MonstersVO;
import com.kosmo.alone.vo.ProductsVO;

@Service
public class ImGuServiceImpl implements ImGuService{
	
	@Autowired
	private ImGuMapper dao;

	@Override
	public ArrayList<GalleryVO> svcGalleryList(GalleryVO vo) {
		return dao.galleryList(vo);
	}

	@Override
	public MonstersVO svcMonsterDetail(MonstersVO vo) {
		return dao.monsterDetail(vo);
	}

	@Override
	public int svcProfileUpdate(MonstersVO vo) {
		return dao.profileUpdate(vo);
	}

	@Override
	public MonstersVO svcProfileDetail(MonstersVO vo) {
		return dao.profileDetail(vo);
	}

	@Override
	public int svcMonstersUpdate(MonstersVO vo) {
		return dao.monstersUpdate(vo);
	}

	@Override
	public int svcProfileDelete(MonstersVO vo) {
		return dao.profileDelete(vo);
	}

	@Override
	public int svcGalleryInsert(GalleryVO vo) {
		return dao.galleryInsert(vo);
	}

	@Override
	public int svcGalleryCount(int monPk) {
		return dao.galleryCount(monPk);
	}

	@Override
	public int svcGalleryDelete(GalleryVO vo) {
		return dao.galleryDelete(vo);
	}


	@Override
	public ArrayList<LikesVO> svclikeList(MonstersVO vo) {
		return dao.likeList(vo);
	}

	@Override
	public int svcLikesCount(int monPk) {
		return dao.likesCount(monPk);
	}

	@Override
	public ArrayList<ProductsVO> svcPaymentsList(MonstersVO vo) {

		return dao.paymentsList(vo);
	}

	@Override
	public int svcPaymentsCount(int monPk) {
		return dao.paymentsCount(monPk);
	}

	@Override
	public int svcMonsterDeactivate(MonstersVO vo) {
		return dao.monsterDeactivate(vo);
	}


	
  
}
