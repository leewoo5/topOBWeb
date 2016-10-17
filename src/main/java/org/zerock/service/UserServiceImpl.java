package org.zerock.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.User;
import org.zerock.dto.LoginDTO;
import org.zerock.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

  @Inject
  private UserDAO dao;

  @Override
  public User findByUserId(LoginDTO dto) throws Exception {

    return dao.findByUserId(dto);
  }
  
  @Override
  public void keepLogin(String uid, String sessionId, Date next)
      throws Exception {
    
    dao.keepLogin(uid, sessionId, next);
    
  }

  @Override
  public User checkLoginBefore(String value) {
    
    return dao.checkUserWithSessionKey(value);
  }
}
