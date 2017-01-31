package org.zerock.service;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Main;
import org.zerock.persistence.MainDAO;

@Service
public class MainServiceImpl implements MainService {

  @Inject
  private MainDAO dao;

@Override
public Main read() throws Exception {
	return dao.read();
}

@Override
public void update(Main data) throws Exception {
	dao.update(data);
}


}
  
 
