package org.zerock.controller;


import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.Msg;
import org.zerock.domain.Notice_ob;
import org.zerock.domain.PageMaker;
import org.zerock.domain.PageMakerOBfinance;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.NoticeBoardService_ob;

@Controller
@RequestMapping(value="/obnotice/*")
public class OBNoticeBoardController {
  private static final Logger logger = LoggerFactory.getLogger(OBNoticeBoardController.class);
 
  @Inject NoticeBoardService_ob service;
  Msg msg = new Msg();
  @RequestMapping(value = "/listAll", method = RequestMethod.GET)
  public void listAll(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	  List<Notice_ob> data = service.listSearchCriteria(cri);
	  if (data!=null) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
	    pageMaker.setTotalCount(service.listSearchCount(cri));
	    model.addAttribute("list", data);
	    model.addAttribute("pageMaker", pageMaker);
	  }
  }
  
  @RequestMapping(value = "/read", method = RequestMethod.GET)
  public void read(@RequestParam Integer bno, Model model) throws Exception {
	  model.addAttribute("data", service.read(bno));
  }
  
  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public void register() {
  }

  @RequestMapping(value = "/registerPost", method = RequestMethod.POST)
  public void registerPost(Notice_ob data, Model model) throws Exception {
	  service.register(data);
	  msg.setMsg("등록이 완료되었습니다.");
	  model.addAttribute("result", msg);
  }
  
  @RequestMapping(value = "/update", method = RequestMethod.GET)
  public void update(@RequestParam Integer bno, Model model) throws Exception {
	  Notice_ob data = service.read(bno);
	  model.addAttribute("data", data);
  }
  
  @RequestMapping(value = "/updatePost", method = RequestMethod.POST)
  public void register(@RequestParam Integer bno, Notice_ob data, Model model) throws Exception {
	  service.update(data);
	  msg.setMsg("수정이 완료되었습니다.");
	  model.addAttribute("result", msg);
  }
  
  @RequestMapping(value = "/delete", method = RequestMethod.GET)
  public void register(@RequestParam Integer bno, Model model) throws Exception {
	  service.delete(bno);
	  msg.setMsg("삭제가 완료되었습니다.");
	  model.addAttribute("result", msg);
  }
  
}
