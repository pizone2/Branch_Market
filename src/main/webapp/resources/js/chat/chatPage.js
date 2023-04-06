let ball = document.getElementById('sidebar_secondary')
let chatHead = document.getElementById('chatHead');


chatHead.onmousedown = function(event) {
    // (1) absolute 속성과 zIndex 프로퍼티를 수정해 공이 제일 위에서 움직이기 위한 준비를 합니다.
    ball.style.position = 'absolute';
    ball.style.zIndex = 1000;
  
    // 현재 위치한 부모에서 body로 직접 이동하여
    // body를 기준으로 위치를 지정합니다.
    document.body.append(ball);
  
    // 공을 위치하게 합니다.
    function moveAt(pageX, pageY) {
      ball.style.left = pageX - event.offsetX + 'px';
      ball.style.top = pageY - event.offsetY + 'px';
    }
  
    // 포인터 아래로 공을 이동시킵니다.
    moveAt(event.pageX, event.pageY);
  
    function onMouseMove(event) {
      moveAt(event.pageX, event.pageY);
    }
  
    // (2) mousemove로 공을 움직입니다.
    document.addEventListener('mousemove', onMouseMove);
  
    // (3) 공을 드롭하고, 불필요한 핸들러를 제거합니다.
    ball.onmouseup = function() {
      document.removeEventListener('mousemove', onMouseMove);
      ball.onmouseup = null;
    };
  
  };
  ball.ondragstart = function() {
    return false;
  };