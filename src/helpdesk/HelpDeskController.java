package helpdesk;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelpDeskController {
	HelpDeskDao hDao;
	HelpDeskValidator hVali;

	public HelpDeskController() {
	}

	public HelpDeskController(HelpDesk hDao, HelpDeskValidator hVali) {
		this.hDao = (HelpDeskDao) hDao;
		this.hVali = hVali;
	}

	@RequestMapping(value = "view.help")
	public ModelAndView view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("helpdesk-view");
		return mv;
	}

	@RequestMapping(value = "insert.help")
	public ModelAndView insert(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String msg = "";

		boolean b = hDao.insert(req);

		if (b) {
			msg = "정상적으로 등록됨";
			System.out.println(msg);
		} else {
			msg = "등록 중 오류발생.";
			System.out.println(msg);
		}

		mv.setViewName("helpdesk-view");
		return mv;
	}

	@RequestMapping(value = "listView.help")
	public ModelAndView listView(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("helpdesk-my-list");
		return mv;
	}

	@RequestMapping(value = "modify.help")
	public ModelAndView modify(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();

		boolean b = hDao.modify(req);

		if (b) {
			System.out.println("true 값 받음");
		} else {
			System.out.println("false 값 받음");
		}

		mv.setViewName("helpdesk-view");
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "delete.help")
	public void myListDel(int serial, String photo, HttpServletResponse res) {

		try {
			int result = hDao.delete(serial);
			boolean b = hDao.deletePhoto(photo);
			
			if(b) {
				System.out.println("ok");
			}else {
				System.out.println("no");
			}
			
			PrintWriter out = res.getWriter();
		
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
