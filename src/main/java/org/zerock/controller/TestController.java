package org.zerock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.Msg;

@Controller
@RequestMapping(value="/test/*")
public class TestController {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	Msg msg = new Msg();
	
	@RequestMapping(value="/ex01", method = RequestMethod.GET)
	public void TestGET() {

	}

}
