function xinwenclick(obj,id){
//		localStorage.clear();
		if(localStorage.getItem("ss2") != null){
			 var asd=JSON.parse(localStorage.getItem("ss2"));
			 if(asd.length>=50){
			 	asd.splice(0,1)
			 }
			 for(var i=0;i<asd.length;i++){
			 	if(asd[i].key == id){
			 		asd.splice(i,1)
			 	}
			 }
			 var news={};
			 news["key"]=id;
			 news["val"]=obj.outerHTML;
			 asd.push(news);
			 localStorage.setItem('ss2',JSON.stringify(asd));
		}else{
			asd=[];
			var news={};
			news["key"]=id;
			news["val"]=obj.outerHTML;
			asd.push(news);
			localStorage.setItem('ss2',JSON.stringify(asd));
		}
}
