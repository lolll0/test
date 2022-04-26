package kr.or.ddit.basic;

// 데몬 쓰레드 연습 ==> 자동 저장하기

public class ThreadTest08 {

	public static void main(String[] args) {
		AutoSaveThread autoSave = new AutoSaveThread();
		
		// 데몬 쓰레드로 설정하기 ==> 반드시 start()메서드 호출 전에 설정한다.
		// khs
		// 데몬쓰레드는 일반쓰레드를 보조하기 위해 존재를 한다. 그렇기에 일반쓰레드가 종료 되면 데몬쓰레드도 자동으로 종료된다.
		// 데몬쓰레드는 일반적으로 무한반복문으로 만든다.
		autoSave.setDaemon(true); // <-- 데몬쓰레드
	
		autoSave.start();
		
		try {
			for(int i = 1; i <= 20; i++) {
				System.out.println(i);
				Thread.sleep(1000);
			}
		} catch (InterruptedException e) {
			// TODO: handle exception
		}
		
		System.out.println("main 쓰레드 종료...");
	}

}

// 자동 저장하는 쓰레드(3초에 한번씩 자동 저장하는 쓰레드)
class AutoSaveThread extends Thread{
	// 작업 내용을 저장하는 메서드
	public void save() {
		System.out.println("작업 내용을 저장합니다...");
	}
	
	@Override
	public void run() {
		while(true) { // 데몬 쓰레드는 보통 무한 반복문으로 만든다.
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				// TODO: handle exception
			}
			save();
		}
	}
}























