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

 

function checkAll() {
    var checkboxes = document.getElementsByName('chk');
    var totalPrice = 0;
    for (var i = 0; i < checkboxes.length; i++) {
      checkboxes[i].checked = document.getElementById('cbx_chkAll').checked;
      if (checkboxes[i].checked) {
        totalPrice += parseInt(checkboxes[i].parentNode.nextSibling.textContent.replace(",", ""));
      }
    }
    document.getElementById('totalPrice').textContent = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }