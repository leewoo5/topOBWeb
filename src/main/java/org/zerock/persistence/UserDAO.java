package org.zerock.persistence;

import java.util.Date;

import org.zerock.domain.User;
import org.zerock.dto.LoginDTO;

public interface UserDAO {

	public User findByUserId(LoginDTO dto)throws Exception;

	public void keepLogin(String uid, String sessionId, Date next);
  
	public User checkUserWithSessionKey(String value);	
}



