package org.zerock.restController;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.domain.Criteria;
import org.zerock.domain.Msg;
import org.zerock.domain.Notice_reply_ob;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.NoticeBoardService_ob;

@RestController
@RequestMapping(value="/obnotice_reply/*")
public class OBNoticeReplyController {
    
  private static final Logger logger = LoggerFactory.getLogger(OBNoticeReplyController.class);
  @Inject NoticeBoardService_ob service;
  Msg msg = new Msg();
  
  @RequestMapping(value = "/listAll/{bno}", method = RequestMethod.GET)
  public ResponseEntity<List<Notice_reply_ob>> listAll(@PathVariable("bno") Integer bno, Model model) {
	  ResponseEntity<List<Notice_reply_ob>> entity = null;
	  try {
		  List<Notice_reply_ob> data = service.replyList(bno);
		  model.addAttribute("list", data);
		  entity = new ResponseEntity<>(data, HttpStatus.OK);
	  } catch (Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	  return entity;
  }
  
  @RequestMapping(value = "/{bno}/{page}", method = RequestMethod.GET)
  public ResponseEntity<Map<String,Object>> listPage(@PathVariable("bno") Integer bno, 
		  @PathVariable("page") Integer page) {	  
	 
	  ResponseEntity<Map<String,Object>> entity = null;
	  try {
		Criteria cri = new Criteria();
		cri.setPage(page);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Notice_reply_ob> list = service.listPage(bno, cri);
		map.put("list", list);
		
		int replyCount = service.count(bno);
		pageMaker.setTotalCount(replyCount);
		
		map.put("pageMaker", pageMaker);
		
		entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		
	} catch (Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		
	}
	  
	  return entity;
  }
  

  @RequestMapping(value = "/insert", method = RequestMethod.POST)
  public ResponseEntity<String> registerPost(@RequestBody Notice_reply_ob data) {
	  logger.info(data.toString());
	  ResponseEntity<String> entity = null;
	  try {
		service.replyRegister(data);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	  } catch (Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	  }
	  return entity;
  }

  @RequestMapping(value = "/{rno}", method = {RequestMethod.PUT, RequestMethod.PATCH} )
  public ResponseEntity<String> replyUpdatePost(@PathVariable("rno") Integer rno, @RequestBody Notice_reply_ob data) {
	  ResponseEntity<String> entity = null;
	  try {
		  data.setRno(rno);
		  service.replyUpdate(data);
		  entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	  } catch (Exception e) {
		  e.printStackTrace();
		  entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	  }
	  return entity;
  }
  @RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
  public ResponseEntity<String> replyDelete(@PathVariable("rno") Integer rno) {
		ResponseEntity<String> entity = null;  
	    try {
			service.replyDelete(rno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	    return entity;
  }
}
