const productNum = $('#datas').attr('data-productNum')

function getReviewList(){
    $.ajax({
        url:'/review/list?productNum=' + productNum,
        type:'get',
        success:(response)=>{
            response = response.trim();
            $('#reviewList').html(response);
        }
    })
}
getReviewList();

// ------------- 추가
$('#reviewAddBtn').click(()=>{
    $('#datas').attr('data-work-state','add');
})

// -------------- 업데이트
$('#reviewUpdateBtn').click((e)=>{
    $('#datas').attr('data-work-state','update');
    
    let reviewNum = $(e.target).attr('data-update-reviewNum');
    $('#datas').attr('data-update-reviewNum',reviewNum);

    let contents = $(e.target).attr('data-update-contents');
    $('#inputData').val(contents);

    console.log(reviewNum);
})

// --------- 폼에서 확인버튼 눌렀을때
$('#submitDataBtn').click(()=>{
    let workState = $('#datas').attr('data-work-state');

    if(workState == 'add'){
        let reviewContents = $("#inputData").val();
        let reviewScore = $('#reviewScore').html();
    
        $.ajax({
            url:'/review/add',
            type:'post',
            data:{
                'productNum':productNum,
                'reviewContents':reviewContents,
                'reviewScore':reviewScore
            },
            success:(response)=>{
                response = response.trim();
                if(response == 'true'){
                    alert('추가 됨');
                }
                $('#submitFormClose').click();
                getReviewList();
            }
        })
    }else if(workState == 'update'){
        let reviewContents = $("#inputData").val();
        let reviewScore = $('#reviewScore').html();
        let reviewNum = $('#datas').attr('data-update-reviewNum');

        $.ajax({
            url:'/review/update',
            type:'post',
            data:{
                'reviewNum' : reviewNum,
                'reviewContents' :reviewContents,
                'reviewScore' : reviewScore
            },
            success:(response)=>{
                response = response.trim();
                if(response == 'true'){
                    alert('업데이트 됨');
                }
                $('#submitFormClose').click();
                getReviewList();
            }
        })
    }
})

$('#reviewList').on('click','input[data-delete-reviewNum]',(e)=>{
        $.ajax({
            url:'/review/delete',
            type:'post',
            data:{
                'reviewNum' : reviewNum
            },
            success:(response)=>{
                response = response.trim();
                if(response == 'true'){
                    alert('삭제됨');
                }
                getReviewList();
            }
        })
});

















// -----------------------------------------
// star rating
var starRating = function(){
    var $star = $(".star-input"),
        $result = $star.find("output>b");
    $(document)
      .on("focusin", ".star-input>.input", function(){
      $(this).addClass("focus");
    })
      .on("focusout", ".star-input>.input", function(){
      var $this = $(this);
      setTimeout(function(){
        if($this.find(":focus").length === 0){
          $this.removeClass("focus");
        }
      }, 100);
    })
      .on("change", ".star-input :radio", function(){
      $result.text($(this).next().text());
    })
      .on("mouseover", ".star-input label", function(){
      $result.text($(this).text());
    })
      .on("mouseleave", ".star-input>.input", function(){
      var $checked = $star.find(":checked");
      if($checked.length === 0){
        $result.text("0");
      } else {
        $result.text($checked.next().text());
      }
    });
  };
  starRating();