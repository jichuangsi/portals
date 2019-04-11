var roll_width3=$('.ShowRollPicBox3 .width').val();
var roll_height3=$('.ShowRollPicBox3 .height').val();
if(roll_width3>0){
	$('.ShowRollPicBox3').css({'width':roll_width3+'px'});	
}else{
	$('.ShowRollPicBox3').css({'width':'100%'});	
}
if(roll_height3>0){
	$('.ShowRollPicBox3').css({'height':roll_height3+'px'});	
}else{
	$('.ShowRollPicBox3').css({'height':'100px'});	
}
var roll_nums3=$('.ShowRollPicBox3 .bigimg li').length;
if(roll_nums3<1){
	$('.ShowRollPicBox3').fadeOut();	
}
var ListTitle3="<ul class='ListTitle'>";
$('.ShowRollPicBox3 .bigimg li').each(function(){
	var thistitle=$(this).find('a').attr('title');
	ListTitle3+="<li><span>"+thistitle+"</span></li>";
});
ListTitle3+="</ul>";
$('.ShowRollPicBox3').append(ListTitle3);
$('.ShowRollPicBox3').append("<div class='pages'><span class='now'></span>/<span class='all'>"+roll_nums3+"</span></div>");
$('.ShowRollPicBox3').append("<ul class='changeShow'><ol onclick='parv_changSlide3()'></ol><li onclick='next_changSlide3()'></li></ul>");
var beginnum3=0;
function changSlide3(num){
	$('.ShowRollPicBox3 .bigimg li').css({'opacity':0,'left':'100%'});
	$('.ShowRollPicBox3 .bigimg li').eq(num).css({'opacity':1});
	$('.ShowRollPicBox3 .bigimg li').eq(num).stop().animate({'left':'0px'},300);	
	$('.ShowRollPicBox3 .ListTitle li').hide();
	$('.ShowRollPicBox3 .ListTitle li').eq(num).show();
	var nownum=num+1;
	$('.ShowRollPicBox3 .pages .now').html(nownum);
}
function parv_changSlide3(){
	beginnum3--;
	if(beginnum3<0){
		beginnum3=roll_nums3-1;
	}
	$('.ShowRollPicBox3 .bigimg li').css({'opacity':0,'left':'-100%'});
	$('.ShowRollPicBox3 .bigimg li').eq(beginnum3).css({'opacity':1});
	$('.ShowRollPicBox3 .bigimg li').eq(beginnum3).stop().animate({'left':'0px'},300);	
	$('.ShowRollPicBox3 .ListTitle li').hide();
	$('.ShowRollPicBox3 .ListTitle li').eq(beginnum3).show();
	var nownum=beginnum3+1;
	$('.ShowRollPicBox3 .pages .now').html(nownum);
}
function next_changSlide3(){
	beginnum3++;
	if(beginnum3>roll_nums3-1){
		beginnum3=0;
	}
	changSlide3(beginnum3);
}
changSlide3(beginnum3);
var slideing3;
function autoSlide3(){
	slideing3 = setInterval("next_changSlide3()",5000);
}
function stopSlide3() {
	clearInterval(slideing3);
}
autoSlide3();
$('.ShowRollPicBox3').hover(
	function(){
		stopSlide3();
	},
	function(){
		autoSlide3();
	}
);