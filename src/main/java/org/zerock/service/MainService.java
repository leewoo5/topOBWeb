package org.zerock.service;

import org.zerock.domain.Main;

public interface MainService {
	public Main read() throws Exception;
	public void update(Main data) throws Exception;

}
