var ws;
var messages = document.getElementById("messages");
const roomNum = new URL(location.href).searchParams.get('roomNum');

openSocket();
function openSocket(){
	if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
		writeResponse("WebSocket is already opened.");
		return;
	}
	//웹소켓 객체 만드는 코드
	ws = new WebSocket("ws://192.168.0.19:80/echo.do");
	
	ws.onopen = function(event){
		if(event.data === undefined){
			return;
		}
		//writeResponse(event.data);
	};
	
	// 메세지를 서버에서 받았을때 작동
	ws.onmessage = function(event){
		let divIndex = event.data.indexOf(',');
		let resRoomNum = event.data.substr(0,divIndex);
		let resContents = event.data.substr(divIndex + 1);

		if(resRoomNum == roomNum){
			writeResponse(resContents);
		}
	};
	
	ws.onclose = function(event){
		writeResponse("대화 종료");
	}
	
}

function send(){
	let contents =  $("#messageinput").val();
	// var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
	var text = roomNum + "," + contents +","+ $("#sender").val();
	ws.send(text);
	text = "";

	$.ajax({
		url:"/chat/messageAdd",
		type:"post",
		data:{
			'roomNum':roomNum,
			'contents':contents,
		},
		success:(response)=>{
			console.log(response);
		}
	})
}

function closeSocket(){
	ws.close();
}

function writeResponse(text){
	messages.innerHTML += text + "<br/>";
}

function clearText(){
	messages.parentNode.removeChild(messages)
}
