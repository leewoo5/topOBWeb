package org.zerock.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.UserRegisterVO;
import org.zerock.domain.UserVO;
import org.zerock.domain.UserUpdateVO;
import org.zerock.dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace ="org.zerock.mapper.userMapper";	

	@Override
	public UserVO findByUserId(LoginDTO dto) throws Exception {
		
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
  public UserVO checkUserWithSessionKey(String value) {

    return session.selectOne(namespace +".checkUserWithSessionKey", value);
  }
  
  @Override
	public void register(UserRegisterVO vo) throws Exception {
		session.insert(namespace + ".register", vo);
	}

  @Override
  public void update(UserUpdateVO vo) throws Exception {
	  session.update(namespace + ".update", vo);
  }
  
}
