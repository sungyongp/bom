package member;

public class FavoriteVo {
	String c_tableName;
	int c_serial;

	public String getC_tableName() {
		return c_tableName;
	}

	public void setC_tableName(String c_tableName) {
		this.c_tableName = "favorite_" + c_tableName;
	}

	public int getC_serial() {
		return c_serial;
	}

	public void setC_serial(int c_serial) {
		this.c_serial = c_serial;
	}

}
