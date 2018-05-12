package com.insta.hashtag;

import java.util.ArrayList;

import com.insta.content.ContentVO;

import junit.framework.TestCase;

public class TestKang extends TestCase {

	public void testReplyListInt() {
		
		HashTagImpl impl = new HashTagImpl();
		ArrayList<ContentVO> list = impl.contentList();
		int listSize = list.size();
		System.out.println(listSize+"건");
		
		
	}

}
