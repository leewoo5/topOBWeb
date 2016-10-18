package org.zerock.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.UserRegisterVO;
import org.zerock.domain.UserVO;
import org.zerock.domain.UserUpdateVO;
import org.zerock.dto.LoginDTO;
import org.zerock.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

  @Inject
  private UserDAO dao;

  @Override
  public UserVO findByUserId(LoginDTO dto) throws Exception {

    return dao.findByUserId(dto);
  }
  
  @Override
  public void keepLogin(String uid, String sessionId, Date next)
      throws Exception {
    
    dao.keepLogin(uid, sessionId, next);
    
  }

  @Override
  public UserVO checkLoginBefore(String value) {
    
    return dao.checkUserWithSessionKey(value);
  }
  
  @Transactional
  @Override
  public void register(UserRegisterVO member) throws Exception {
	  dao.register(member);
  }
  
  @Transactional
  @Override
  public void update(UserUpdateVO update) throws Exception {
	  dao.update(update);
  }
  
}
