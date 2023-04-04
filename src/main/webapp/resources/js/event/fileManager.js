let fileCnt = 0;
let maxFileCnt = 5;
let fileIndex = 0;
$('#fileAddBtn').click((e)=>{
    if(fileCnt >= maxFileCnt){
        alert('파일은 최대 ' + maxFileCnt + '개 까지 입니다.');
    }
    else{
        fileIndex++;
        fileCnt++;
        let element = '<div id="file' + fileIndex + '">' + 
                        '<input type="file" name="multipartFiles">' +
                        '<button class="fileDel" data-fileIndex=' + fileIndex  + '>X</button><br>' +
                        '</div>';
        $('#fileAddList').append(element);
    }
})
$('#fileAddList').on('click','.fileDel',(e)=>{
    let fileIndex = $(e.target).attr('data-fileIndex');
    $('#file' + fileIndex).remove();
    fileCnt--;
})
$('#fileAddList').on('click','.fileDbDel',(e)=>{
    console.log(e.target);
    let fileIndex = $(e.target).attr('data-fileIndex');
    $('#file' + fileIndex).remove();
    let eventNum = $(e.target).attr('data-eventNum');
    $.ajax({
        url:'/event/delete',
        type:'post',
        data:{
            'eventNum':eventNum
        },
        success:(res)=>{
            console.log(res);
            fileCnt--;
        }
    })
})

function setFileIndex(num){
    fileIndex = num;
    fileCnt = num;
}


 $(".update").on("click", function(e) {
        console.log("UPDATE ON CLICK");
        let num = $(this).attr("data-eventNum");
        $("#eventConfirm").attr("data-eventNum", num);
    
        $("#eventConfirm").off("click").on("click", function() {
        console.log('수정버튼');
    
        let form = new FormData();
		form.append("fileName", $('input[type=file]')[0].files[0]); // 파일 정보 추가
		form.append("eventNum", $(this).attr('data-eventNum'));
		
		fetch('../event/update', {
		    method: 'POST',
		    body: form
		})
		.then(response => {
		    console.log(response);
		})
		.catch(error => {
		    console.error(error);
		});
        });
    });



