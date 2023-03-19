let boardNum = $('#boardNum').attr('data-boardNum');
function getCommentsList() {
    $.ajax({
        url:'/comments/list',
        type:'get',
        data:{
            'boardNum':boardNum
        },
        success:(response)=>{
            response = response.trim();
            $('#commentsList').html(response);
        }
    })
}
getCommentsList();
// --------------------------------------------------------
const picAdd = document.getElementById("picAdd");
const picDelete = document.getElementById("picDelete");

$("#picAdd").click(function(){
	
    fetch("../board/picAdd",{
        method:'POST',
    }).then((response)=>response.text())
    .then((res)=>{
        if(res.trim()==1){
        alert('상품이 Pic되었습니다!');
        }
    })
})