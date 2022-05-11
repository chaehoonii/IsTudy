package com.hot6.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.QnaService;
import com.hot6.project.vo.BoardVO;

@Controller
public class QnaController {
	@Inject 
	QnaService Qservice;
	
		//리스트
		@RequestMapping(value = "/qna/qnaList", method = RequestMethod.GET)
	    public ModelAndView home(HttpSession session) {
	        ModelAndView mav = new ModelAndView();
	        //총 질문 수
	        mav.addObject("totalQna", Qservice.TotalQna());
	        //질문 리스트
	        List<BoardVO> qnalist = Qservice.QnaList();
	        for(BoardVO vo:qnalist) {
	        	vo.setLang_list(Qservice.QnaLangType(vo.getBoard_num()));
	        	System.out.println(vo.getLang_list());
	        }
	        for(BoardVO vo:qnalist) {
	        	vo.setTag_list(Qservice.QnaTag(vo.getBoard_num()));
	        }	
	        mav.addObject("qnaList", qnalist);
	        mav.setViewName("/qna/qnaList");
	        return mav;
	    }
		//검색 기능
		@GetMapping("/qna/search")
		public ModelAndView search(String searchKey, String searchWord) {
			System.out.println("search START!!!");
			ModelAndView mav = new ModelAndView();
			//질문 리스트
	        List<BoardVO> qnalist = new ArrayList<BoardVO>();
	        System.out.println(searchKey);
	        //제목
	        if(searchKey.equals("title")) {
		        mav.addObject("totalQna", Qservice.TotalQna_title(searchWord));
	        	qnalist = Qservice.QnaList_title(searchWord);
	        //내용
	        }else if(searchKey.equals("content")) {
		        mav.addObject("totalQna", Qservice.TotalQna_content(searchWord));
	        	qnalist = Qservice.QnaList_content(searchWord);
	        //아이디
	        }else if(searchKey.equals("user_nick")) {
		        mav.addObject("totalQna", Qservice.TotalQna_nick(searchWord));
	        	qnalist = Qservice.QnaList_nick(searchWord);
	        //언어
	        }else if(searchKey.equals("lang_type_name")) {
		        mav.addObject("totalQna", Qservice.TotalQna_lang(searchWord));
	        	qnalist = Qservice.QnaList_lang(searchWord);
	        //태그
	        }else if(searchKey.equals("tag")) {
		        mav.addObject("totalQna", Qservice.TotalQna_tag(searchWord));
	        	qnalist = Qservice.QnaList_tag(searchWord);
	        }else {
	        	System.out.println("wrong searchKey");
	        }
	        
	        for(BoardVO vo:qnalist) {
	        	vo.setLang_list(Qservice.QnaLangType(vo.getBoard_num()));
	        }
	        for(BoardVO vo:qnalist) {
	        	vo.setTag_list(Qservice.QnaTag(vo.getBoard_num()));
	        }	
	        mav.addObject("qnaList", qnalist);
	        mav.addObject("searchKey", searchKey);	//selected
	        mav.addObject("searchWord", searchWord);//value
			mav.setViewName("/qna/qnaList");
			return mav;
		}
		//글 상세
		@GetMapping("/qna/qnaView")
		public ModelAndView qnaView(int board_num) {
			ModelAndView mav = new ModelAndView();
			BoardVO vo = Qservice.QnaView(board_num);
			vo.setLang_list(Qservice.QnaLangType(board_num));
        	vo.setTag_list(Qservice.QnaTag(board_num));
        	mav.addObject("vo", vo);
			mav.setViewName("/qna/qnaView");
			return mav;
		}
		//댓글 리스트
		@ResponseBody // Ajax
		@RequestMapping(value = "/qna/qnaReplyList", method = RequestMethod.GET)
		public List<BoardVO> qnaReplyList(@RequestParam("board_num") int board_num, HttpSession session) {
			String user_id = (String)session.getAttribute("logId");
			return Qservice.QnaReplyList(user_id, board_num);
		}
		//댓글 등록
		@ResponseBody // Ajax
		@RequestMapping(value = "/qna/qnaReplyWrite", method = RequestMethod.POST)
		public int qnaReplyWrite(BoardVO vo, HttpSession session, HttpServletRequest request) {
			System.out.println("start write");
			vo.setUser_id((String)session.getAttribute("logId"));
			vo.setIp(request.getRemoteAddr()); // 접속자 아이피
			System.out.println("replywrite board_num="+vo.getBoard_num());
			return Qservice.QnaReplyWrite(vo);
		}
		//좋아요 누르기
		@ResponseBody // Ajax
		@RequestMapping(value = "/qna/likeUp", method = RequestMethod.POST)
		public void likeUp(@RequestParam("reply_num") int reply_num, HttpSession session) {
			String user_id = (String)session.getAttribute("logId");
			Qservice.LikeUp(user_id, reply_num);
		}
		//좋아요 취소
		@ResponseBody // Ajax
		@RequestMapping(value = "/qna/likeDown", method = RequestMethod.GET)
		public void likeDown(@RequestParam("reply_num") int reply_num, HttpSession session) {
			String user_id = (String)session.getAttribute("logId");
			Qservice.LikeDown(user_id, reply_num);
		}
		//댓글 삭제
		@ResponseBody // Ajax
		@RequestMapping(value = "/qna/replyDel", method = RequestMethod.GET)
		public void replyDel(@RequestParam("reply_num") int reply_num) {
			Qservice.ReplyDel(reply_num);
		}
		//답변 채택
		@ResponseBody // Ajax
		@RequestMapping(value = "/qna/replySelect", method = RequestMethod.POST)
		public void replySelect(@RequestParam("reply_num") int reply_num) {
			Qservice.ReplySelect(reply_num);
		}
		//답변 채택 취소
		@ResponseBody // Ajax
		@RequestMapping(value = "/qna/replySelectDel", method = RequestMethod.POST)
		public void replySelectDel(@RequestParam("reply_num") int reply_num) {
			Qservice.ReplySelectDel(reply_num);
		}
}
