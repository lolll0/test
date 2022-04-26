package kr.or.ddit.basic;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.swing.JOptionPane;

/*
 		컴퓨터와 가위 바위 보를 진행하는 프로그램을 작성하시오.
 		
 		컴퓨터의 가위 바위 보는 난수를 이용해서 구하고,
 		사용자의 가위 바위 보는 showInputDialog()를 이용해서 입력 받는다.
 		
 		입력 시간은 5초로 제한하고 카운트 다운을 진행한다.
 		5초 안에 입력이 없으면 게임에 진것으로 처리한다.
 		
 		5초 안에 입력이 있으면 승패를 구해서 출력한다.
 		
 		결과 예시)
 		1) 5초안에 입력이 없을 때
 			-결과-
 		   시간 초과로 당신이 졌습니다.
 		 
 		2) 5초안에 입력이 있을 때
 		   -결과-
 		   컴퓨터 : 가위
 		   당신 : 바위
 		   결과 : 당신이 이겼습니다.
	 */
public class ThreadTest07 {
	
	public static void main(String[] args) {
		Thread th1 = new game();
		Thread th2 = new count();
		
		th1.start();
		th2.start();

	}

}

class game extends Thread{
	HashMap<Integer, String> map = new HashMap<Integer, String>();
    
	public void run(){
	     map.put(1, "가위");
	     map.put(2, "바위");
	     map.put(3, "보");
		 int ran = (int)(Math.random() * 3) + 1;
		 String com = map.get(ran);  
		 
		 String str = JOptionPane.showInputDialog("가위 바위 보 중에 입력하세요.");
	     inputCheck = true;
	     
	    
	     String result = "";
	     if(com.equals(str)) {
	    	 result = "무승부입니다.";
	     }else if(com.equals("가위") && str.equals("바위")) {
	    	 result = "당신이 이겼습니다.";
	     }else if(com.equals("바위") && str.equals("보")) {
	    	 result = "당신이 이겼습니다.";
	     }else if(com.equals("보") && str.equals("가위")) {
	    	 result = "당신이 이겼습니다.";
	     }else {
	    	result = "당신이 졌습니다.";
	     }
	     System.out.println("컴퓨터 : " + com);
	     System.out.println("당신 : "  + str);
	     System.out.println("결과  : " + result);
		 		 
}
	public static boolean inputCheck = false; // 시간 테스트
	
   
	
}




class count extends Thread{
	@Override
	public void run() {
		for(int i = 5; i >= 1; i--) {
			System.out.println(i);
			if(game.inputCheck == true) {
				return;
			}
			
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO: handle exception
			}
		}
		System.out.println("입력 시간이 지났습니다.");
		System.out.println("시간 초과로 당신이 졌습니다.");
		System.exit(0);
	}
}








