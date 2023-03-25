let ParticipantsCount = 0;
$('#addParticipantsBtn').click(()=>{
    let input = '참가자 ' + ++ParticipantsCount + ' <input type="text" name="participants"><br>';
    $('#participantList').append(input);
})

$('#makeRoomBtn').click(()=>{
    if(ParticipantsCount == 0){
        alert('최소 한명 이상의 참가자를 선택 해 주세요');
    }else{
        $('#makeRoomForm').submit();
    }
})