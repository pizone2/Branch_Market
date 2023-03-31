const pl = document.getElementsByClassName("page-link");
const searchForm = document.getElementById("searchForm");
const page = document.getElementById("page");

//for
//for of    --for(꺼낸타입명 변수명 : Collection)

for(let p of pl){
    p.addEventListener("click",function(){
        console.log(p)
        let v = p.getAttribute('data-product-page');
        page.value = v;
        searchForm.submit();
    })
}