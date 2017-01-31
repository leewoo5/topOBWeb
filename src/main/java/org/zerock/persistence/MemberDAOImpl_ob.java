package org.zerock.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.Member_ob;
import org.zerock.dto.IndustryGraphDTO;
import org.zerock.dto.JobGraphDTO;
import org.zerock.dto.LoginDTO;
import org.zerock.dto.MemberDTO_ob;
import org.zerock.dto.OBManagerDTO;
import org.zerock.dto.OverviewDTO;

@Repository
public class MemberDAOImpl_ob implements MemberDAO_ob {

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.mapper.ObMemberMapper";

	@Override
	public OverviewDTO overview() {
		OverviewDTO overview = new OverviewDTO();
		overview.setMembers(session.selectOne(namespace + ".overview_members"));
		overview.setBusiness(session.selectOne(namespace + ".overview_business"));
		overview.setEtc(session.selectOne(namespace + ".overview_etc"));
		overview.setMale(session.selectOne(namespace + ".overview_male"));
		overview.setFemail(session.selectOne(namespace + ".overview_female"));
		return overview;
	}
	

	@Override
	public List<Member_ob> listSearch(SearchCriteria cri) {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}
	
	@Override
	public OBManagerDTO getManager() {
		String presidentName = session.selectOne(namespace + ".presidentName");
		String presidentPhone = session.selectOne(namespace + ".presidentPhone");
		String presidentStage = session.selectOne(namespace + ".presidentStage");
		String vicePresidentName = session.selectOne(namespace + ".vicePresidentName");
		String vicePresidentPhone = session.selectOne(namespace + ".vicePresidentPhone");
		String vicePresidentStage = session.selectOne(namespace + ".vicePresidentStage");
		
		OBManagerDTO manager = new OBManagerDTO();
		manager.setPresidentName(presidentName);
		manager.setPresidentPhone(presidentPhone);
		manager.setPresidentStage(presidentStage);
		manager.setVicePresidentName(vicePresidentName);
		manager.setVicePresidentPhone(vicePresidentPhone);
		manager.setVicePresidentStage(vicePresidentStage);
		
		return manager;
	}


	@Override
	public LoginDTO FindByUserId(LoginDTO dto) throws Exception {
		return session.selectOne(namespace +".findByUserId", dto);
	}


	@Override
	public void keepLogin(String uid, String sessionId, Date next) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
	    paramMap.put("uid", uid);
	    paramMap.put("sessionId", sessionId);
	    paramMap.put("next", next);
	    
	    session.update(namespace+".keepLogin", paramMap);
		
	}

	@Override
	public Member_ob checkUserWithSessionKey(String value) {
		return session.selectOne(namespace +".checkUserWithSessionKey", value);
	}


	@Override
	public void register(MemberDTO_ob info) {
		session.insert(namespace + ".insertNewMember", info);
	}


	@Override
	public Member_ob read(String uid) {
		return session.selectOne(namespace + ".read", uid);
	}


	@Override
	public void update(String uid, Member_ob info) {
		info.setPreUid(uid);
		session.update(namespace + ".update", info);
	}


	@Override
	public void delete(String uid) {
		session.update(namespace + ".delete", uid);
	}


	@Override
	public JobGraphDTO jobGraph() {
		//그래프 값 조회해오기
		int marketing = session.selectOne(namespace + ".marketing_job");
		int finance = session.selectOne(namespace + ".finance_job");
		int hr = session.selectOne(namespace + ".hr_job");
		int ad = session.selectOne(namespace + ".ad_job");
		int sales = session.selectOne(namespace + ".salse_job");
		int etc = session.selectOne(namespace + ".etc_job");
		
		//DTO에 세팅하기
		JobGraphDTO dto = new JobGraphDTO();
		dto.setMarketing(marketing);
		dto.setFinance(finance);
		dto.setHr(hr);
		dto.setAd(ad);
		dto.setSales(sales);
		dto.setEtc(etc);
		
		return dto;
	}


	@Override
	public IndustryGraphDTO industryGraph() {
		//그래프 값 조회해오기
		int beauty = session.selectOne(namespace + ".beauty_industry");
		int food = session.selectOne(namespace + ".food_industry");
		int it = session.selectOne(namespace + ".it_industry");
		int distribution = session.selectOne(namespace + ".distribute_industry");
		int ad = session.selectOne(namespace + ".ad_industry");
		int car = session.selectOne(namespace + ".car_industry");
		int etc = session.selectOne(namespace + ".etc_industry");
		
		//DTO에 세팅하기
		IndustryGraphDTO dto = new IndustryGraphDTO();
		dto.setBeauty(beauty);
		dto.setFood(food);
		dto.setIt(it);
		dto.setDistribution(distribution);
		dto.setAd(ad);
		dto.setCar(car);
		dto.setEtc(etc);
		return dto;
	}
 
}
