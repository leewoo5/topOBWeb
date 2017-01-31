package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.Criteria;
import org.zerock.domain.Main;
import org.zerock.domain.Member_ob;
import org.zerock.domain.Notice_ob;
import org.zerock.domain.Notice_reply_ob;
import org.zerock.domain.SearchCriteria;

@Repository
public class NoticeBoardDAOImpl_ob implements NoticeBoardDAO_ob {

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.mapper.obNoticeBoardMapper";
	
	@Override
	public List<Notice_ob> listSearchCriteria(SearchCriteria cri) {
		return session.selectList(namespace + ".listSearchCriteria", cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}
	
	@Override
	public void register(Notice_ob data) throws Exception {
		session.insert(namespace + ".insertNewNotice", data);
	}

	@Override
	public void update(Notice_ob data) throws Exception {
		session.update(namespace + ".update", data);
		
	}

	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace + ".delete", bno);
		
	}

	@Override
	public Notice_ob read(Integer bno) {
		return session.selectOne(namespace + ".read", bno);
	}

	@Override
	public void viewcnt(Integer bno) {
		session.update(namespace +".viewcnt", bno);
	}

	@Override
	public void replyRegister(Notice_reply_ob data) throws Exception {
		session.insert(namespace + ".replyRegister", data);
	}

	@Override
	public void replyUpdate(Notice_reply_ob data) throws Exception {
		session.update(namespace + ".replyUpdate", data);
		
	}

	@Override
	public void replyDelete(Integer rno) throws Exception {
		session.delete(namespace + ".replyDelete", rno);
	}

	@Override
	public Notice_reply_ob replyRead(Integer rno) throws Exception {
		return session.selectOne(namespace + ".replyRead", rno);
	}

	@Override
	public List<Notice_reply_ob> replyList(Integer bno) throws Exception {
		return session.selectList(namespace+".replyList", bno);
	}

	@Override
	public int count(Integer bno) throws Exception {
		return session.selectOne(namespace + ".count", bno);
	}

	@Override
	public List<Notice_reply_ob> listPage(Integer bno, Criteria cri) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		return session.selectList(namespace+".listPage", paramMap);
	}
	
 
}
