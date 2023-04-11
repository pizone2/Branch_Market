const fileAdd=document.getElementById("fileAdd");
const filelist = document.getElementById("filelist");
let count=0;
let max=5;
let param="multipartFiles";
let idx = 0;

function setParam(p){
    param=p;
}

function setMax(m){
    max=m;
}

function setCount(c){
    count=c;
}
function setIdx(c){
    idx = c;
}

$('#existFile').on('click','.dels',function(){
    let fileNum = $(this).attr('data-fileNum');
    let result = confirm("파일이 영구히 삭제됩니다!");
    if(result){
        $.ajax({
            type:'POST',
            url:'./boardImgDelete',
            data:{
                fileNum:fileNum //속성명:변수명
            },
            success:function(responces){
                if(responces.trim()>0){
                    alert("삭제되었습니다");
                    $('#existFile' + fileNum).remove();
                }else{
                    alert("삭제 실패<br> 관리자에게 문의 요망");
                }
                count--;
            },
            error:function(){

            }
        })
    }
})

$('#addFile').on('click','.dels',function(){
    let idx = $(this).attr('data-fileNum');
    $('#addFile' + idx).remove();
    count--;
})


$("#filelist").on("click",".dels",function(e){
    $(this).parent().remove();
    count--;
})



$("#fileAdd").click(()=>{
    if(count>=max){
        alert("파일 추가는 최대 "+max+"개까지 업로드 가능합니다.");
        return ;
    }
    else{
        let child = '<div class="input-group mb-3" id="addFile'+idx+'">'
            child = child+'<input type="file" class="form-control" name="'+param+'">'
            child = child+'<button type="button" class="btn btn-outline-primary dels" data-fileNum="'+idx+'">X</button>'
            child = child + '</div>'

        $("#addFile").append(child);
        count++;
        idx++;
    }

})

