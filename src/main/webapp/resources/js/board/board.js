let updatebtn = document.getElementById("updatebtn")
$("updatebtn").click(function () {

    
})
//-------------------------------------------------------
let boardNum = $('#datas').attr('data-boardNum');
let roomNum;
let ws;
const sendId = $('#datas').attr('data-sendId');
const receiveId = $('#datas').attr('data-receiveId');

function getCommentsList() {
    $.ajax({
        url: '/comments/list',
        type: 'get',
        data: {
            'boardNum': boardNum
        },
        success: (response) => {
            response = response.trim();
            $('#commentsList').html(response);
        }
    })
}
getCommentsList();

// --------------------------------------------------------
const picAdd = document.getElementById("picAdd");
const picDelete = document.getElementById("picDelete");

$("#picAdd").click(function () {
    fetch("../board/picAdd", {
        method: 'POST',
        headers: { "Content-type": "application/x-www-form-urlencoded" },
        body: "boardNum=" + boardNum
    }).then((response) => response.text())
        .then((res) => {
            console.log(res.trim());
            if (res.trim() == 1) {
                alert('상품이 Pic되었습니다!');
            }
        })
})
$('#picDelete').click(() => {
    fetch('../board/picDelete', {
        method: 'POST',
        headers: { "Content-type": "application/x-www-form-urlencoded" },
        body: "boardNum=" + boardNum
    }).then((response) => {
        return response.text();
    }).then((res) => {
        if (res.trim() == 1) {
            alert('상품 pic 취소');
        }
    })
})

$('#chatBtn').click(() => {
    // 방 만들기
    $.ajax({
        async: false,
        url: '/chat/oneToOneChat',
        type: 'post',
        data: {
            'sendId': sendId,
            'receiveId': receiveId
        },
        success: (res) => {
            res = res.trim();
            roomNum = res;
        }
    })

    // 팝업창 띄우기
    $('#sidebar_secondary').addClass('popup-box-on');

    // 메세지 불러오기
    $.ajax({
        url: '/chat/getRoomMessageList',
        type: 'post',
        data: {
            'roomNum': roomNum
        },
        success: (res) => {
            res = res.trim();
            $('#messageList').html(res);
        }
    })
    openSocket(roomNum);


})
$("#removeClass").click(function () {
    $('#sidebar_secondary').removeClass('popup-box-on');
    // 메세지 불러온거 지우기
    $('#messageList').html('');
});

function writeResponse(chat_message_right, contents, date) {
    $('#messageList').append(
        '<div class="chat_message_wrapper ' + chat_message_right + '">' +
        '<div class="chat_user_avatar">' +
        '<a href="https://web.facebook.com/iamgurdeeposahan" target="_blank">' +
        '<img alt="Gurdeep Osahan (Web Designer)" title="Gurdeep Osahan (Web Designer)"' +
        'src="https://cdn-icons-png.flaticon.com/512/5580/5580909.png" class="md-user-image">' +
        '</a>' +
        '</div>' +
        '<ul class="chat_message">' +
        '<li>' +
        '<p>' + contents + '</p>' +
        '</li>' +
        '<li>' +
        '<p><span class="chat_message_time">' + ((date.getHours() + 3) % 12 || 12) + ':' + date.getMinutes() + '</span> </p>' +
        '</li>' +
        '</ul>' +
        '</div>'
    )
}
function send() {
    let contents = $("#submit_message").val();
    $("#submit_message").val("");

    var text = roomNum + "," + contents + "," + sendId;

    $.ajax({
        async: false,
        url: "/chat/messageAdd",
        type: "post",
        data: {
            'roomNum': roomNum,
            'contents': contents,
        },
        success: (response) => {

        }
    })

    ws.send(text);
}
function openSocket(roomNum) {
    if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
        return;
    }
    //웹소켓 객체 만드는 코드
    ws = new WebSocket("ws://localhost:80/echo.do/" + roomNum);

    // 소켓이 처음 열렸을때 작동하는 코드
    ws.onopen = function (event) {
        if (event.data === undefined) {
            return;
        }
    };

    // 메세지를 서버에서 받았을때 작동
    ws.onmessage = function (event) {
        let spliteIndex = event.data.indexOf(',');
        let state = event.data.substring(0, spliteIndex);
        let contents = event.data.substring(spliteIndex + 1);
        console.log(event.data);

        let chat_message_right = '';
        if (state == 0) {
            chat_message_right = 'chat_message_right';
        } else if (state == 1) {
            chat_message_right = '';
        }
        let date = new Date();
        writeResponse(chat_message_right, contents, date);
        $.ajax({
            url: '/chat/updateMemberRead',
            type: 'post',
            data: {
                'roomNum': roomNum
            },
            success: (res) => {

            }
        })
    };

    ws.onclose = function (event) {
        location.href = "./myRoomList";
    }
}

function pressEnter(event) {
    if (event.keyCode == 13) {
        send();
    }
}