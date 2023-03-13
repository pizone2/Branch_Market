let check = [0,0];
$('#check1').click(()=>{
    console.log($('#check1').prop('checked'));
    if($('#check1').prop('checked') == true){
        check[0] = 1;
    }else{
        check[0] = 0;
    }
})
$('#check2').click(()=>{
    console.log($('#check2').prop('checked'));
    if($('#check2').prop('checked') == true){
        check[1] = 1;
    }else{
        check[1] = 0;
    }
})
$('#submit').click(()=>{
    if(check.includes(0)){
        alert('모든 항목에 동의 해 주세요')
    }else{
        location.href = './add';
    }
})