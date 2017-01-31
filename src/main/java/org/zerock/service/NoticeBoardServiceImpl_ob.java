package org.zerock.service;
import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.Main;
import org.zerock.domain.Notice_ob;
import org.zerock.domain.Notice_reply_ob;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.MainDAO;
import org.zerock.persistence.NoticeBoardDAO_ob;

@Service
public class NoticeBoardServiceImpl_ob implements NoticeBoardService_ob {

  @Inject
  private NoticeBoardDAO_ob dao;

@Override
public List<Notice_ob> listSearchCriteria(SearchCriteria cri) throws Exception {
	return dao.listSearchCriteria(cri);
}

@Override
public int listSearchCount(SearchCriteria cri) {
	return dao.listSearchCount(cri);
}

@Override
public void register(Notice_ob data) throws Exception {
	dao.register(data);
}

@Override
public void update(Notice_ob data) throws Exception {
	dao.update(data);
}

@Override
public void delete(Integer bno) throws Exception {
	dao.delete(bno);
}

@Override
public Notice_ob read(Integer bno) {
	dao.viewcnt(bno);
	return dao.read(bno);
}

@Override
public List<Notice_reply_ob> replyList(Integer bno) throws Exception {
	return dao.replyList(bno);
}

@Override
public void replyRegister(Notice_reply_ob data) throws Exception {
	dao.replyRegister(data);
}

@Override
public void replyUpdate(Notice_reply_ob data) throws Exception {
	dao.replyUpdate(data);
}

@Override
public void replyDelete(Integer rno) throws Exception {
	dao.replyDelete(rno);
}

@Override
public Notice_reply_ob replyRead(Integer rno) throws Exception {
	return dao.replyRead(rno);
}

@Override
public List<Notice_reply_ob> listPage(Integer bno, Criteria cri) throws Exception {
	return dao.listPage(bno, cri);
}

@Override
public int count(Integer bno) throws Exception {
	return dao.count(bno);
}

}
  
 
