const picAdd = document.getElementById("picAdd");
const picDelete = document.getElementById("picDelete");

$("#picAdd").click(function(){
    fetch("../product/picAdd",{
        method:'POST',
        headers: {"Content-type" : "application/x-www-form-urlencoded"},
        body: "productNum=" + productNum
    }).then((response)=>response.text())
    .then((res)=>{
        console.log(res.trim());
        if(res.trim()==1){
        alert('장바구니에 추가 완료!');
        }
     })
})
$('#picDelete').click(()=>{
    fetch('../product/picDelete',{
        method:'POST',
        headers: {"Content-type" : "application/x-www-form-urlencoded"},
        body: "productNum=" + productNum
    }).then((response)=>{
        return response.text();
    }).then((res)=>{
        if(res.trim() == 1){
            alert('장바구니에서 삭제 완료');
        }
    })
})

