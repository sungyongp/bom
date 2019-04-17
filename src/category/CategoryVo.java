package category;

public class CategoryVo {
	int c_serial;
	String c_movie_subject; // 영화 제목 한글
	String c_movie_subject_eng; // 영화 제목 영어
	String c_description; // 설명
	String c_opendate; // 개봉일
	String c_playtime; // 플레이타임
	String c_nation; // 국가
	String c_company; // 제작사
	int c_grade; // 1. 전체 2. 12세 3. 15세 4. 19세
	int c_hit; // 조회수 - 인기순 정렬시 필요
	String c_rdate; // 봄에 등록일
	int c_status; // 1.봄에서 상영중 2.봄에서 상영중지

	public String toJSON() {
		return String.format(
				"{" + "'serial' : '%d'," + "'movieSubject' : '%s'," + "'subjectEng' : '%s'," + "'description' : '%s',"
						+ "'opendate' : '%s'," + "'playtime' : '%s'," + "'nation' : '%s'," + "'grade' : '%s',"
						+ "'company' : '%s'," + "'hit' : '%d'," + "'rdate' : '%s'," + "'status' : '%s'" + "}",
				this.c_serial, this.c_movie_subject, this.c_movie_subject_eng, this.c_description, this.c_opendate,
				this.c_playtime, this.c_nation, this.convertGrade(), this.c_company, this.c_hit, this.c_rdate,
				this.convertStatus()).replace("'", "\"");
	}

	public String convertStatus() {
		switch (this.c_status) {
		case 1:
			return "상영중";
		case 2:
			return "상영중지";
		default:
			return "error";
		}
	}

	public String convertGrade() {
		switch (this.c_grade) {
		case 1:
			return "전체 이용가";
		case 2:
			return "12세 이상 이용가";
		case 3:
			return "15세 이상 이용가";
		case 4:
			return "19세 이상 이용가";
		default:
			return "error";
		}
	}

	public int getC_serial() {
		return c_serial;
	}

	public void setC_serial(int c_serial) {
		this.c_serial = c_serial;
	}

	public String getC_description() {
		return c_description;
	}

	public void setC_description(String c_description) {
		this.c_description = c_description;
	}

	public String getC_opendate() {
		return c_opendate;
	}

	public void setC_opendate(String c_opendate) {
		this.c_opendate = c_opendate;
	}

	public String getC_playtime() {
		return c_playtime;
	}

	public void setC_playtime(String c_playtime) {
		this.c_playtime = c_playtime;
	}

	public String getC_nation() {
		return c_nation;
	}

	public void setC_nation(String c_nation) {
		this.c_nation = c_nation;
	}

	public String getC_company() {
		return c_company;
	}

	public void setC_company(String c_company) {
		this.c_company = c_company;
	}

	public String getC_grade() {
		return this.convertGrade();
	}

	public void setC_grade(int c_grade) {
		this.c_grade = c_grade;
	}

	public int getC_hit() {
		return c_hit;
	}

	public void setC_hit(int c_hit) {
		this.c_hit = c_hit;
	}

	public String getC_rdate() {
		return c_rdate;
	}

	public void setC_rdate(String c_rdate) {
		this.c_rdate = c_rdate;
	}

	public int getC_status() {
		return c_status;
	}

	public void setC_status(int c_status) {
		this.c_status = c_status;
	}

	public String getC_movie_subject() {
		return c_movie_subject;
	}

	public void setC_movie_subject(String c_movie_subject) {
		this.c_movie_subject = c_movie_subject;
	}

	public String getC_movie_subject_eng() {
		return c_movie_subject_eng;
	}

	public void setC_movie_subject_eng(String c_movie_subject_eng) {
		this.c_movie_subject_eng = c_movie_subject_eng;
	}

}
