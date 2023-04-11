$(".enterChatBtn").click(function (e) {
    console.log(e.target);
    console.log(this);
	$('#sidebar_secondary').addClass('popup-box-on');
    let roomNum = $(this).attr('data-roomNum');
    $('#datas').attr('data-roomNum',roomNum);
    // 메세지 불러오기
    $.ajax({
        url:'/chat/getRoomMessageList',
        type:'post',
        data:{
            'roomNum':roomNum
        },
        success:(res)=>{
            res = res.trim();
            $('#messageList').html(res);
        }
    })
    $('#unread' + roomNum).remove();
    updateMemberRead(roomNum);
    
    // 웹 소켓 연결하기
    openSocket(roomNum);
});
$('.quitChatBtn').click(function(e){
    let roomNum = $(this).attr('data-roomNum');
    $.ajax({
        url:"/chat/quitRoom",
        type:"post",
        data:{
            'roomNum':roomNum
        },
        success:(res)=>{
            console.log(res);
        }
    })
    $('#chatList' + roomNum).remove();
})

$("#removeClass").click(function () {
	$('#sidebar_secondary').removeClass('popup-box-on');
    // 메세지 불러온거 지우기
    $('#messageList').html('');
});

let ws;

function openSocket(roomNum){
	if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
		return;
	}
	//웹소켓 객체 만드는 코드
	ws = new WebSocket("ws://localhost:80/echo.do/" + roomNum);
	
	// 소켓이 처음 열렸을때 작동하는 코드
	ws.onopen = function(event){
		if(event.data === undefined){
			return;
		}
	};
	
	// 메세지를 서버에서 받았을때 작동
	ws.onmessage = function(event){
        let spliteIndex = event.data.indexOf(',');
        let state = event.data.substring(0,spliteIndex);
        let contents = event.data.substring(spliteIndex + 1);
        console.log(event.data);

        let chat_message_right = '';
        if(state == 0){
            chat_message_right = 'chat_message_right';
        }else if(state == 1){
            chat_message_right = '';
        }
        let date = new Date();
		writeResponse(chat_message_right,contents,date);
		updateMemberRead(roomNum);

        if(contents.length > 40){
            contents = contents.substring(0,40);
            contents+="...";
        }
        $('#contents' + roomNum).html(contents);
	};
	
	ws.onclose = function(event){
		location.href = "./myRoomList";
	}
}

function writeResponse(contents){
    $('#messageList').append(contents)
}
function writeResponse(chat_message_right,contents,date){
	$('#messageList').append(
        '<div class="chat_message_wrapper ' + chat_message_right + '">' +
        '<div class="chat_user_avatar">' +
            '<a href="#" target="_blank">' +
                '<img alt="Gurdeep Osahan (Web Designer)" title="Gurdeep Osahan (Web Designer)"' +
                    'src="https://cdn-icons-png.flaticon.com/512/5580/5580909.png" class="md-user-image">' +
            '</a>' +
        '</div>' +
            '<ul class="chat_message">' +
            '<li>' +
                    '<p>'+contents+ '</p>' +
                '</li>' +
            '<li>' +
                    '<p><span class="chat_message_time">'+((date.getHours() + 3) % 12 || 12)+':'+date.getMinutes() +'</span> </p>' +
                '</li>' +
            '</ul>' +
        '</div>'
    )
}
function send(){
    let contents =  $("#submit_message").val();
    let roomNum = $('#datas').attr('data-roomNum');

	$("#submit_message").val("");
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
function pressEnter(event){
    console.log(event);
    if(event.keyCode == 13){
        send();
    }
}
function updateMemberRead(roomNum){
    $.ajax({
        url:'/chat/updateMemberRead',
        type:'post',
        data:{
            'roomNum':roomNum
        },
        success:(res)=>{

        }
    })
}