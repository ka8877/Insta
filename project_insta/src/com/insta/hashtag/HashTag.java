package com.insta.hashtag;

import java.util.ArrayList;

import com.insta.content.ContentVO;
import com.insta.follower.FollowerVO;
import com.insta.member.MemberVO;
import com.insta.reply.ReplyVO;

public interface HashTag {

	public ArrayList<MemberVO> memberList();
	public MemberVO memberDetail(int mseq);
	public int contentInsert(ContentVO vo);
	public int hashtagInsert(HashTagVO vo);
	public ArrayList<ContentVO> selectContentName(String memberName);
	public ArrayList<ContentVO> selectHashTagName(String hashTag);
	public ArrayList<ContentVO> selectMemberSeqList(int mseq);
	public ContentVO contentDetail(int cseq);
	public ArrayList<ReplyVO> replyList(int cseq);
	public int replyInsert(ReplyVO vo);
	public int replyDelete(int rseq);
	public ArrayList<ContentVO> contentList();
	public ArrayList<FollowerVO> followerList(int followerSeq);
	public ArrayList<FollowerVO> requesterList(int requesterSeq);
	public ArrayList<ContentVO> contentReplyList();
	public int followInsert(int followerSeq, int requesterSeq);
	public int followdelete(int followerSeq, int requesterSeq);
	public int selectContentNameCount(String memberName);
	public int selectContentHashtagCount(String hashTag);
	public int followerCount(int followerSeq);
	public int requesterCount(int requesterSeq);
	public MemberVO memberDetail(String name);
	public ArrayList<FollowerVO> myFollowerList(int mseq);
	public ArrayList<FollowerVO> myRequesterList(int mseq);
	
}
