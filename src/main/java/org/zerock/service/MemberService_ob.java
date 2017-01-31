package org.zerock.service;

import java.util.Date;
import java.util.List;

import org.zerock.domain.Member_ob;
import org.zerock.domain.SearchCriteria;
import org.zerock.dto.IndustryGraphDTO;
import org.zerock.dto.JobGraphDTO;
import org.zerock.dto.LoginDTO;
import org.zerock.dto.MemberDTO_ob;
import org.zerock.dto.OBManagerDTO;
import org.zerock.dto.OverviewDTO;

public interface MemberService_ob {
	
	//로그인
    public LoginDTO findByUserId(LoginDTO dto) throws Exception;

    public void keepLogin(String uid, String sessionId, Date next)throws Exception;
    
    public Member_ob checkLoginBefore(String value);  
    
    //회원관리
	public OverviewDTO overview();
	
	public JobGraphDTO jobGraph();
	public IndustryGraphDTO industryGraph();
	
	public List<Member_ob> listSearch(SearchCriteria cri);

	public int listSearchCount(SearchCriteria cri);

	public OBManagerDTO getManager();

	public void register(MemberDTO_ob info);

	public Member_ob read(String uid);

	public void update(String uid, Member_ob info);

	public void delete(String uid);



}
