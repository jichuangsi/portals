var nowSlideList=0;
var slideimgnum=$('.SlideBox .slideimgs ul li').length;
if(slideimgnum>0){
	var listnum="<ul class='listnum'>";	
	for(var i=0;i<slideimgnum;i++){
		listnum+="<li>"+i+"</li>";	
	}
	listnum+="</ul>";
	$('.SlideBox').append(listnum);
}
change_slide(nowSlideList,slideimgnum-1);
function change_slide(nownum,lastnum){
	$('.SlideBox .slideimgs ul li').css({'z-index':'0','left':'0'});
	$('.SlideBox .slideimgs ul li').eq(lastnum).css({'z-index':'1'});
	$('.SlideBox .slideimgs ul li').eq(nownum).css({'z-index':'2','left':'-100%'});
	$('.SlideBox .slideimgs ul li').eq(nownum).animate({'left':'0'},300);
	$('.SlideBox .listnum li').removeClass('ck');
	$('.SlideBox .listnum li').eq(nownum).addClass('ck');
	$('.SlideBox .listtitle li').hide();
	$('.SlideBox .listtitle li').eq(nownum).show();
}
function nextShowImg(){
	stopPlays();
	nowSlideList++;
	if(nowSlideList>=slideimgnum){
		nowSlideList=0;
	}
	var lastnum=nowSlideList-1;
	if(lastnum<0){
		lastnum=slideimgnum-1;
	}
	change_slide(nowSlideList,lastnum);	
	autoPlays();
}
function prevShowImg(){
	stopPlays();
	nowSlideList--;
	if(nowSlideList<0){
		nowSlideList=slideimgnum-1;
	}
	var lastnum=nowSlideList+1;
	if(lastnum>=slideimgnum){
		lastnum=0;
	}
	$('.SlideBox .slideimgs ul li').css({'z-index':'0','left':'0'});
	$('.SlideBox .slideimgs ul li').eq(lastnum).css({'z-index':'1'});
	$('.SlideBox .slideimgs ul li').eq(nowSlideList).css({'z-index':'2','left':'100%'});
	$('.SlideBox .slideimgs ul li').eq(nowSlideList).animate({'left':'0'},300);
	$('.SlideBox .listnum li').removeClass('ck');
	$('.SlideBox .listnum li').eq(nowSlideList).addClass('ck');
	$('.SlideBox .listtitle li').hide();
	$('.SlideBox .listtitle li').eq(nowSlideList).show();
	autoPlays();
}
$('.SlideBox .listnum li').click(function(){
	stopPlays();
	nowSlideList=$(this).index();	
	var lastnum=nowSlideList-1;
	if(lastnum<0){
		lastnum=slideimgnum-1;
	}
	change_slide(nowSlideList,lastnum);
	autoPlays();
})
$(function() {
	$(".SlideBox .slideimgs ul li").swipe({
		swipe:function(event, direction, distance, duration, fingerCount){
			if(direction=='left'){
				nextShowImg();
			}
			else if(direction=='right'){
				prevShowImg();
			}
		},
		click:function(){
			ShowBigImg();
		},
	});
});
function ShowBigImg(){
	var thisurl=$('.SlideBox .slideimgs ul li').eq(nowSlideList).find('img').attr("alt");	
	window.location.href=thisurl;
}
var timers;
function autoPlays(){
	timers = setInterval("nextShowImg()",3000);
}
function stopPlays() {
	clearInterval(timers);
}
$(".SlideBox").hover(
	function(){
		stopPlays();	
	},	
	function(){
		autoPlays();
	}
);
autoPlays();