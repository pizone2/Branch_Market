package com.main.branch.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.branch.config.ServerEndpointConfigurator;

@Controller
@ServerEndpoint(value="/echo.do/{roomNum}",configurator = ServerEndpointConfigurator.class)
public class WebSocketChat {
    
	private static final Map<String,List<Session>> sessionList = new HashMap<String,List<Session>>();
	private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
    
    public WebSocketChat() {
        // TODO Auto-generated constructor stub
        System.out.println("웹소켓(서버) 객체생성");
    }
    
    @OnOpen
    public void onOpen(Session session,@PathParam("roomNum") String roomNum) {
    	List<Session> sessions = sessionList.get(roomNum);
    	if(sessions == null) {
    		sessions = new ArrayList<Session>();
    		sessionList.put(roomNum, sessions);
    	}
        sessionList.get(roomNum).add(session);
        
    	System.out.println("처음 접속한 roomNum= " + roomNum);
        logger.info("Open session id:"+session.getId());
        
        try {
            final Basic basic=session.getBasicRemote();
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
    
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param sender
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String sender, String contents, String roomNum) {
    	
    	try {
        	// 자신을 제외한 세션에 접속하고 채팅방에 소속된 사람들에게 메세지 보냄
            for(Session session : sessionList.get(roomNum)) {
                if(!session.getId().equals(self.getId())) {
                	session.getBasicRemote().sendText("1,"+contents);
                }
            }
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e);
        }
    }
    
    /*
     * 내가 입력하는 메세지
     * @param message
     * @param session
     */
    // 사용자가 메세지를 보냈을때
    @OnMessage
    public void onMessage(String data,Session session) {
    	System.out.println(data);
    	
       	String roomNum = data.split(",")[0];
    	String contents = data.split(",")[1];
    	String sender = data.split(",")[2];

    	
        logger.info("Message From "+sender + ": "+contents);
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("0," + contents);
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, sender, contents, roomNum);
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    @OnClose
    public void onClose(Session session,@PathParam("roomNum") String roomNum) {
        logger.info("Session "+session.getId()+" has ended");
        System.out.println(roomNum);
        sessionList.get(roomNum).remove(session);
    }
}