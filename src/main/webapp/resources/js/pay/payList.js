$('.page-link').click(function(){
    console.log(this);
    let page = $(this).attr('data-page');
    $('#page').val(page);
    $('#paginingForm').submit();
})