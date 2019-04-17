package member;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import db.MybatisFactory;

public class MemberDao implements Member {
	private SqlSession sqlSession;

	public MemberDao() {
		sqlSession = MybatisFactory.getFactory().openSession();
	}

	public boolean favorCheck(FavoriteVo vo) {
		return sqlSession.selectOne("member.favorCheck", vo);
	}

	public boolean addFavorite(FavoriteVo vo) {
		boolean b = false;

		int cnt = sqlSession.insert("member.addFavorite", vo);

		if (cnt > 0) {
			b = true;
			sqlSession.commit();
			System.out.println("cnt-----" + cnt);
		} else {
			sqlSession.rollback();
		}

		return b;
	}

	public boolean deleteFavorite(FavoriteVo vo) {
		boolean b = false;

		int cnt = sqlSession.delete("member.deleteFavorite", vo);

		if (cnt > 0) {
			b = true;
			sqlSession.commit();

		} else {
			sqlSession.rollback();
		}

		return b;
	}

	@Override
	public boolean kakaoMemberCheck(int kakaoId) {
		return sqlSession.selectOne("member.kakaoMemberCheck", kakaoId);
	}

	@Override
	public int getKakaoMemberSerial(int kakaoId) {
		int serial = sqlSession.selectOne("member.getKakaoMemberSerial", kakaoId);
		return serial;
	}

	@Override
	public void createTable(int serial) {

		HashMap<String, String> map = new HashMap<String, String>();

		String pn = "purchase_" + serial;
		String vn = "viewingactivity_" + serial;
		String fn = "favorite_" + serial;

		map.put("pn", pn);
		map.put("vn", vn);
		map.put("fn", fn);

		sqlSession.update("member.createTablePurchase", map);
		sqlSession.update("member.createTableViewingActivite", map);
		sqlSession.update("member.createTableFavorite", map);

	}

	@Override
	public boolean kakaoMemberInsert(KakaoMemberVo vo) {
		int r = sqlSession.insert("member.kakaoMemberInsert", vo);
		boolean b = false;
		if (r > 0) {
			b = true;
			sqlSession.commit();
		}

		return b;
	}

	public MemberVo getMemberSerial(String email) {
		MemberVo vo = sqlSession.selectOne("member.getMemberSerial", email);
		return vo;
	}

	public boolean insert(MemberVo vo) {
		boolean b = false;
		int result = sqlSession.insert("member.memberInsert", vo);

		if (result > 0) {
			sqlSession.commit();
			b = true;
		}
		return b;
	}

	public boolean memberLogin(MemberVo vo) {
		boolean b = false;
		b = sqlSession.selectOne("member.memberLogin", vo);

		if (b) {
			b = true;
		}
		return b;
	}

	public int idcheck(String m_email) {
		return sqlSession.selectOne("member.idchk", m_email);
	}

	public int idnickName(String m_nickName) {
		return sqlSession.selectOne("member.idnickName", m_nickName);
	}

	public boolean addViewingActivity(String serial, String mSerial, String playtime) {
		ViewingActivityVo vo = new ViewingActivityVo();
		vo.setC_serial(Integer.parseInt(serial));
		vo.setC_tableName(mSerial);
		vo.setC_playtime(Integer.parseInt(playtime));

		int cnt = sqlSession.insert("member.addViewingActivity", vo);
		if (cnt > 0) {
			sqlSession.commit();
			return true;
		} else {
			sqlSession.rollback();
			return false;
		}
	}

	public String checkView(String serial, String mSerial) {
		ViewingActivityVo vo = new ViewingActivityVo();
		vo.setC_serial(Integer.parseInt(serial));
		vo.setC_tableName(mSerial);
		int cnt = sqlSession.selectOne("member.checkView", vo);
		if (cnt == 0) {
			return null;
		} else {
			int playtime = sqlSession.selectOne("member.getPlaytime", vo);
			return new String(playtime + "");
		}
	}

	public boolean updateView(String serial, String mSerial, String playtime) {
		ViewingActivityVo vo = new ViewingActivityVo();
		vo.setC_serial(Integer.parseInt(serial));
		vo.setC_tableName(mSerial);
		vo.setC_playtime(Integer.parseInt(playtime));
		int cnt = sqlSession.update("member.updateView", vo);
		if (cnt != 0) {
			sqlSession.commit();
			return true;
		} else {
			sqlSession.rollback();
			return false;
		}

	}
	
	public String idSearch(String id) {
		return sqlSession.selectOne("member.idSearck",id);
	}
	public String phoneSearch(String phone) {
		return sqlSession.selectOne("member.phoneSearch", phone);
	}
	
	
}
