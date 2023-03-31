$('.page-link').click((e)=>{
    let pageNum = $(e.target).attr('data-page');
    $('#page').val(pageNum);
    $('#paginingForm').submit();
})