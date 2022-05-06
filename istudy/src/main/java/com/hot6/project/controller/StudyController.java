package com.hot6.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.StudyService;
import com.hot6.project.vo.StudyVO;

@Controller
public class StudyController {
	@Inject
	StudyService Sservice;
	
	
	@GetMapping("/study/calendar/calendarList")
	public ModelAndView CalendarList(int study_num) {
		 ModelAndView mav = new ModelAndView();
		 	mav.addObject("CalendarList", Sservice.CalendarList(study_num));
	        mav.setViewName("/study/calendar/calendarList");
	        return mav;
	}
	//일정 리스트
	@ResponseBody //Ajax
	@RequestMapping(value = "/study/calendar/calendarLists", method=RequestMethod.GET)
	public List<StudyVO> calendarLists(@RequestParam("study_num")String study_num) {
		System.out.println("ajax start");
		System.out.println(study_num);
		return Sservice.CalendarList(Integer.parseInt(study_num));
	}
	
	//일정 등록
	@PostMapping("/study/calendar/calendarWrite")
	public String PlanInsert(StudyVO vo) {
		System.out.println("study_num= "+vo.getStudy_num());
		Sservice.PlanInsert(vo);
		return "redirect:/study/calendar/calendarList?study_num="+vo.getStudy_num();
	}
	
	//일정 상세
	@ResponseBody //Ajax
	@RequestMapping(value = "/study/calendar/calendarDetail", method=RequestMethod.GET)
	public StudyVO calendarDetail(@RequestParam("plan_num")int plan_num) {
		System.out.println("plan_num= "+plan_num);
		return Sservice.CalendarDetail(plan_num);
	}
	
	//일정 삭제
	@ResponseBody //Ajax
	@RequestMapping(value = "/study/calendar/calendarDel", method=RequestMethod.GET)
	public String calendarDel(StudyVO vo, @RequestParam("plan_num")int plan_num, @RequestParam("study_num")int study_num) {
		System.out.println("plan_num= "+plan_num);
		Sservice.CalendarDel(plan_num);
		System.out.println("study_num= "+study_num);
		return "/study/calendar/calendarList?study_num="+study_num;
	}
	
	//일정 수정
	@ResponseBody //Ajax
	@RequestMapping(value = "/study/calendar/calendarEdit", method=RequestMethod.POST)
	public StudyVO calendarEdit(@RequestParam StudyVO vo) {
		System.out.println("edit start");
		Sservice.CalendarEdit(vo);
		return Sservice.CalendarDetail(Integer.parseInt(vo.getPlan_num()));
	}
}
