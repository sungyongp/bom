package helpdesk;

public class HelpDeskVo {

	int q_serial; //해당 글 시리얼
	
	String q_subject;
	String q_content;
	String q_mdate;
	String q_photo;
	String q_photo_delete;
	String m_writer; //작성 유저 닉네임
	int m_serial; //작성 유저 시리얼

	String q_reply; //해당 글 답변
	
	public HelpDeskVo() {}

	public int getQ_serial() {
		return q_serial;
	}

	public void setQ_serial(int q_serial) {
		this.q_serial = q_serial;
	}

	public String getQ_subject() {
		return q_subject;
	}

	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_mdate() {
		return q_mdate;
	}

	public void setQ_mdate(String q_mdate) {
		this.q_mdate = q_mdate;
	}

	public String getM_writer() {
		return m_writer;
	}

	public void setM_writer(String m_writer) {
		this.m_writer = m_writer;
	}

	public String getQ_photo() {
		return q_photo;
	}

	public void setQ_photo(String q_photo) {
		this.q_photo = q_photo;
	}

	public int getM_serial() {
		return m_serial;
	}

	public void setM_serial(int m_serial) {
		this.m_serial = m_serial;
	}

	public String getQ_reply() {
		return q_reply;
	}

	public void setQ_reply(String q_reply) {
		this.q_reply = q_reply;
	}

	public String getQ_photo_delete() {
		return q_photo_delete;
	}

	public void setQ_photo_delete(String q_photo_delete) {
		this.q_photo_delete = q_photo_delete;
	}
	
}
