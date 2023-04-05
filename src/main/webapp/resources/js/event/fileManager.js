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
$(document).on('click','.fileDel',(e)=>{
console.log('del 1')
    let fileIndex = $(e.target).attr('data-fileIndex');
    $('#file' + fileIndex).remove();
    fileCnt--;
})
$(document).on('click','.fileDbDel',(e)=>{
console.log('del 2')
    console.log(e.target);
    let fileIndex = $(e.target).attr('data-fileIndex');
    $('#file' + fileIndex).remove();
    let eventNum = $(e.target).attr('data-eventNum');
    let fileName = $(e.target).attr('data-fileName');
    $.ajax({
        url:'/event/delete',
        type:'post',
        data:{
            'eventNum':eventNum,
            'fileName':fileName
        },
        success:(res)=>{
            console.log(res);
            fileCnt--;
            window.location.reload();
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
    
    
    form.append("multipartFile", $('#updateFile')[0].files[0]); // 파일 정보 추가
    form.append("eventNum", parseInt($(this).attr('data-eventNum')));
    
 
    
    fetch('../event/update', {
        method: 'POST',
        body: form
    })
    .then(response => {
        console.log(response);
        $('#ModalImageUpdateForm').modal('hide'); // 모달 닫기
    	window.location.reload(); // 페이지 새로고침
    })
    .catch(error => {
        console.error(error);
    });
    });
});




