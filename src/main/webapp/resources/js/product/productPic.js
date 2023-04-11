const picAdd = document.getElementById("picAdd");
const picDelete = document.getElementById("picDelete");

$('#picIcon').on('click','#picAdd',function(){
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
     $('#picIcon').html('<a href="#" class="heart-icon"><i class="icon-heart fa fa-check" type="submit" id="picDelete"></i></a>')
    
})
$('#picIcon').on('click','#picDelete',function(){
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
    $('#picIcon').html('<a href="#" class="heart-icon"><i class="icon-heart fa fa-check" type="submit" id="picDelete"></i></a>')
    
})


const picBuy = document.getElementById("picBuy");

picBuy.addEventListener('click', function() {
    fetch("../product/picAdd", {
    method: 'POST',
    headers: {"Content-type" : "application/x-www-form-urlencoded"},
    body: "productNum=" + productNum,
    async:false
    })
    .then((response) => response.text())
    .then((res) => {
    console.log(res.trim());
    if (res.trim() == 1) {
         window.location.href = "../product/picList"; // redirect to cart page
    }
    })
    $('#picIcon').html('<a href="#" class="heart-icon"><i class="icon-heart fa fa-check" type="submit" id="picDelete"></i></a>')
});
