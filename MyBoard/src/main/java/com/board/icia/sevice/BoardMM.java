package com.board.icia.sevice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.icia.bean.Board;
import com.board.icia.bean.BoardFile;
import com.board.icia.bean.Member;
import com.board.icia.bean.Reply;
import com.board.icia.bean.Thumb;
import com.board.icia.dao.IBoardDao;
import com.board.icia.exception.DbException;
import com.board.icia.userClass.FileManager;
import com.board.icia.userClass.Paging;

@Service
public class BoardMM {

	@Autowired
	private IBoardDao bDao; // 스프링 매퍼랑 결랍해서 구현체 주입

	@Autowired
	private FileManager fm;

	ModelAndView mav;

	// 게시판 리스트
	public ModelAndView getBoardList(Integer pageNum) {
		mav = new ModelAndView();
		String view = null;
		List<Board> bList = null;
		List<Board> top3List = null;

		pageNum = (pageNum == null) ? 1 : pageNum;
		// 로그인해야 리스트를 볼 수 있다면
		// if(session.getAttribute("id")!=null) { }//스프링 인터셉터로 구현
		bDao.updateBoardThumb();
		bList = bDao.getBoardList(pageNum);
		top3List = bDao.getTop3List(pageNum);
		
		
		// System.out.println("bList="+bList);
		if (bList != null && bList.size() != 0) {
			mav.addObject("bList", bList); // jstl
			mav.addObject("top3List", top3List);
			// mav.addObject("bList2", new Gson().toJson(bList)); // js
			mav.addObject("paging", getPaging(pageNum));

			
			view = "boardList"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	public int viewUpdate(Integer B_NUM) {
		
		return bDao.viewCntUp(B_NUM);
	}
	// 게시글 페이징
	private String getPaging(Integer pageNum) {
		int maxNum = bDao.getBoardCount(); // 전체 글의 수
		int listCount = 10;
		int pageCount = 2;
		String boardName = "boardlist"; // url
		Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, boardName);
		return paging.makeHtmlPaging(); // return <a href ...1,2
	}

	// 글 내용 표시
	public ModelAndView getContents(Integer bNum, String m_id, HttpSession session) {
		mav = new ModelAndView();
		String view = null;

		Board board = bDao.getContents(bNum);
		mav.addObject("board", board);
		
		//추천한 적이 있다면 컬러이미지만 표시
		Thumb thumb = new Thumb(bNum, m_id);
		String t_id = bDao.checkThumbs(thumb);
		int check_t_id = 1;
		
		 if( t_id == null || "".equals(t_id)) { //추천이 없다 
			 check_t_id = 0; }
		 
		
		mav.addObject("check_t_id",check_t_id );
		
		// 댓글 리스트도 가져오기
		List<Reply> rList = bDao.getReplyList(bNum);
		mav.addObject("rList", rList);

		// 업로드한 파일리스트 가져오기
		List<BoardFile> bfList = bDao.getBfList(bNum);
		mav.addObject("bfList", bfList); // jstl
		// ObjectMapper로 json변환

		if (board != null) {
			view = "detail";
		} else {
			view = "redirect:/boardlist";
		}

		mav.setViewName(view);

		// 본인글일때 삭제 버튼 생성
		if (session.getAttribute("id").toString().equals(board.getB_id())) {
			mav.addObject("delBtn", makeHtmlDelBtn(board.getB_num()));
		}

		return mav;
	}

	private String makeHtmlDelBtn(int b_num) {
		StringBuilder sb = new StringBuilder();
		sb.append("<form action='boarddelete' method='post'>");
		sb.append("<input type='hidden' name='bNum' value='" + b_num + "'>");
		sb.append("<button>삭제</button>");
		sb.append("</form>");
		return sb.toString();
	}

	// 댓글 insert
	public List<Reply> replyInsert(Reply r) {
		List<Reply> rList = null;

		if (bDao.replyInsert(r)) { // 댓글 등록 성공
			rList = bDao.getReplyList(r.getR_bnum()); // 댓글 리스트 검색
		} else {
			rList = null;
		}
		return rList;

	}

	// 게시글 쓰기
	public ModelAndView boardWrite(Board board, List<MultipartFile> files, HttpSession session) {
		mav = new ModelAndView();
		String view = null;

		board.setB_id(session.getAttribute("id").toString());

		// boolean b=bDao.boardWrite(board); //기존 글번호:99--->boarb_seq.nextval()새글번호: 100
		// 101추가
		// int bNum=bDao.getBoardNum(); //board_seq.currval() 101리턴

		boolean b = bDao.boardWriteSelectKey(board); // 새글번호:100--->글번호100 boarb bean저장해 온다.
		System.out.println("bnum=" + board.getB_num()); // 100
		if (b) { // 글쓰기 성공
			if (files.get(0).getSize() != 0) { // 첨부파일이 존재
				if (fm.fileUp(files, board.getB_num(), session))
					System.out.println("upload OK");
			}
			view = "redirect:/boardlist";
		} else { // 글쓰기 실패
			view = "redirect:/writefrm";
		}
		mav.setViewName(view);
		return mav;
	}

	// 파일 다운로드
	public void download(Map<String, Object> params) throws Exception {
		String oriFileName = (String) params.get("oriFileName");
		String sysFileName = (String) params.get("sysFileName");
		String root = (String) params.get("root");
		String fullPath = root + "upload/" + sysFileName;
		// Map있으므로 생략
		// String origFileName=bDao.getOrigFileName(sysFileName);
		HttpServletResponse resp = (HttpServletResponse) params.get("response");
		fm.download(fullPath, oriFileName, resp);

	}

	// Fk : on delete cascade
	// 삭제TX: (파일삭제-->댓글삭제-->원글삭제)
	@Transactional // 이거 하나로 트랜지션 역할을 한다.
	public ModelAndView boardDelete(int bNum, RedirectAttributes attr) throws DbException{
		mav = new ModelAndView();
		String view = null;
		// 첨부파일 여부
		List<BoardFile> bfList = bDao.getBfList(bNum);
		System.out.println("bfList=" + bfList.size());
		boolean f, r, b;
		f = r = b = true;
		// 첨부파일 삭제
		if (bfList.size() != 0) {
			f = bDao.bfDelete(bNum); // 삭제실패:false
		}
		System.out.println("f=" + f);
		// 댓글 삭제
		List<Reply> rList = bDao.getReplyList(bNum);
		if (rList.size() != 0) {
			r = bDao.replyDelete(bNum);
		}
		System.out.println("r=" + r);
		// 게시글 삭제
		//b = bDao.boardDelete(4444444); // 삭제불가 테스트
		
		b = bDao.boardDelete(bNum);
		System.out.println("b=" + b);

		// RedirectAttributes는 Redirect전 session영역에 저장한뒤 redirect후 삭제한다.
		// addAttribute : (session영역에 저장-->request객체에 저장--->session영역삭제)
		// addFlashAttribute : (session영역에 저장후 1번 사용후 삭제함)
		if (f && r && b) {
			if (f) {
				fm.delete(bfList); // 웹서버에서 파일 삭제
			}
			attr.addFlashAttribute("bNum", bNum); // session저장하여 1번만 사용후 삭제됨 --? 새로고침해도 이상이 없다.
			//attr.addAttribute("bNum",bNum); //request객체에 저장하여 여러번 사용가능 --> 새로고침하면 alret이 계속해서 뜰 것이다.
			System.out.println("삭제트랜잭션 성공");
		} else {
			System.out.println("삭제트랜잭션 실패");
			throw new DbException(); // 예외 발생--->Rollback
		}
		mav.setViewName("redirect:/boardlist"); // 기존request객체(영역)삭제후--> 새로운 request생성

		return mav;
	}// boardDelete End

	public ModelAndView myBatisTest(String colName, Integer search) {
		mav = new ModelAndView();
		List<Member> mList = bDao.myBatisTest(colName, search);
		
		mav.addObject("mList",mList);
		mav.setViewName("test"); // jsp
		
		return mav;
	}

	public ModelAndView myBatisTestMap(Map<String, Object> hMap) {
		mav = new ModelAndView();
		List<Map<String,Object>> mList =bDao.myBatisTestMap(hMap);
		System.out.println(mList);
		mav.addObject("mList",mList);
		mav.setViewName("test");
		return mav;
	}
	//추천등록 메소드
	public void thumbsUp(Board board) {
		
	}
	public int addThumbs(Thumb thumb) {
		int result = 0;		
		//이 글에 추천한 적이 있는 사람이냐
		//bDao.updateBoardThumb();
		String t_id = bDao.checkThumbs(thumb);
		
		if( t_id == null || "".equals(t_id)) { //이미 추천이 있음
			bDao.addThumbs(thumb);
			bDao.updateBoardThumb();
		}else {//추천한 적이 없다면
			//세고
		}
		//전체 추천 수 출력
		result = bDao.countThumbs(thumb);
		return result;
	}

}
