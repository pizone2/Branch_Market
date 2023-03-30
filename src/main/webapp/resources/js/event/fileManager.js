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