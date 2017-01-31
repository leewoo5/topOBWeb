package org.zerock.persistence;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.Main;
import org.zerock.domain.Member_ob;

@Repository
public class MainDAOImpl implements MainDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.mapper.mainMapper";

	@Override
	public Main read() throws Exception {
		return session.selectOne(namespace + ".read");
	}


	@Override
	public void update(Main data) throws Exception {
		session.update(namespace + ".update", data);
	}
 
}
