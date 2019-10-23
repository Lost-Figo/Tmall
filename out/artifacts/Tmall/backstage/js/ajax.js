/**
 * @author 汪洋
 * @param json对象，里面包含4个键值对，分别是：
 * 		1.url 
 * 		2.type -- get 还是 post 
 * 		3.data -- 前端给后端传递的参数(前端传递的时候,以"对象"的形式) 
 * 		4.回调函数 -- success 
 * 		5.回调函数 -- error
 * 例如：
 * 		$ajax({
  				url:"ajax.do",
  				type:"get",
  				data:{
  					username:"zhangsan",
  					password:123456
  				},
  				success:function(data){
  					alert(data);
  				},
  				error:function(error){
  					alert(error);
  				}
  			});
  		注意：
  			1、所有的key都不需要加双引号；
  			2、data属性是的值是一个json对象，里面放的内容只要符合json语法，都随意放；
  			3、success回调函数里面，我设置了如果发送的是普通消息一定要带上msg标识符，如果不带，则会被默认为json字符串；
  			4、success回调函数里面，如果返回来的不是msg的话，就是json字符串，在该回调里面，已经默认把该json字符串转成了json对象
  			，所以在使用该data的时候一定要注意类型；
  			5、success和error回调函数中，data和error分别为后台发送回来的内容及错误信息；
  		请仔细查看源代码！若看不懂，至少你要会用，如果你不会用，那还是老老实实去使用原生态的ajax吧！
  		@版权所有 仅适用于1809班！
 */
function $ajax(obj){
	// 做网络请求的时候,参数以"对象"的形式传递进来
	// 规定: obj是一个json对象，里面包含属性:
	
	//获取到ajax对象
	var ajaxObj = null;
	if (window.XMLHttpRequest) {
		ajaxObj = new XMLHttpRequest();
	} else {
		ajaxObj = new ActiveObject("Microsoft.XMLHTTP");
	}
	// 检测状态的变化
	ajaxObj.onreadystatechange = function() {
		if (ajaxObj.readyState == 4) {
			if (ajaxObj.status >= 200 && ajaxObj.status < 300
					|| ajaxObj.status == 304) {
				//成功获取到后台传输过来的数据并且绑定到success中
				if (obj.success) {
					//如果是普通的消息，请在数据上加一个msg标识符
					if(ajaxObj.responseText.indexOf("msg")>=0){
						obj.success(ajaxObj.responseText);
					//如果是json的消息，不需要任何操作
					}else{
						//调用success回调函数，并且把后台发送来的数据进行json解析
						obj.success(JSON.parse(ajaxObj.responseText));
					}
				} else {
					alert("您忘记了 success 函数");
				}
			} else {
				if (obj.error) {
					obj.error(ajaxObj.status);
				} else {
					alert("您忘记了 error 函数");
				}
			}
		}
	}
	//如果没写type，默认为get
	var type = obj.type || "get";
	// type 转化为小写
	type = type.toLowerCase();
	// 判断是否传递了参数
	//定义一个params变量
	var params = "";
	//按照我们定义的格式来解析你传输的参数，解析完成之后再进行字符串的拼接
	if (obj.data) {
		for ( var key in obj.data) {
			params += (key + "=" + obj.data[key] + "&");
		}
		//处理字符串最后的&符号
		params = params.slice(0, params.length - 1);
	}
	//判断请求如果是get的话，发送ajax的get方式的请求
	if (type == "get") {
		ajaxObj.open(type, obj.url + "?" + params, true);
		ajaxObj.send(null);
	//判断如果请求是post的话，发送ajax的post方式的请求
	} else {
		ajaxObj.open(type, obj.url, true);
		ajaxObj.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		ajaxObj.send(params);
	}
}