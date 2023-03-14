$('.page-link').click((e)=>{
    let page = $(e.target).attr('data-page');
    console.log($(e.target));
    $('#page').val(page);
    $('#paginingForm').submit();
})