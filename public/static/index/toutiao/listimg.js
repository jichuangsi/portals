$('.ListThisimgs .lists ul li span').click(function(){
	$('.ShowBigImgBox').html($(this).html());	
	$('.ShowBigImgBox').fadeIn();
});
$('.ShowBigImgBox').click(function(){
	$('.ShowBigImgBox').fadeOut();								   
});
var firstnum=1;
var listnum=5;
var allnum=$('.ListThisimgs .lists ul li').length;
var move_width=$('.ListThisimgs .lists').width();
var changenum=Math.ceil(allnum/listnum);//向上整除 4/3=2;
//Math.floor(count / pagesize); //向下整除 4/3=1;
if(allnum>listnum){
	$('.ListThisimgs .change').show();
}else{
	$('.ListThisimgs .change').hide();
}
$('.ListThisimgs .prav').click(function(){
	if(allnum>1){
		firstnum--;
		if(firstnum<1){
			firstnum=changenum;	
		}
	}
	change_thisW();
});
$('.ListThisimgs .next').click(function(){
	if(allnum>1){
		firstnum++;
		if(firstnum>changenum){
			firstnum=1;	
		}
	}
	change_thisW();
});
function change_thisW(){
	var change_width=(firstnum-1)*move_width;
	$('.ListThisimgs .lists ul').stop().animate({'left':'-'+change_width+'px'},300);
}