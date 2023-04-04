const totalPrice = $('#totalPrice');
const chkAll = $('#chkAll');
let selectedCount = 0;
let totalPriceData = 0;


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
    $(totalPrice).html(totalPriceData.toLocaleString() + "원");
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

  console.log(totalPriceData)
  console.log(productCount)

  $(totalPrice).html(totalPriceData.toLocaleString() + "원");
  if(selectedCount == productCount){
    $(chkAll).prop('checked',true);
  }else{
    $(chkAll).prop('checked',false);
  }
})