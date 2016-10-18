package org.zerock.persistence;

import java.util.Date;

import org.zerock.domain.UserRegisterVO;
import org.zerock.domain.UserVO;
import org.zerock.domain.UserUpdateVO;
import org.zerock.dto.LoginDTO;

public interface UserDAO {

	public UserVO findByUserId(LoginDTO dto)throws Exception;

	public void keepLogin(String uid, String sessionId, Date next);
  
	public UserVO checkUserWithSessionKey(String value);	
	
	public void register(UserRegisterVO vo) throws Exception;

	public void update(UserUpdateVO vo) throws Exception;
}



