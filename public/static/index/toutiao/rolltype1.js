var roll_width1=$('.ShowRollPicBox1 .width').val();
var roll_height1=$('.ShowRollPicBox1 .height').val();
if(roll_width1>0){
	$('.ShowRollPicBox1').css({'width':roll_width1+'px'});	
}else{
	$('.ShowRollPicBox1').css({'width':'100%'});	
}
if(roll_height1>0){
	$('.ShowRollPicBox1').css({'height':roll_height1+'px'});	
}else{
	$('.ShowRollPicBox1').css({'height':'100px'});	
}
var roll_nums1=$('.ShowRollPicBox1 .bigimg li').length;
if(roll_nums1<1){
	$('.ShowRollPicBox1').fadeOut();	
}
var ListTitle1="<ul class='ListTitle'>";
var ListNum1="<ul class='ListNum'>";
var showNum1=0;
$('.ShowRollPicBox1 .bigimg li').each(function(){
	showNum1++;
	var thistitle=$(this).find('a').attr('title');
	ListTitle1+="<li><span>"+thistitle+"</span></li>";
	ListNum1+="<li><span>"+showNum1+"</span></li>";
});
ListTitle1+="</ul>";
ListNum1+="</ul>";
$('.ShowRollPicBox1').append(ListTitle1);
$('.ShowRollPicBox1').append(ListNum1);
var beginnum1=0;
function changSlide1(num){
	$('.ShowRollPicBox1 .bigimg li').css({'opacity':0,'left':'100%'});
	$('.ShowRollPicBox1 .bigimg li').eq(num).css({'opacity':1});
	$('.ShowRollPicBox1 .bigimg li').eq(num).stop().animate({'left':'0px'},300);
	$('.ShowRollPicBox1 .ListNum li').removeClass('ck');
	$('.ShowRollPicBox1 .ListNum li').eq(num).addClass('ck');
	$('.ShowRollPicBox1 .ListTitle li').hide();
	$('.ShowRollPicBox1 .ListTitle li').eq(num).show();
}
function next_changSlide1(){
	beginnum1++;
	if(beginnum1>roll_nums1-1){
		beginnum1=0;
	}
	changSlide1(beginnum1);
}
changSlide1(beginnum1);
var slideing1;
function autoSlide1(){
	slideing1 = setInterval("next_changSlide1()",5000);
}
function stopSlide1() {
	clearInterval(slideing1);
}
autoSlide1();
$('.ShowRollPicBox1').hover(
	function(){
		stopSlide1();
	},
	function(){
		autoSlide1();
	}
);
$('.ShowRollPicBox1 .ListNum li').click(function(){
	beginnum1=$(this).index();
	changSlide1(beginnum1);
});