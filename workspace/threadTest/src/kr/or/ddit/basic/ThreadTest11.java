package kr.or.ddit.basic;

/*
     Thread의 stop()메서드를 호출하면 해당 쓰레드가 바로 멈춘다.
     이 때 이 쓰레드가 사용하던 자원을 정리하지 못하고 프로그램이 종료되어 
     나중에 실행되는 프로그램에 영향을 줄 수 있다.
     그래서 stop()메서드는 비추천으로 되어 있다.
 */
public class ThreadTest11 {

	public static void main(String[] args) {
		/*
		ThreadStopTest01 th1 = new ThreadStopTest01();
		th1.start();
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO: handle exception
		}
		
		//th1.stop();  쓰레드 실행 중에 강제로 멈춘다. 사용비추 아래의 방법을 사용하는 것을 추천한다.
		th1.setStop(true);	// 쓰레드를 멈추고 싶을 때
		*/
		
		ThreadStopTest02 th2 = new ThreadStopTest02();
		th2.start();
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO: handle exception
		}
		
		th2.interrupt();
	}

}

// 쓰레드를 멈추게 하는 연습용 쓰레드
class ThreadStopTest01 extends Thread{
	private boolean stop;
	
	public void setStop(boolean stop) {
		this.stop = stop;
	}
	
	@Override
	public void run() {
		while(!stop) {
			System.out.println("쓰레드 실행 중...");
		}
		
		System.out.println("자원 정리...");
		System.out.println("쓰레드 종료...");
	}
}

// interrupt()메서드를 이용하여 쓰레드를 멈추게 하는 연습용 쓰레드
class ThreadStopTest02 extends Thread{
	@Override
	public void run() {
		/*
		// 방법1 ==> interrupt()메서드와 sleep()메서드를 이용하는 방법
		// 표현적인 면에서 손해를 본다. 작업이 1000번 이루어지면 1초를 쉬게 되므로 작업을 할 때 딜레이가 될 수 있는 우려가 있다.
		// 속도에 상관을 쓰지 않을 때 이 방식을 사용한다.
		try {
			while(true) {
				System.out.println("실행 중...");
				Thread.sleep(1);
			}
		}catch (InterruptedException e) {
			//System.out.println("interrupt발생");
		}
		
		System.out.println("자원 정리...");
		System.out.println("쓰레드 종료...");
		*/
		
		// 방법2 
		while(true) {
			System.out.println("Thread 실행중...");
			
			// interrupt()메서드가 호출되었는지 여부를 검사한다.
			
			// 검사방법1 ==> 쓰레드의 인스턴스 메서드인 
			// 			  isInterrupted()를 이용하기
			// inInterrupted()메서드는 interrupt()메서드가 호출되면
			// true를 반환한다.
			/*
			if(this.isInterrupted()) {
				break;
			}
			*/
			
			// 검사방법2 ==> Thread의 정적 메서드인
			//            interrupted()메서드를 이용하기
			// inInterrupted()메서드는 interrupt()메서드가 호출되면
			// true를 반환한다.
			if(Thread.interrupted()) {
				break;
			}
			
		}
		
		System.out.println("자원 정리...");
		System.out.println("쓰레드 종료...");
	}
}






