package db;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisFactory {
	private static SqlSessionFactory factory;
	
	static {
		try {
			Reader r = Resources.getResourceAsReader("db/config.xml");
			factory = new SqlSessionFactoryBuilder().build(r);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static SqlSessionFactory getFactory() {
		return MybatisFactory.factory;
	}
	public static void setFactory(SqlSessionFactory factory) {
		MybatisFactory.factory = factory;
	}
}
