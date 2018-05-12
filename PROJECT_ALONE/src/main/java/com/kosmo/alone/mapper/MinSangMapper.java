package com.kosmo.alone.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosmo.alone.vo.CurrentLocVO;
import com.kosmo.alone.vo.DestinationVO;
import com.kosmo.alone.vo.MonstersVO;

@Repository("minsang")
public interface MinSangMapper {
	
	/**
	 * @param MonstersVO
	 * @return int
	 */
	public int monInsert(MonstersVO mvo);
	
	/**
	 * @param String, int
	 * @return MonstersVO
	 */
	public MonstersVO monSelect(@Param("monEmail")String monEmail, @Param("monId")String monId);
	
	/**
	 * @param DestinationVO
	 * @return int
	 */
	public int desInsert(DestinationVO dvo);

	/**
	 * @param int
	 * @return ArrayList<DestinationVO>
	 */
	public ArrayList<DestinationVO> desList(@Param("monPk")int monPk);

	/**
	 * @param int
	 * @return DestinationVO
	 */
	public DestinationVO desDetail(@Param("desPk")int desPk);
	
	/**
	 * @param int
	 * @return DestinationVO
	 */
	public int desNewPk(@Param("monPk")int monPk);
	
	/**
	 * @param CurrentLocVO
	 * @return int
	 */
	public int insertCurrent(CurrentLocVO cvo);
	
	/**
	 * @param int
	 * @return int
	 */
	public int disabledMon(int monPk);
}
