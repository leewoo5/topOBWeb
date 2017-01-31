package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.Notice_ob;
import org.zerock.domain.Notice_reply_ob;
import org.zerock.domain.SearchCriteria;

public interface NoticeBoardService_ob {
	public List<Notice_ob> listSearchCriteria(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri);
	public void register(Notice_ob data) throws Exception;
	public Notice_ob read(Integer bno);
	public void update(Notice_ob data) throws Exception;
	public void delete(Integer bno) throws Exception;
	
	public List<Notice_reply_ob> replyList(Integer bno) throws Exception;
	public Notice_reply_ob replyRead(Integer rno) throws Exception;
	public void replyRegister(Notice_reply_ob data) throws Exception;
	public void replyUpdate(Notice_reply_ob data) throws Exception;
	public void replyDelete(Integer rno) throws Exception;
	public List<Notice_reply_ob> listPage(Integer bno, Criteria cri) throws Exception;
	public int count(Integer bno) throws Exception;

}
