package org.zerock.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.Member_ob;
import org.zerock.domain.SearchCriteria;
import org.zerock.dto.IndustryGraphDTO;
import org.zerock.dto.JobGraphDTO;
import org.zerock.dto.LoginDTO;
import org.zerock.dto.MemberDTO_ob;
import org.zerock.dto.OBManagerDTO;
import org.zerock.dto.OverviewDTO;
import org.zerock.persistence.MemberDAO_ob;

@Service
public class MemberServiceImple_ob implements MemberService_ob  {
	
	@Inject
	MemberDAO_ob dao;
	
	//로그인
	@Override
	public LoginDTO findByUserId(LoginDTO dto) throws Exception {
		return dao.FindByUserId(dto);
	}

	@Override
	public void keepLogin(String uid, String sessionId, Date next) throws Exception {
		dao.keepLogin(uid, sessionId, next);
	}

	@Override
	public Member_ob checkLoginBefore(String value) {
		return dao.checkUserWithSessionKey(value);
	}
	
	//회원관리
	@Override
	public OverviewDTO overview() {
		
		return dao.overview();
	}

	@Override
	public int listSearchCount(SearchCriteria cri) {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<Member_ob> listSearch(SearchCriteria cri) {
		return dao.listSearch(cri);
	}

	@Override
	public OBManagerDTO getManager() {
		return dao.getManager();
	}

	@Override
	public void register(MemberDTO_ob info) {
		dao.register(info);
	}

	@Override
	public Member_ob read(String uid) {
		return dao.read(uid);
	}

	@Override
	public void update(String uid, Member_ob info) {
		dao.update(uid, info);
	}

	@Override
	public void delete(String uid) {
		dao.delete(uid);
	}

	@Override
	public JobGraphDTO jobGraph() {
		return dao.jobGraph();
	}

	@Override
	public IndustryGraphDTO industryGraph() {
		return dao.industryGraph();
	}

}
