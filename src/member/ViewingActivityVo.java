package member;

public class ViewingActivityVo {
	String c_tableName;
	String c_date;
	int c_serial;
	int c_playtime;
	
	public String getC_tableName() {
		return c_tableName;
	}
	public void setC_tableName(String c_tableName) {
		this.c_tableName = "viewingactivity_"+c_tableName;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public int getC_serial() {
		return c_serial;
	}
	public void setC_serial(int c_serial) {
		this.c_serial = c_serial;
	}
	public int getC_playtime() {
		return c_playtime;
	}
	public void setC_playtime(int c_playtime) {
		this.c_playtime = c_playtime;
	}
}
