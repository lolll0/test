<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function call_ajax() {
    $("tbody").empty()
    var target = $("input[type=date]").val().replace(/-/gi, "")
    call_API()
    $.ajax({
        async: true, // ajax sync를 동기 방식으로 할지, 비동기 방식으로 할지  비동기 방식의 호출은 true!

        url: "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=0f41e4c4a0fa72f8f005a0f48d5f797e&targetDt=" + target,

        type: "GET",
        timeout: 3000,
        dataType: "json",  // 결과 JSON을 JavaScript객체로 변환
        
        success: function (result) {   // 서버가 주는 데이터 : result
            // alert("호출성공!")      // 제목
            $.each(result.boxOfficeResult.dailyBoxOfficeList, function (idx, item) {  // for문과 동일한 방식이다. 각각의 result에 대해 function을 수행
                var tr = $("<tr></tr>")
                var rank = $("<td></td>").text(item.rank)

                var movieNm = $("<td></td>").text(item.movieNm)

                var image_url = call_API(item.movieNm)

                var imgTd = $("<td></td>")
                var img = $("<img \>").attr("src", image_url).css("width", "150px")
                imgTd.append(img)

                var salesAcc = $("<td></td>").text(item.salesAcc)
                var audiAcc = $("<td></td>").text(item.audiAcc)


                var infoBtn = $("<input \>").attr({type: "button", value: "상세정보"})

                infoBtn.on("click", function () {
                    // 현재 클릭된 버튼에 대한 책 정보를 찾아서 삭제.
                    // this : 현재 이벤트가 발생된 객체를 지칭.
                    var movie_target = item.movieCd
                    get_more_info(movie_target)
                }) // "(click)"할때 이벤트 처리(함수)


                tr.append(rank)
                tr.append(imgTd)
                tr.append(movieNm)
                tr.append(salesAcc)
                tr.append(audiAcc)
                tr.append(infoBtn)

                $("tbody").append(tr)
            })

        },
        error: function (error) {
            alert("서버호출 실패")
        }
    })
    ///////////////////////////////////////////
    $.ajax({
		url : "<%=request.getContextPath() %>/MovieInsert.do",
		type : 'get',
		data : {
// 			"movieNo" : movieCd,
// 			"movieNm" : movieNm
// 			"movieOpen" : openDt,
// 			"movieAudi" : audiAcc
		},
		success : function(res){
			alert("success")
		},
		error : function(xhr){
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
		
	})
}


function get_more_info(movie_target) {

    $.ajax({
        async: true, // ajax sync를 동기 방식으로 할지, 비동기 방식으로 할지  비동기 방식의 호출은 true!
        url: "https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=0f41e4c4a0fa72f8f005a0f48d5f797e&movieCd=" + movie_target,
        type: "GET",
        timeout: 3000,
        dataType: "json",  // 결과 JSON을 JavaScript객체로 변환
        success: function (result) {   // 서버가 주는 데이터 : result
            var movieNm = result.movieInfoResult.movieInfo["movieNm"]
            var openDt = result.movieInfoResult.movieInfo["openDt"]
            var genres = ""
            for (var i in result.movieInfoResult.movieInfo.genres) {
                genres += result.movieInfoResult.movieInfo.genres[i].genreNm + ", "
            }
            genres = genres.slice(0, -2)
            var produceNm = result.movieInfoResult.movieInfo.directors[0]["peopleNm"]
            var actors = ""
            for (var i in result.movieInfoResult.movieInfo.actors) {
                actors += result.movieInfoResult.movieInfo.actors[i].peopleNm + ", "
            }
            actors = actors.slice(0, -2)

            alerts = "영화 이름 : " + movieNm + "\n" +
                "개봉 날짜 : " + openDt + "\n" +
                "영화 장르 : " + genres + "\n" +
                "감독 이름 : " + produceNm + "\n" +
                "배우들 : " + actors

            alert(alerts)
        },
        error: function (error) {
            alert("영화정보 호출 실패")
        }
    })
}

// $(function(){
// 	$.ajax({
<%-- 		url : "<%=request.getContextPath() %>/MovieInsert.do", --%>
// 		type : 'get',
// 		data : {
// 			"movieNo" : movieCd,
// 			"movieName" : movieNm,
// 			"movieOpen" : openDt,
// 			"movieAudi" : audiAcc
// 		},
// 		success : function(res){
// 			alert("success")
// 		},
// 		error : function(xhr){
// 			alert("상태 : " + xhr.status)
// 		},
// 		dataType : 'json'
		
// 	})
// })

function call_API(movieNm) {
    var img_url
    $.ajax({
        async: false,
        url: "https://dapi.kakao.com/v2/search/image",
        type: "GET",
        timeout: 3000,
        data: {query: movieNm + " 영화포스터", size: 30},
        dataType: "json",
        headers: {Authorization: "KakaoAK a810727b39e6ad7f1b151bab4e2c3de2"},
        // beforeSend : function(xhr){
        //     xhr.setRequestHeader("Authoriztion","KakaoAK a810727b39e6ad7f1b151bab4e2c3de2")
        // },
        success: function (result) {
            img_url = result.documents[0].image_url
        },
        error: function () {
            img_url = "image/no_img.jpg"
        }

    })
    return img_url
}
</script>
</head>
<body>

<head>
    <meta charset="utf-8">
    <title>BookSearch</title>
    <!--  jQuery CDN방식 사용  -->
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"
            integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
            crossorigin="anonymous"></script>
    <script src="js/kakao_sdk.js"></script>
    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
//         Kakao.init('a9b65b7ac89692e4c3c61a24b2650247');
        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>
    <script src="js/99_html_exam.js"></script>

    <!-- 우리는 Bootstrap을 다운로드 방식이 아닌 CDN방식으로 이용 -->
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="#">Company name</a>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <input class="form-control form-control-dark w-100" type="date" placeholder="Search" aria-label="Search">
    <input type="button" value="검색" onclick="call_ajax()">

</nav>

<div class="container-fluid">
    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="sidebar-sticky pt-3">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            <span data-feather="home"></span>영화 검색 <span class="sr-only">(current)</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2"> 일별 박스오피스</h1>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>순위</th>
                        <th>포스터</th>
                        <th>영화명</th>
                        <th>누적 매출액</th>
                        <th>누적 관람객수</th>
                        <th>영화 상세정보</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>
</body>
</html>
</body>
</html>