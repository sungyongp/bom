package member;

public interface Member {
	
  boolean kakaoMemberCheck(int kakaoId);
  boolean kakaoMemberInsert(KakaoMemberVo vo);
  int getKakaoMemberSerial(int kakaoId);  
  void createTable(int serial);
}
