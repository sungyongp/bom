package helpdesk;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface HelpDesk {

	boolean insert(HttpServletRequest req);
	
	boolean modify(HttpServletRequest req);
	
	List<HelpDeskVo> listCheck(int memberSerial);
	
	boolean deletePhoto(String photo);
	
	int delete(int serial);
}
