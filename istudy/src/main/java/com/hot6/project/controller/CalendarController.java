package com.hot6.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.CalendarService;
import com.hot6.project.vo.StudyVO;

@Controller
public class CalendarController {
	@Inject
	CalendarService service;

	@GetMapping("/study/calendar/calendarList")
	public ModelAndView CalendarList(int study_num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("study_num", study_num);
		mav.setViewName("/study/calendar/calendarList");
		return mav;
	}

	// 일정 리스트
	@ResponseBody // Ajax
	@RequestMapping(value = "/study/calendar/calendarLists", method = RequestMethod.GET)
	public List<StudyVO> calendarLists(@RequestParam("study_num") int study_num) {
		System.out.println("ajax start");
		System.out.println(study_num);
		return service.CalendarList(study_num);
	}

	// 일정 등록
	@ResponseBody // Ajax
	@RequestMapping(value = "/study/calendar/calendarWrite", method = RequestMethod.POST)
	public int PlanInsert(StudyVO vo) {
		System.out.println("add start");
		return service.PlanInsert(vo);
	}

	// 일정 상세
	@ResponseBody // Ajax
	@RequestMapping(value = "/study/calendar/calendarDetail", method = RequestMethod.GET)
	public StudyVO calendarDetail(@RequestParam("plan_num") int plan_num) {
		System.out.println("plan_num= " + plan_num);
		return service.CalendarDetail(plan_num);
	}

	// 일정 삭제
	@ResponseBody // Ajax
	@RequestMapping(value = "/study/calendar/calendarDel", method = RequestMethod.GET)
	public int calendarDel(StudyVO vo, @RequestParam("plan_num") int plan_num, @RequestParam("study_num") int study_num) {
		return service.CalendarDel(plan_num);
	}

	// 일정 수정
	@ResponseBody // Ajax
	@RequestMapping(value = "/study/calendar/calendarEdit", method = RequestMethod.POST)
	public int calendarEdit(StudyVO vo) {
		return service.CalendarEdit(vo);
	}
	
	// 일정 드래그 수정
	@ResponseBody // Ajax
	@RequestMapping(value = "/study/calendar/calendarDrag", method = RequestMethod.POST)
	public int calendarDrag(StudyVO vo) {
		System.out.println("get data");
		return service.CalendarDrag(vo);
	}
}
