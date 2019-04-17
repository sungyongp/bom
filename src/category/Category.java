package category;

import java.util.List;

public interface Category {
	CategoryVo viewPlayer(String serial); //플레이어로 이동
	List<CategoryVo> list(String search); //검색어의 결과리스트를 반환.
	List<ActorVo> viewGetActor(String serial); //배우 목록을 얻습니다.
	public List<RecommendVo> viewGetRecommend(String serial); //추천 영화의 목록을 얻습니다.
	String view(String serial); //serial에 해당하는 JSON데이터 반환.
	String getSerial(String search); //bomplayer에서 다른 목록 재생시 사용
	List<CategoryVo> genreSearch(String genre); //genre 검색
}
