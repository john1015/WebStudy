<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top:50px
}
.row{
	margin:0px auto;
	width:800px
}
</style>
<script type="text/javascript">
// 전역변수 => const : 상수 , let : 변수
	const movie=[
		{"startYearDate":"2024.07.28","endYearDate":"2024.07.28","startDate":"2024년 07월 28일(일)","endDate":"2024년 07월 28일(일)","movieCd":"20247781","showDt":"20240728","thumbUrl":"/common/mast/movie/2024/07/thumb/thn_8b6e20a95bc6477e88dc0d42f255539b.jpg","movieNm":"데드풀과 울버린","movieNmEn":"DEADPOOL & WOLVERIN","synop":null,"prdtYear":"2024","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"127","showTs":"45","director":"숀 레비","prNm":null,"dtNm":"월트디즈니컴퍼니코리아 유한책임회사","repNationCd":"미국","movieType":"장편","moviePrdtStat":"개봉","genre":"액션,코미디,SF","watchGradeNm":"청소년관람불가","openDt":"20240724","salesAmt":2568994883,"audiCnt":246316,"totalSalesAmt":11304758123,"totalAudiCnt":1086016,"scrCnt":1919,"showCnt":8414,"rank":1,"rankInten":0,"rankOldAndNew":"OLD","rownum":1},
		{"startYearDate":"2024.07.28","endYearDate":"2024.07.28","startDate":"2024년 07월 28일(일)","endDate":"2024년 07월 28일(일)","movieCd":"20247440","showDt":"20240728","thumbUrl":"/common/mast/movie/2024/07/thumb/thn_cfb357a6efd847d5b3e4889b71856fe7.jpeg","movieNm":"슈퍼배드 4","movieNmEn":"Despicable Me 4","synop":"미니언-파서블\r\n올여름은 우리가 씹어 먹는다!\r\n\r\n악당 짓 NO, 악당 처리 YES! 이제는 차카게 산다!\r\n슈트-업 하고 악당 전담 처리반 AVL이 된 ‘에이전트 미니언즈’와\r\n미니언즈 만큼 귀여운 ‘그루 주니어’가 태어나면서 더욱 완벽해진 ‘그루 패밀리’.\r\n\r\n이들 앞에 과거 그루의 고등학교 동창이자 그에게 체포당했던 빌런 ‘맥심’이 등장하고,\r\n오직 그루를 향한 복수심에 불타올라 탈옥까지 감행한 맥심은\r\n그루 패밀리의 뒤를 바짝 추격하며 위협을 가하기 시작하는데...\r\n\r\n과연 에이전트 미니언즈와 그루 패밀리는 맥심을 막아낼 수 있을까?","prdtYear":"2024","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"93","showTs":"43","director":"크리스 리노드","prNm":null,"dtNm":"유니버설픽쳐스인터내셔널 코리아(유)","repNationCd":"미국","movieType":"장편","moviePrdtStat":"개봉","genre":"애니메이션,액션,어드벤처,코미디","watchGradeNm":"전체관람가","openDt":"20240724","salesAmt":1361684323,"audiCnt":145484,"totalSalesAmt":5492487247,"totalAudiCnt":588416,"scrCnt":1178,"showCnt":4406,"rank":2,"rankInten":0,"rankOldAndNew":"OLD","rownum":2},
		{"startYearDate":"2024.07.28","endYearDate":"2024.07.28","startDate":"2024년 07월 28일(일)","endDate":"2024년 07월 28일(일)","movieCd":"20212932","showDt":"20240728","thumbUrl":"/common/mast/movie/2024/06/thumb/thn_339c969f1c8942dfbbe5d1e2d3de7188.jpg","movieNm":"탈주","movieNmEn":"Escape","synop":"“내 앞 길 내가 정했습니다”\r\n휴전선 인근 북한 최전방 군부대.\r\n10년 만기 제대를 앞둔 중사 ‘규남’(이제훈)은 미래를 선택할 수 없는 북을 벗어나\r\n원하는 것을 해 볼 수 있는 철책 너머로의 탈주를 준비한다.\r\n그러나, ‘규남’의 계획을 알아챈 하급 병사 ‘동혁’(홍사빈)이 먼저 탈주를 시도하고,\r\n말리려던 ‘규남’까지 졸지에 탈주병으로 체포된다.\r\n\r\n“허튼 생각 말고 받아들여. 이것이 니 운명이야”\r\n탈주병 조사를 위해 부대로 온 보위부 소좌 ‘현상’(구교환)은\r\n어린 시절 알고 지내던 ‘규남’을 탈주병을 체포한 노력 영웅으로 둔갑시키고\r\n사단장 직속보좌 자리까지 마련해주며 실적을 올리려 한다.\r\n\r\n하지만 ‘규남’이 본격적인 탈출을 감행하자 ‘현상’은 물러설 길 없는 추격을 시작한다.","prdtYear":"2024","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"94","showTs":"9","director":"이종필","prNm":"더램프(주)","dtNm":"플러스엠 엔터테인먼트","repNationCd":"한국","movieType":"장편","moviePrdtStat":"개봉","genre":"액션","watchGradeNm":"12세이상관람가","openDt":"20240703","salesAmt":794258228,"audiCnt":82451,"totalSalesAmt":21651684315,"totalAudiCnt":2282056,"scrCnt":899,"showCnt":2339,"rank":3,"rankInten":0,"rankOldAndNew":"OLD","rownum":3},
		{"startYearDate":"2024.07.28","endYearDate":"2024.07.28","startDate":"2024년 07월 28일(일)","endDate":"2024년 07월 28일(일)","movieCd":"20235974","showDt":"20240728","thumbUrl":"/common/mast/movie/2024/06/thumb/thn_041e1f5d30ad452ea0c31714aadb8734.jpg","movieNm":"인사이드 아웃 2","movieNmEn":"Inside Out 2","synop":"디즈니·픽사의 대표작 <인사이드 아웃>\r\n새로운 감정과 함께 돌아오다!\r\n\r\n13살이 된 라일리의 행복을 위해 매일 바쁘게 머릿속 감정 컨트롤 본부를 운영하는 \r\n‘기쁨’, ‘슬픔’, ‘버럭’, ‘까칠’, ‘소심’.\r\n\r\n그러던 어느 날,\r\n낯선 감정인 ‘불안’, ‘당황’, ‘따분’, ‘부럽’이가 본부에 등장하고,\r\n언제나 최악의 상황을 대비하며 제멋대로인 ‘불안’이와 기존 감정들은 계속 충돌한다.\r\n\r\n결국 새로운 감정들에 의해 본부에서 쫓겨나게 된 기존 감정들은 \r\n다시 본부로 돌아가기 위해 위험천만한 모험을 시작하는데…\r\n\r\n2024년, 전 세계를 공감으로 물들인 유쾌한 상상이 다시 시작된다!\r\n","prdtYear":"2024","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"96","showTs":"18","director":"켈시 만","prNm":"월트 디즈니 픽쳐스,픽사 애니메이션 스튜디오","dtNm":"월트디즈니컴퍼니코리아 유한책임회사","repNationCd":"미국","movieType":"장편","moviePrdtStat":"개봉","genre":"애니메이션","watchGradeNm":"전체관람가","openDt":"20240612","salesAmt":564806082,"audiCnt":58197,"totalSalesAmt":79738401801,"totalAudiCnt":8291896,"scrCnt":777,"showCnt":1608,"rank":4,"rankInten":0,"rankOldAndNew":"OLD","rownum":4},
		{"startYearDate":"2024.07.28","endYearDate":"2024.07.28","startDate":"2024년 07월 28일(일)","endDate":"2024년 07월 28일(일)","movieCd":"20240983","showDt":"20240728","thumbUrl":"/common/mast/movie/2024/07/thumb/thn_61229c20fba24c83b562ccc13c560815.jpg","movieNm":"명탐정 코난: 100만 달러의 펜타그램","movieNmEn":"Detective Conan the Movie: The Million-dollar Pentagram","synop":"홋카이도 하코다테에 있는 ‘오노에’ 재벌 가의 창고에 ‘괴도 키드’의 예고장이 도착한다.\r\n‘빅 주얼’만을 노리는 키드가 이번에 노리는 것은\r\n과거 신선조 귀신 부장 ‘히지카타 토시조’와 얽힌 전설적인 검.\r\n검술 대회에 참가하기 위해 하코다테에 방문한 ‘핫토리 헤이지’와\r\n그를 응원하기 위해 온 ‘코난’ 일행도 괴도 키드를 막기 위해 사건에 뛰어들게 된다.\r\n\r\n한편, 가슴에 열 십 자(十) 모양의 자상을 입은 시신이 발견되고\r\n‘죽음의 상인’이라고 불리는 무기상이 용의자로 지목된다.\r\n그 역시 괴도 키드가 찾는 검을 노리고 있었고,\r\n그 검이 오노에 가문이 세대에 걸쳐 지킨 보물을 찾을 열쇠임이 밝혀진다.\r\n검을 쫓는 키드에게 수수께끼의 검사가 습격해 오고, 절체절명의 위기가 닥쳐오는데…!\r\n\r\n검에 숨겨진 ‘진실’이 어두운 밤을 베고 달빛 아래 드러난다!","prdtYear":"2024","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"110","showTs":"36","director":"나가오카 치카","prNm":"TMS 엔터테인먼트","dtNm":"(주)씨제이이엔엠","repNationCd":"일본","movieType":"장편","moviePrdtStat":"개봉","genre":"애니메이션","watchGradeNm":"12세이상관람가","openDt":"20240717","salesAmt":260530502,"audiCnt":27182,"totalSalesAmt":5479615323,"totalAudiCnt":557265,"scrCnt":575,"showCnt":1032,"rank":5,"rankInten":0,"rankOldAndNew":"OLD","rownum":5},
		{"startYearDate":"2024.07.28","endYearDate":"2024.07.28","startDate":"2024년 07월 28일(일)","endDate":"2024년 07월 28일(일)","movieCd":"20208245","showDt":"20240728","thumbUrl":"/common/mast/movie/2024/07/thumb/thn_cf3b969f2ded4b61b7a5c2e15a61c153.jpg","movieNm":"핸섬가이즈","movieNmEn":"Handsome Guys","synop":" “우리가 뭐 빠지는 게 있노? 집도 있고 차도 있고 인물도 훤칠한데.”\r\n\r\n자칭 터프가이 ‘재필’(이성민)과 섹시가이 ‘상구’(이희준)\r\n현실은 잊지 못할 첫인상으로 이사 첫날부터\r\n동네 경찰 ‘최 소장’(박지환)과 ‘남 순경’(이규형)의 특별 감시 대상이 되지만,\r\n꿈꾸던 유럽풍 드림하우스에서 새출발한다는 것에 그저 행복하기만 하다.\r\n\r\n그러나 행복도 잠시, 물에 빠질뻔한 ‘미나’(공승연)을 구해주려다\r\n오히려 납치범으로 오해받는 상황이 이어진다.\r\n한편 ‘미나’를 찾으러 온 불청객들을 시작으로 지하실에 봉인되어 있던 악령이 깨어나며\r\n어두운 기운이 집안을 둘러싸기 시작하는데…\r\n\r\n“왜 다들 우리집에 와서 죽고 난리야!”","prdtYear":"2023","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"101","showTs":"4","director":"남동협","prNm":"(주)하이브미디어코프","dtNm":"(주)넥스트엔터테인먼트월드(NEW)","repNationCd":"한국","movieType":"장편","moviePrdtStat":"개봉","genre":"코미디","watchGradeNm":"15세이상관람가","openDt":"20240626","salesAmt":227821568,"audiCnt":23549,"totalSalesAmt":16055521838,"totalAudiCnt":1716891,"scrCnt":528,"showCnt":837,"rank":6,"rankInten":0,"rankOldAndNew":"OLD","rownum":6},
		{"startYearDate":"2024.07.28","endYearDate":"2024.07.28","startDate":"2024년 07월 28일(일)","endDate":"2024년 07월 28일(일)","movieCd":"20208911","showDt":"20240728","thumbUrl":"/common/mast/movie/2024/06/thumb/thn_9eca250f626a49c788e2af5f24cbfc6f.jpg","movieNm":"탈출: 프로젝트 사일런스","movieNmEn":"PROJECT SILENCE","synop":"붕괴 위기의 공항대교,\r\n생존자 전원이 타겟이 되었다.\r\n\r\n기상 악화로 한치 앞도 구분할 수 없는 공항대교.\r\n연쇄 추돌 사고와 폭발로 붕괴 위기에 놓인 다리 위에 사람들이 고립된다.\r\n이 때 극비리에 이송 중이던 '프로젝트 사일런스'의 군사용 실험견들이 풀려나고\r\n모든 생존자가 그들의 타겟이 되어 무차별 공격당하는 통제불능의 상황이 벌어진다.\r\n\r\n공항으로 향하던 안보실 행정관(이선균)부터\r\n사고를 수습하려고 현장을 찾은 렉카 기사(주지훈),\r\n그리고 실험견들을 극비리에 이송 중이던 '프로젝트 사일런스'의 책임연구원(김희원)까지.\r\n\r\n사상 최악의 연쇄 재난 발생,\r\n살아남기 위한 극한의 사투가 시작된다!\r\n","prdtYear":"2024","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"95","showTs":"46","director":"김태곤","prNm":"블라드스튜디오,(주)씨제이이엔엠","dtNm":"(주)씨제이이엔엠","repNationCd":"한국","movieType":"장편","moviePrdtStat":"개봉","genre":"스릴러","watchGradeNm":"15세이상관람가","openDt":"20240712","salesAmt":79648105,"audiCnt":8119,"totalSalesAmt":6553815231,"totalAudiCnt":672058,"scrCnt":332,"showCnt":469,"rank":7,"rankInten":1,"rankOldAndNew":"OLD","rownum":7},
		{"startYearDate":"2024.07.28","endYearDate":"2024.07.28","startDate":"2024년 07월 28일(일)","endDate":"2024년 07월 28일(일)","movieCd":"20224666","showDt":"20240728","thumbUrl":"/common/mast/movie/2024/07/thumb/thn_53d95c4cf5924ebdb0e356dda93dd77b.jpg","movieNm":"파일럿","movieNmEn":"Pilot","synop":"하루 아침에 인생 추락한 스타 파일럿\r\n제 2의 인생 이륙 준비 중!\r\n\r\n최고의 비행 실력을 갖춘 스타 파일럿이자\r\n뜨거운 인기로 유명 TV쇼에도 출연할 만큼 고공행진 하던 한정우(조정석)는\r\n순간의 잘못으로 하루아침에 모든 것을 잃고 실직까지 하게 된다.\r\n\r\n블랙 리스트에 오른 그를 다시 받아줄 항공사는 어느 곳도 없었고\r\n궁지에 몰린 한정우는 여동생의 신분으로 완벽히 변신, 마침내 재취업에 성공한다.\r\n\r\n그러나 기쁨도 잠시! 또다시 예상치 못한 난관에 부딪히게 되는데…\r\n인생 순항을 꿈꾸던 그의 삶은 무사히 이륙할 수 있을까?\r\n\r\n","prdtYear":"2023","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"110","showTs":"58","director":"김한결","prNm":"쇼트케이크(주),(주)무비락","dtNm":"롯데컬처웍스(주)롯데엔터테인먼트","repNationCd":"한국","movieType":"장편","moviePrdtStat":"개봉예정","genre":"코미디","watchGradeNm":"12세이상관람가","openDt":"20240731","salesAmt":79377067,"audiCnt":6701,"totalSalesAmt":495233434,"totalAudiCnt":49126,"scrCnt":18,"showCnt":26,"rank":8,"rankInten":-1,"rankOldAndNew":"OLD","rownum":8},
		{"startYearDate":"2024.07.28","endYearDate":"2024.07.28","startDate":"2024년 07월 28일(일)","endDate":"2024년 07월 28일(일)","movieCd":"20249733","showDt":"20240728","thumbUrl":"/common/mast/movie/2024/07/thumb/thn_802e82bdf0af47fcbdab6d012aeac2bb.jpg","movieNm":"사랑의 하츄핑","movieNmEn":"Heartsping : Teenieping of Love","synop":"처음 본 순간, 한눈에 반해버렸어!\r\n설레는 운명이 시작된 우리의 첫 만남!\r\n\r\n인생의 소울메이트를 꼭 만나길 바라는 ‘로미’\r\n우연한 기회에 ‘하츄핑’을 처음 본 뒤, 운명의 인연임을 알아본다.\r\n'로미'는 ‘하츄핑’을 찾기 위해 반대를 무릅쓰고 새로운 길을 떠나지만,\r\n마침내 만나게 된 ‘하츄핑’은 인간과의 소통을 거부하는데…","prdtYear":"2024","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"86","showTs":"0","director":"김수훈","prNm":"(주)에스에이엠지엔터테인먼트","dtNm":"(주)쇼박스","repNationCd":"한국","movieType":"장편","moviePrdtStat":"개봉예정","genre":"애니메이션","watchGradeNm":"전체관람가","openDt":"20240807","salesAmt":40034300,"audiCnt":3435,"totalSalesAmt":128831250,"totalAudiCnt":11546,"scrCnt":12,"showCnt":16,"rank":9,"rankInten":0,"rankOldAndNew":"OLD","rownum":9},
		{"startYearDate":"2024.07.28","endYearDate":"2024.07.28","startDate":"2024년 07월 28일(일)","endDate":"2024년 07월 28일(일)","movieCd":"20235926","showDt":"20240728","thumbUrl":"/common/mast/movie/2024/06/thumb/thn_51e1cbe61c084166a660dbb102ca5c06.jpg","movieNm":"퍼펙트 데이즈","movieNmEn":"Perfect Days","synop":"도쿄 시부야의 공공시설 청소부 ‘히라야마’는 매일 반복되지만 충만한 일상을 살아간다.\r\n\r\n오늘도 그는 카세트 테이프로 올드 팝을 듣고,\r\n필름 카메라로 나무 사이에 비치는 햇살을 찍고,\r\n자전거를 타고 단골 식당에 가서 술 한잔을 마시고,\r\n헌책방에서 산 소설을 읽으며 하루를 마무리한다.\r\n\r\n그러던 어느 날, 사이가 소원한 조카가 찾아오면서 그의 반복되는 일상에 작은 변화가 생긴다.\r\n\r\n","prdtYear":"2023","indieYn":null,"artmovieYn":null,"multmovieYn":"Y","showTm":"124","showTs":"26","director":"빔 벤더스","prNm":null,"dtNm":"(주)티캐스트","repNationCd":"일본","movieType":"장편","moviePrdtStat":"개봉","genre":"드라마","watchGradeNm":"12세이상관람가","openDt":"20240703","salesAmt":31272195,"audiCnt":3246,"totalSalesAmt":621719087,"totalAudiCnt":65643,"scrCnt":53,"showCnt":69,"rank":10,"rankInten":0,"rankOldAndNew":"OLD","rownum":10}];
window.onload=function(){
	let html='';
	movie.map(function(m){
		html+='<tr>'
		+'<td><img src="http://www.kobis.or.kr'+m.thumbUrl+'" width=30 height=30></td>'
		+'<td>'+m.movieNm+'</td>'
		+'<td>'+m.director+'</td>'
		+'<td>'+m.genre+'</td>'
		+'<td>'+m.watchGradeNm+'</td>'
		+'</tr>'
	})
	document.querySelector('tbody').innerHTML=html
}
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">일일 박스오피스</h3>
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th class="text-center"></th>
						<th class="text-center">영화명</th>
						<th class="text-center">감독</th>
						<th class="text-center">장르</th>
						<th class="text-center">등급</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>