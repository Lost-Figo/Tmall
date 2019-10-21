
window.onload = function(){
	lb();//轮播图程序
	xlb();//小轮播图程序
	tcdhl();//弹出导航 左侧的
	xllb("xl1");//顶条下拉列表1234
	xllb("xl2");
	xllb("xl3");
	xllb("xl4");
	cllb("cedh");//侧拉导航内容程序
	ssk("sss","ssk");//搜索框程序1 2
	ssk("sss2","ssk2");
}
//下拉列表	单个下拉块的

function xllb(id){
	var oId = document.getElementById(id);	
	var oDdd = oId.getElementsByTagName("div")[0];
	oId.onmouseenter = function(){
		oId.className = "libg";
		oDdd.style.display = "block";
		oDdd.style.zIndex = "99";
	}
	oId.onmouseleave = function(){
		oId.className = " ";
		oDdd.style.display = "none";
		oDdd.style.zIndex = "0";
	}
}

//搜索框点击事件    当搜索框中的内容改变的时候需要将框中的文字隐藏 还没写
//新想法：失去焦点时候显示leabl 得到焦点时候隐藏leabl 在input里面写入pac那个属性
function ssk(id1,id2){
	var oform = document.getElementById(id1);
	var otext = document.getElementById(id2);
	var oleb = oform.getElementsByTagName("label")[0];
	var time1 = null;
	otext.onfocus = function(){
		var time1 = setInterval(huoqu,10);
		oleb.style.color = "rgb(204,204,204)";
	}
	otext.onblur = function(){
		clearTimeout(time1);
		oleb.style.display = "block";
		oleb.style.color = "rgb(102,102,102)";
	}
	function huoqu(){
		if(otext.value!=""){
			oleb.style.display = "none";
		}
	}
}

//侧边导航栏	原网页采用了事件委托将事件交给了dl处理省去了for循环	有空改下
function cllb(dhid){
	var oDh = document.getElementById(dhid);	
	var aDdd = oDh.children;
	for (var i=1;i<aDdd.length;i++) {
		aDdd[i].ind = i;						
		aDdd[i].onmouseenter = function(){		
			var index = this.ind;
			oDiv = aDdd[index].children[1];
			oDiv.style.visibility = "visible";
		} 
		aDdd[i].onmouseleave = function(){
			var index = this.ind;
			oDiv = aDdd[index].children[1];
			oDiv.style.visibility = "hidden";
		}
	}
}
//侧边导航栏 jq版 委托事件
//轮播图 透明度 层级 display 三种共同作用
//过程描述：
//当前图层 o:1; z:1 d:b; 一秒后 o:0; z:0; d:n;
//操作图层 o:0; z:0; d:n; 一秒内 o:0-1; z:2; d:b;  一秒后 o:1; z:1; d:b;
var t = null;//定时器命名
var h = null;//定时器命名
var n = 0;//标识位置用
var s = 0;
var q = 0;
function lb(){	
	var lbid = document.getElementById("lb");
	var lbk = lbid.children;//0为轮播图片部分 1为下标部分
	var albdiv = lbk[0].children;//轮播样式设置部分
	var albli = lbk[1].children;//下标样式设置部分
	var num = albdiv.length;
	var timer = null;//下标点击事件结束延时开始执行轮播
	s = n;//计算当前正在显示的图片下标
	n = (n+1)%num;//计算当前应该操作的图片下标
	//下标点击事件---------------------------------------------未写完
    for (var i=0;i<albli.length;i++) {
    	albli[i].ind = i;
    	albli[i].onclick = function(){
    		clearTimeout(timer);
    		clearTimeout(h);
			q = this.ind;
			albli[n].className = " ";
			albli[q].className = "xh-dq";
			albdiv[n].style.display = "none";
			albdiv[q].style.display = "block";
			for (var f=0;f<albli.length;f++) {
				albdiv[f].style.opacity = 1;
				albdiv[f].style.zIndex = 0;
			}
			n = q;
			timer = setInterval(function(){
				
			},1000);//等待一秒后继续开始轮播
			h=setTimeout(lb,2000);
    	}
   }
	//下标样式操作
	albli[s].className = " ";
	albli[n].className = "xh-dq";
//	//控制元素显示隐藏
//	albdiv[s].style.display = "none";
//	albdiv[n].style.display = "block";
	//一秒内操作
	for (var i = 0;i<1000;i++) {
		var op = albdiv[s].style.opacity;
		var op2 = albdiv[n].style.opacity;
		albdiv[s].style.opacity = (Number(op)*1000-1)/1000;
		albdiv[n].style.opacity = (Number(op2)*1000+1)/1000;
	}
	albdiv[n].style.display = "block";
	albdiv[n].style.zIndex = 2;
	albdiv[s].style.display = "none";
	//一秒后操作
	t && clearInterval(t);
	t = setInterval(function(){
		albdiv[s].style.display = "none";
		albdiv[s].style.opacity = 0;
		albdiv[s].style.zIndex = 0;
		albdiv[n].style.zIndex = 1;
		t && clearInterval(t);    
        t = null;
	},1000);
    h && clearTimeout(h);    
    h=setTimeout(lb,2000);
}
// 0-0 1-1 2-0 3-1 4-0 5-1 
//小轮播图
var o = null;
var x = null;
var y = null;
var xn = 0;
var f = 0;
var xs = 0;
function xlb(){
//	获得小轮播的大图片属性
	var odaimg = document.getElementsByClassName("xlb-datu")[0];
	var daimg = odaimg.getElementsByTagName("img")[0];
	var aximg = document.getElementsByClassName("xlb-tb");
	var ljt = document.getElementsByClassName("xlb-ljt")[0];
	var rjt = document.getElementsByClassName("xlb-rjt")[0];
	var xlbxtp = document.getElementsByClassName("xlb-xu-ctn")[0];
	var xlbyr = document.getElementsByClassName("xlb-xt-live");
	//左右箭头点击事件
	ljt.onclick = function(){
		clearInterval(o);
		xlbxtp.style.marginLeft = "0px";
		xn = 5;
		o = setInterval(xlb,2000);
	}
	rjt.onclick = function(){
		clearInterval(o);
		xlbxtp.style.marginLeft = "-492px";
		xn = 2;
		o = setInterval(xlb,2000);
	}
	//根据下标显示当前需要显示的图片
	xn = (xn + 1)%6;
	daimg.src = "img/"+ xn +".jpg_.webp";
	for(var i =1;i<aximg.length;i++){
		aximg[i].style.display = "none";
	}
	xs = xn;
	xs = (xs + 1)%7;
	aximg[xs].style.display = "block";
	//判断当前下标的位置控制左右箭头的显示和隐藏
	//控制当前小图显示区域
	if (xn<3) {
		if(xn==0){
			clearInterval(x);
			clearInterval(y);
			x = setInterval(xlbjtr,1);
		}
		ljt.className = "xlb-jt xlb-ljt yincang";
		rjt.className = "xlb-jt xlb-rjt";
	} else if(xn>=3){
		if(xn==3){
			clearInterval(x);
			clearInterval(y);
			y = setInterval(xlbjtl,1);
		}
		ljt.className = "xlb-jt xlb-ljt";
		rjt.className = "xlb-jt xlb-rjt yincang";
	}
	//鼠标移入事件
	for (var i=0;i<xlbyr.length;i++) {
		xlbyr[i].ind = i;
		xlbyr[i].onmouseenter = function(){
			clearInterval(o);
			xn = this.ind;
			daimg.src = "img/"+ xn +".jpg_.webp";
			xs = xn;
			xs = (xs + 1)%7;
			for(var i =1;i<aximg.length;i++){
				aximg[i].style.display = "none";
			}
			aximg[xs].style.display = "block";
			setInterval(function(){
				//延时一秒后继续开始轮播
			},1000)
			o = setInterval(xlb,2000);
		}
	}
//小图片移动程序
function xlbjtl(){
	if(f<492){
		f = f + 2;//控制小图片的运动速度
		xlbxtp.style.marginLeft = "-"+f+"px";
	}
}
//小图片移动程序
function xlbjtr(){
	if(f>0){
		f = f - 2;//控制小图片的运动速度
		xlbxtp.style.marginLeft = "-"+f+"px";
	}
}
//定义大图轮播定时器
	o && clearInterval(o);
	o = setInterval(xlb,3000);
}

