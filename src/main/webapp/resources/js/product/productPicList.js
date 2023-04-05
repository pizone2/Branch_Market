const totalPrice = $('#totalPrice');
const chkAll = $('#chkAll');
const chks = document.getElementsByClassName('chk');
let selectedCount = 0;
let totalPriceData = 0;

function checkAll() {
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

  $(totalPrice).html(totalPriceData.toLocaleString() + "원");
  if(selectedCount == productCount){
    $(chkAll).prop('checked',true);
  }else{
    $(chkAll).prop('checked',false);
  }
})


var IMP = window.IMP;
IMP.init("imp77318106");

var today = new Date();
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours + minutes + seconds + milliseconds;
var merchant_uid = "IMP" + makeMerchantUid;


function requestPay() {
  let productTitles = [];
  let productTitle = "";
  let productNums = "";

  let memberId = $('#datas').attr('data-member-id');
  let memberEmail = $('#datas').attr('data-member-email');
  let memberPhone = $('#datas').attr('data-member-phone');
  let memberAddress = $('#datas').attr('data-member-address');

  for(let chk of chks){
    if($(chk).prop('checked')){
        productTitles.push($(chk).attr('data-productTitle'));
        productNums += ($(chk).attr('data-productNum') + ",");
    }
  }
  if(productTitles.length < 1){
    alert('1개 이상 제품을 선택 해 주세요!');
    return;
  }

  productTitle = productTitles[0];
  if(selectedCount > 1){
    productTitle += (" 그 외 " + (selectedCount - 1) + "개");
  }
  console.log(productTitle);
  console.log(productNums);

  IMP.request_pay({
      // pg : 'kcp.T0000',
      pg : 'kakaopay',
      pay_method : 'card',

      merchant_uid: merchant_uid,
      name : productTitle,
      amount : totalPriceData,

      buyer_email : memberEmail,
      buyer_name : memberId,
      buyer_tel : memberPhone,
      buyer_addr : memberAddress,
      buyer_postcode : '123-456-789'
  },
  function (rsp) {
      console.log(rsp);
      if (rsp.success) {
        $.ajax({
          url:'/pay/add',
          type:'post',
          data:{
             'merchantUid':rsp.merchant_uid,
             'impUid':rsp.imp_uid,
             'productTitle':productTitle,
             'productNums':productNums
          },
          success:(res)=>{
            console.log(res);
            location.href = "/";
          }
        })
      }
  });
}