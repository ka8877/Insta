package com.insta.content;
import java.util.ArrayList;
public interface Content {
/**
 * 게시물수
 * @return int
 */
public int contentCount();
/**
 * 목록
 * @return ArrayList<ContentVO>
 */
public ArrayList<ContentVO> contentList();
/**
 * 수정
 * @param ContentVO
 * @return int
 */
public int contentUpdate(ContentVO vo);
/**
 * 삭제
 * @param ContentVO
 * @return int
 */
 public int contentDelete(int cseq);
/**
 * 입력
 * @param ContentVO
 * @return int
 */
 public int contentInsert(ContentVO vo);
/**
 * 상세보기
 * @param ContentVO
 * @return ContentVO
 */
 public ContentVO contentDetail(int cseq);
}
