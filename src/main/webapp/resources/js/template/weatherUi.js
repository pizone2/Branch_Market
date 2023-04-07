function getFrontDate(date){

    let year = String(date.getFullYear());
    let month = String(date.getMonth() + 1);
    let day = String(date.getDate());

    month = String(month >= 10 ? month : '0' + month);
    day = String(day >= 10 ? day : '0' + day);

    return year + month + day;
}
function getBackDate(date){
    let hour = String(date.getHours());
    hour = String(hour >= 10 ? hour : '0' + hour);
    return hour;
}


let date = new Date();

let twoPreDate = new Date(date.getTime());
twoPreDate.setDate(date.getDate() - 2);

let startDt = getFrontDate(twoPreDate);
let startHh = getBackDate(twoPreDate);

let preDate = new Date(date.getTime());
preDate.setDate(date.getDate() - 1);

let endDt = getFrontDate(preDate);
let endHh = getBackDate(preDate);


var url = 'http://apis.data.go.kr/1360000/AsosHourlyInfoService/getWthrDataList';
let queryParams = '?' + encodeURIComponent('serviceKey') + '='+'RfrCx%2FyNvY6tbFb5G%2FkjPb1TVZDzrFab8OVKw5K9Lr4EnZXvLoKDi0FOPPmvHo3TA9bVG76orIIhcPg0ywdL5w%3D%3D'; /*Service Key*/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('json'); /**/
queryParams += '&' + encodeURIComponent('dataCd') + '=' + encodeURIComponent('ASOS'); /**/
queryParams += '&' + encodeURIComponent('dateCd') + '=' + encodeURIComponent('HR'); /**/
queryParams += '&' + encodeURIComponent('startDt') + '=' + encodeURIComponent(startDt); /**/
queryParams += '&' + encodeURIComponent('startHh') + '=' + encodeURIComponent(startHh); /**/
queryParams += '&' + encodeURIComponent('endDt') + '=' + encodeURIComponent(endDt); /**/
queryParams += '&' + encodeURIComponent('endHh') + '=' + encodeURIComponent(endHh); /**/
queryParams += '&' + encodeURIComponent('stnIds') + '=' + encodeURIComponent('108'); /**/
$.ajax({
    url:url + queryParams,
    type:'get',
    success:function(res){
        console.log(res);
        let items = res.response.body.items.item;
        for(item of items){
            $('#tm').html(item.tm);
            $('#ws').html(item.ws + " Km/h");
            $('#ta').html(item.ta + " °C");
            $('#hm').html(item.hm + " %");
            $('#stnNm').html(item.stnNm);
            // tm 시간, ws 풍속, ta 기온, hm 습도 
            if(item.dmstMtphNo == '16'){
                $('#weatherImage').html('<i class="fa fa-cloud" aria-hidden="true"></i>');
            }else if(item.dmstMtphNo == '01'){
                $('#weatherImage').html('<i class="fa fa-umbrella" aria-hidden="true"></i>');
            }else{
                $('#weatherImage').html('<i class="fa fa-cloud" aria-hidden="true"></i>');
            }
        }
    }
})