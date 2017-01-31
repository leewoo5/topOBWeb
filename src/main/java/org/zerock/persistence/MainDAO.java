package org.zerock.persistence;

import org.zerock.domain.Main;

public interface MainDAO {
	public Main read() throws Exception;
	public void update(Main data) throws Exception;
}
