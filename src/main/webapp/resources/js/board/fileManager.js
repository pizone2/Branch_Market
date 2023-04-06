const fileAdd=document.getElementById("fileAdd");
const filelist = document.getElementById("filelist");
let count=0;
let max=5;
let param="multipartFile";
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

$(".deleteCheck").click(function(){
    let result = confirm("파일이 영구히 삭제됩니다!");
    let ch = $(this);
    if(result){
        let fileNum = $(this).val();
        $.ajax({
            type:'POST',
            url:'./boardFileDelete',
            data:{
                fileNum:fileNum //속성명:변수명
            },
            success:function(responces){
                if(responces.trim()>0){
                    alert("삭제되었습니다");
                    //this : ajax 객체 자기 자신
                    console.log(ch)
                    ch.parent().parent().remove();
                    count--;
                }else{
                    alert("삭제 실패<br> 관리자에게 문의 요망");
                }
            },
            error:function(){

            }
        })

       

    }else{
        $(this).prop('checked',false);
    }
    
})


$("#filelist").on("click",".dels",function(e){
    $(this).parent().remove();
    count--;
})



$("#fileAdd").click(()=>{
    if(count>=max){
        alert("첨부파일은 최대 "+max+"개까지 업로드 가능합니다.");
        return ;
        }else{
            let child = '<div class="input-group mb-3" id="f'+idx+'">'
                child = child+'<input type="file" class="form-control" name="'+param+'">'
                child = child+'<button type="button" class="btn btn-outline-primary dels" data-dels-id="f'+idx+'">X</button>'
            $("#filelist").append(child);
            count++;
            idx++;

        }
})

