<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<style type="text/css">
	.event_wrap{padding:60px 0 6px}
	.event_title_wrap{position:relative; align-items:center; justify-content:space-between}
	.event_title_wrap:after{content:''; clear:both; display:block; font-size:0; line-height:0}
	.event_title_wrap h3{float:left; height:auto; margin:0; font-weight:700; font-size:26px; color:#222; line-height:1.423em; background-image:none}
	.event_title_wrap .btn_allView{float:right; margin-top:4px; padding:4px 32px 4px 15px; font-size:14px; color:#222; line-height:1.429em; background:transparent url('./../images/common/ico/arrowR_8x13.png') calc(100% - 7px) center/8px 13px scroll no-repeat; border:1px solid #e2e2e2; border-radius:15px; box-shadow:1px 1px 1px 0 rgba(0, 0, 0, 0.05)}
	.event_title_wrap .btn_eventControl{display:block; position:absolute; right:106px; top:4px; width:28px; height:28px; font-size:0; background:transparent url('./../images/common/ico/main/play.png') 10px center/11px 15px scroll no-repeat; border:1px solid #e3e3e3; border-radius:50%}
	.event_title_wrap .btn_eventControl.active{background:transparent url('./../images/common/ico/main/stop.png') center center/9px 13px scroll no-repeat}

	.event_list_wrap{overflow:hidden; position:relative; width:100%; margin-top:19px; margin-left:-30px; padding:0 30px}
	.event_list_wrap .event_list{overflow:visible; position:relative}
	.event_list_wrap .event_list:before{content:''; display:block; position:absolute; left:-30px; top:0; width:10px; height:100%; background-color:#fff; z-index:2}
	.event_list_wrap .event_list:after{content:''; display:block; position:absolute; right:-30px; top:0; width:10px; height:100%; background-color:#fff; z-index:3;}
	.event_list_wrap .event_list .swiper-wrapper .swiper-slide a{display:block}
	.event_list_wrap .event_list .swiper-wrapper .swiper-slide a .img_wrap{overflow:hidden; width:310px; height:207px; border-radius:10px}
	.event_list_wrap .event_list .swiper-wrapper .swiper-slide a strong{display:block; overflow:hidden; margin-top:16px; font-weight:500; font-size:18px; color:#222; line-height:1.444em; text-overflow:ellipsis; white-space:nowrap}
	.event_list_wrap .event_list .swiper-wrapper .swiper-slide a span{display:block; margin-top:4px; font-size:14px; color:#666; line-height:1.429em}
	.event_list_wrap .swiper-button-prev{overflow:hidden; left:-20px; top:calc(50% - 26px); width:40px; height:40px; margin-top:-20px; font-size:0; border-radius:50%; box-shadow:2px 2px 8px 0 rgba(0, 0, 0, 0.2)}
	.event_list_wrap .swiper-button-prev:after{content:''; width:40px; height:40px; background:rgba(255, 255, 255, 0.8) url('./../images/common/ico/arrowL.png') center/9px 13px scroll no-repeat}
	.event_list_wrap .swiper-button-next{overflow:hidden; right:-20px; top:calc(50% - 26px); width:40px; height:40px; margin-top:-20px; font-size:0; border-radius:50%; box-shadow:2px 2px 8px 0 rgba(0, 0, 0, 0.2)}
	.event_list_wrap .swiper-button-next:after{content:''; width:40px; height:40px; background:rgba(255, 255, 255, 0.8) url('./../images/common/ico/arrowL.png') center/9px 13px scroll no-repeat; transform:rotate(-180deg)}
	.event_list_wrap .swiper-button-disabled{display:none}
	
	
</style>

</head>

<body>
<div id="ctl00_PlaceHolderContent_event_wrap" class="event_wrap">
                <div class="contents">
                <div class="event_title_wrap">
                    <h3 style="color: white; margin-left: 15px;">EVENT</h3>
                    
                </div>
                <div class="event_list_wrap">
                    <div class="swiper event_list swiper-container-initialized swiper-container-horizontal">
                    <div class="swiper-wrapper" style="transform: translate3d(-1004px, 0px, 0px); transition-duration: 0ms;">
                        
                                 <div class="swiper-slide" style="width: 310.667px; height:206px; margin-right: 24px;">
                                    <a href="../user_event.jsp">
                                        <div class="img_wrap"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/34402/16503596068380.jpg" style="width: 310.667px; height:206px;"></div>
                                   		<strong></strong>
                                        <span></span>
                                    </a>
                                </div>
                            
                                 <div class="swiper-slide" style="width: 310.667px;  height:206px; margin-right: 24px;">
                                    <a href="../user_event.jsp">
                                        <div class="img_wrap"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/33832/16494048473220.jpg"  style="width: 310.667px; height:206px;"></div>
                                    </a>
                                </div>
                            
                                 <div class="swiper-slide swiper-slide-prev" style="width: 310.667px; margin-right: 24px;">
                                    <a href="../user_event.jsp">
                                        <div class="img_wrap"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/34395/16503452840460.jpg" style="width: 310.667px; height:206px;"></div>
                                    </a>
                                </div>
                            
                                 <div class="swiper-slide swiper-slide-active" style="width: 310.667px; margin-right: 24px;">
                                    <a href="../user_event.jsp">
                                        <div class="img_wrap"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/34314/16492923704320.jpg" style="width: 310.667px; height:206px;"></div>
                                    </a>
                                </div>
                            
                                 <div class="swiper-slide swiper-slide-next" style="width: 310.667px; margin-right: 24px;">
                                    <a href="../user_event.jsp">
                                        <div class="img_wrap"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/34315/16492244738700.jpg" style="width: 310.667px; height:206px;"></div>
                                    </a>
                                </div>
                            
                                 <div class="swiper-slide" style="width: 310.667px; margin-right: 24px;">
                                    <a href="../user_event.jsp">
                                        <div class="img_wrap"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/34328/16493234317960.jpg" style="width: 310.667px; height:206px;"></div>
                                    </a>
                                </div>
                            
                                 <div class="swiper-slide" style="width: 310.667px; margin-right: 24px;">
                                    <a href="../user_event.jsp">
                                        <div class="img_wrap"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/34327/16493233413750.jpg" style="width: 310.667px; height:206px;"></div>
                                    </a>
                                </div>
                            
                                 <div class="swiper-slide" style="width: 310.667px; margin-right: 24px;">
                                    <a href="../user_event.jsp">
                                        <div class="img_wrap"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/34360/16498259914530.jpg" style="width: 310.667px; height:206px;"></div>
                                    	<strong></strong>
                                        <span></span>
                                    </a>
                                </div>
                            
                                 <div class="swiper-slide" style="width: 310.667px; margin-right: 24px;">
                                    <a href="../user_event.jsp">
                                        <div class="img_wrap"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/34359/16498259339710.jpg"style="width: 310.667px; height:206px;"></div>
                                        <strong></strong>
                                        <span></span>
                                    </a>
                                </div>
                            
                       
                        
                    </div>
                    <div class="swiper-button-next" tabindex="0" role="button" aria-label="다음 슬라이드" aria-disabled="false"></div>
                    <div class="swiper-button-prev" tabindex="0" role="button" aria-label="이전 슬라이드" aria-disabled="false"></div>
                    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                </div>
                </div>
            </div>

<script type="text/javascript">

    new Swiper(".event_list", {
        autoplay: {
            delay: 2500,
            disableOnInteraction: false,
        },
        slidesPerView: 3,
        spaceBetween: 24,
        slidesPerGroup: 3,
        loopFillGroupWithBlank: true,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        a11y: {
            prevSlideMessage: '이전 슬라이드',
            nextSlideMessage: '다음 슬라이드',
            slideLabelMessage: '총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.',
        },
    });

    if (eventSwiper.autoplay.running) {
        $('.btn_eventControl').addClass('active');
    }

    $('.btn_eventControl').on({
        click: function (e) {
            if (eventSwiper.autoplay.running) {
                $(this).removeClass('active');
                eventSwiper.autoplay.stop();
            } else {
                $(this).addClass('active');
                eventSwiper.autoplay.start();
            }
        }
    });
</script>

</body>
</html>