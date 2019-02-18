package com.tmmmi.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.common.Page;
import com.tmmmi.common.Search;
import com.tmmmi.service.domain.QNA;
import com.tmmmi.service.qna.QNAService;
import com.tmmmi.service.user.UserService;

@Controller
@RequestMapping("/qna/*")
public class QNAController {
	
	@Autowired
	@Qualifier("qnaServiceImpl")
	private QNAService qnaService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public QNAController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['userCenterPageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['userCenterPageSize']}")
	int pageSize;
	
	@RequestMapping(value="addQNA", method=RequestMethod.GET )
	public ModelAndView addQNA(HttpSession session) throws Exception {
		System.out.println("/QNA/addQNA : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		//userNo session�쑝濡� 諛쏆븘�삤湲� &userId留� 鍮쇱삤湲�
		//臾몄쓽湲� �옉�꽦 �럹�씠吏��뿉�꽌 userId媛� �븘�슂�븿
		int userNo = (int) session.getAttribute("userNo");
		modelAndView.addObject("userId", userService.getUser(userNo).getUserId() );
		modelAndView.setViewName("/QNA/addQNA.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addQNA", method=RequestMethod.POST )
	public ModelAndView addQNA(@ModelAttribute("qna") QNA qna,HttpSession session) throws Exception {
		System.out.println("/QNA/addQNA : POST");
		
		int userNo = (int) session.getAttribute("userNo");
		qna.setUserNo(userNo);
		qnaService.addQNA(qna);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/qna/getQNAList");
		return modelAndView;
	}
	
	@RequestMapping(value="getQNA" )
	public ModelAndView getQNA(HttpSession session,  @RequestParam("qnaNo") int qnaNo) throws Exception {
		System.out.println("/QNA/getQNA : GET/POST");
		
		ModelAndView modelAndView = new ModelAndView();
	
		//�겢由��븳 �궗�엺�쓽 userNo
		//userRoll 諛쏆븘�삤湲곗쐞�빐 �븘�슂
		int userNo = (int)session.getAttribute("userNo");
		modelAndView.addObject("role", userService.getUser(userNo).getRole());
		
		//�옉�꽦�옄�쓽 �젙蹂대뱾
		int writerUserNo = qnaService.getQNA(qnaNo).getUserNo();
		modelAndView.addObject("writerUserNo", qnaService.getQNA(qnaNo).getUserNo());
		modelAndView.addObject("writerUserId", userService.getUser(writerUserNo).getUserId());
		modelAndView.addObject("writerUserName", userService.getUser(writerUserNo).getUserName());
		
		QNA qna = qnaService.getQNA(qnaNo);
		modelAndView.addObject("qna", qna);
		modelAndView.setViewName("/QNA/getQNA.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getQNAList" )
	public ModelAndView getQNAList(@ModelAttribute("search") Search search, HttpSession session) throws Exception{
		System.out.println("/QNA/getQNAList : GET/POST");
		
		int userNo = (int)session.getAttribute("userNo");
		System.out.println("userNo::::" +userNo);
		int role = userService.getUser(userNo).getRole();
	
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		if(search.getSearchKeyword() != null) {
			search.setSearchCondition("0");
		}
		
		Map<String, Object> map;
		ModelAndView modelAndView = new ModelAndView();
		
		//admin
		if(role == 0) {
			map = qnaService.getAdminQNAList(search);
		}else {
			map = qnaService.getQNAList(search, userNo);
		}
		
		Page resultPage = new Page(search.getCurrentPage(),  ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
	
		modelAndView.setViewName("/QNA/listQNA.jsp");
		return modelAndView;
	}
		
	@RequestMapping(value="updateQNA", method=RequestMethod.GET )
	public ModelAndView updateQNA( @RequestParam("qnaNo") int qnaNo) throws Exception{
		System.out.println("/QNA/updateQNA : GET");

		QNA qna = qnaService.getQNA(qnaNo);
		
		ModelAndView modelAndView = new ModelAndView();		
		modelAndView.addObject("qna", qna);
		modelAndView.setViewName("/QNA/updateQNA.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="updateQNA", method=RequestMethod.POST )
	public ModelAndView updateQNA(@ModelAttribute("qna") QNA qna) throws Exception{
		System.out.println("/QNA/updateQNA : POST");
		
		qnaService.updateQNA(qna);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/qna/getQNA?qnaNo="+qna.getQNANo());
		return modelAndView;
	}
	
	@RequestMapping(value="addQNAAnswer", method=RequestMethod.GET )
	public ModelAndView addQNAAnswer(@RequestParam("qnaNo") int qnaNo) throws Exception{
		System.out.println("/QNA/addQNAAnswer : GET");
		
		QNA qna = qnaService.getQNA(qnaNo);
	
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("qna", qna);
		modelAndView.setViewName("/QNA/addQNAAnswer.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addQNAAnswer", method=RequestMethod.POST )
	public ModelAndView addQNAAnswer(@ModelAttribute("qna") QNA qna)throws Exception{
		System.out.println("/QNA/addQNAAnswer : POST");
	
		qnaService.addQNAAnswer(qna);
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/qna/getQNA?qnaNo="+qna.getQNANo());
		return modelAndView;
	}
	
	@RequestMapping(value="updateQNAAnswer", method=RequestMethod.GET )
	public ModelAndView updateQNAAnswer(@RequestParam("qnaNo") int qnaNo) throws Exception{
		System.out.println("/QNA/updateQNAAnswer : GET");
		
		QNA qna = qnaService.getQNA(qnaNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("qna", qna);
		modelAndView.setViewName("/QNA/updateQNAAnswer.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="updateQNAAnswer", method=RequestMethod.POST )
	public ModelAndView updateQNAAnswer(@ModelAttribute("qna") QNA qna)throws Exception{
		System.out.println("/QNA/updateQNAAnswer : POST");
		
		qnaService.addQNAAnswer(qna);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/qna/getQNA?qnaNo="+qna.getQNANo());
		return modelAndView;
	}
	
	@RequestMapping(value = "imageQNA", method = RequestMethod.POST)
    public void imageQNA(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
	 	
        OutputStream out = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
 
        try{
            String fileName = System.currentTimeMillis() + "." +upload.getOriginalFilename().split("\\.")[1];
            byte[] bytes = upload.getBytes();
            String uploadPath = "C:\\Users\\Bit\\git\\tmmmi\\TMMMI\\WebContent\\resources\\images\\QNAImage\\" + fileName;//저장경로
            
            File file = new File(uploadPath);
            out = new FileOutputStream(file);
            out.write(bytes);
 
            printWriter = response.getWriter();
            String fileUrl = "/images/QNAImage/" + fileName;//url경로
 
           printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("+1+ ",'"+fileUrl+ "',''"+ ");\n</script>");
            //printWriter.write("{\"uploaded\": 1,\"fileName\": \""+fileName+"\", \"url \" :"+"\"http://192.168.0.53:8080/images/diaryImage/"+fileName+"\"}");
            printWriter.flush();
 
        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return;
    }
	
	
}
