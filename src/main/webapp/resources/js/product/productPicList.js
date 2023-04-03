const picDelete = document.getElementById("picDelete");
const totalPrice = $('#totalPrice');
const chkAll = $('#chkAll');
let selectedCount = 0;
let totalPriceData = 0;

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
    let chks = document.getElementsByClassName('chk');
    totalPriceData = 0;
    selectedCount = 0;
    for(let e of chks){
      $(e).prop('checked',$(chkAll).prop('checked'));

      if($(e).prop('checked')){
        price = $(e).attr('data-price');
        price = parseInt(price);
        totalPriceData+=price;
        selectedCount++;
      }
    }
    $(totalPrice).html(totalPriceData).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
}

$('.chk').click(function(){
  let price = $(this).attr('data-price');
  price = parseInt(price);
  let productNum = $(this).attr('data-productNum');
  let productCount = $(this).attr('data-productCount');

  console.log($(this).prop('checked'));
  if($(this).prop('checked')){
    totalPriceData += price;
    selectedCount++;
  }else{
    totalPriceData -= price;
    selectedCount--;
  }

  $(totalPrice).html(totalPriceData).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
  if(selectedCount == productCount){
    $(chkAll).prop('checked',true);
  }else{
    $(chkAll).prop('checked',false);
  }
})