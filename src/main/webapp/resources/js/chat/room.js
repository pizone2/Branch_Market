var ws;
var messages = document.getElementById("messages");
const roomNum = location.href.substring(location.href.lastIndexOf('/') + 1);
console.log(roomNum);

openSocket();

function openSocket(){
	if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
		writeResponse("WebSocket is already opened.");
		return;
	}
	//웹소켓 객체 만드는 코드
	ws = new WebSocket("ws://localhost:80/echo.do/" + roomNum);
	
	// 소켓이 처음 열렸을때 작동하는 코드
	ws.onopen = function(event){
		if(event.data === undefined){
			return;
		}
		writeResponse(event.data);
	};
	
	// 메세지를 서버에서 받았을때 작동
	ws.onmessage = function(event){
		let resContents = event.data;
		writeResponse(resContents);
		$.ajax({
			url:'/chat/updateMemberRead',
			type:'post',
			data:{
				'roomNum':roomNum
			},
			success:(res)=>{

			}
		})
	};
	
	ws.onclose = function(event){
		writeResponse("<br> 대화 종료");
		location.href = "./myRoomList";
	}
}

function send(){
	let contents =  $("#messageinput").val();
	$("#messageinput").val("");
	var text = roomNum + "," + contents +","+ $("#sender").val();

	$.ajax({
		async:false,
		url:"/chat/messageAdd",
		type:"post",
		data:{
			'roomNum':roomNum,
			'contents':contents,
		},
		success:(response)=>{
			
		}
	})

	ws.send(text);

}

function closeSocket(){
	ws.close();
	$.ajax({
		url:"/chat/quitRoom",
		type:"post",
		data:{
			'roomNum':roomNum
		},
		success:(response)=>{
			
		}
	})
	location.href="../myRoomList";
}

function writeResponse(text){
	messages.innerHTML += text + "<br/>";
}

function clearText(){
	$('#messages').html("");
	$.ajax({
		url:'/chat/delRecordMessage',
		type:'post',
		data:{
			'roomNum':roomNum
		},
		success:(res)=>{

		}
	})
}

$('#modalSubmitBtn').click(()=>{
	$.ajax({
		url:'/chat/memberInviteRoom',
		type:'post',
		data:{
			'roomNum':roomNum,
			'memberId':$('#inviteMemberText').val()
		},
		success:(res)=>{
			
		}
	})

	$('#inviteMemberText').val("");
	$('#modalCloseBtn').click();
})