//天猫左侧弹出导航栏
var tcdht = null;
//弹出导航的time
var hddbt = null;
//回到顶部的time
function tcdhl(){
	var dhtime1 = null;
	clearInterval(tcdht);
	var ospdh = document.getElementById("fldh-nr");
	var obody = document.getElementsByTagName("body")[0];
	//第一个子节点为ul  第二个子节点为回到顶部
	var aspdhnr = ospdh.children;
	var aspdhdd = aspdhnr[0].getElementsByTagName("dd");
	var hddb = aspdhnr[1];
	
	//整个固定左侧导航的看出效果
	if (obody.scrollTop>=500) {	
		ospdh.style.opacity = "1";
		ospdh.style.width = "36px";
		ospdh.style.height = "333px";
	} else{
		ospdh.style.opacity = "0";
		ospdh.style.width = "0px";
		ospdh.style.height = "0px";
	}
	//滑动到选定内容部分
	function huadong(dao){
		clearInterval(hddbt);
		hddbt = setInterval(function(){
			if(obody.scrollTop==dao){
				clearInterval(hddbt);
			}else if(obody.scrollTop>dao) {
				obody.scrollTop = obody.scrollTop -100;
			}else{
				obody.scrollTop = obody.scrollTop +100;
			}
			
		},30);
	}
	//滑动到选定内容部分
	for(var i=0;i<aspdhdd.length;i++) {
		aspdhdd[i].ind = i;
		aspdhdd[i].onclick = function(){
			var indx = this.ind;
			switch(indx){
				case 0: huadong(1000);break;
				case 1: huadong(2000);break;
				case 2: huadong(3000);break;
				case 3: huadong(4000);break;
				case 4: huadong(5000);break;
				case 5: huadong(6000);break;
			}
		}
		aspdhdd[i].onmouseenter = function(){
			var indx = this.ind;
			aspdhdd[indx].style.backgroundColor = randomColor();
		}
		aspdhdd[i].onmouseleave = function(){
			var indx = this.ind;
			aspdhdd[indx].style.backgroundColor = "rgba(0,0,0,.6)";
		}
	}
	//回到顶部
	hddb.onclick = function(){
		huadong(0);
	}
//	console.log(obody.scrollTop);
	//定义定时器
	tcdht = setInterval(tcdhl,20);
}

//顶部红色搜索框弹出
(function(){
	var stime = null;
	
	stime = setInterval(function(){
		var sbody = document.getElementsByTagName("body")[0];
		var hsou = document.getElementsByClassName("hong-sou")[0];
		if (sbody.scrollTop>=500) {
			hsou.style.height = "50px";
		} else{
			hsou.style.height = "0px";
		}
	},30);
	
})();

// 随机颜色
function randomColor(){
	var str = "1234567890abcdef";
	var color="#";
	for(var i = 0;i<6;i++){
		var num=parseInt(Math.random()*str.length);
		color=color+str.charAt(num);
	}
	return color;
}