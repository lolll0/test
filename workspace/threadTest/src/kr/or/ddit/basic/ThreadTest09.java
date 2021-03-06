package kr.or.ddit.basic;

	// 쓰레드의 상태를 출력하는 예제.

public class ThreadTest09 {

	public static void main(String[] args) {
		PrintStateThread th = new PrintStateThread(new TargetThread());
		th.start();
	}

}


//	쓰레드 상태의 검사 대상이 되는 쓰레드 
class TargetThread extends Thread{
	@Override
	public void run() { // RUNNABLE 상태
		long sum = 0L;
		for(long i = 1L; i <= 2_000_000_000L; i++) {
			sum += i;
		}
		
		try { // TIMED_WAITING 상태
			Thread.sleep(1500);
		} catch (InterruptedException e) {
			// TODO: handle exception
		}
		
		sum = 0; // RUNNABLE 상태
		for(long i = 1L; i <= 2_000_000_000L; i++) {
			sum += i;
		}
	}
}

// TargetThread의 상태를 출력하는 쓰레드
class PrintStateThread extends Thread{
	private TargetThread target;
	
	// 생성자
	public PrintStateThread(TargetThread target) {
		this.target = target;
	}
	
	@Override
	public void run() {
		while(true) {
			// 쓰레드의 상태값 구하기 ==> getState()메서드 이용
			Thread.State state = target.getState();
			System.out.println("TargetThread의 상태값 : " + state);
			
			// target쓰레드의 상태가 NEW상태인지 검사
			if(state == Thread.State.NEW) { // NEW 생성단계
				target.start(); // target쓰레드를 실행시킨다.
			}
			
			// target쓰레드의 상태가 종료 상태이면...
			if(state == Thread.State.TERMINATED) { //TERMINATED 소멸단계
				break; // 반복문을 빠져나온다. 즉, 현재 쓰레드도 종료시킨다.
			}
			
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				// TODO: handle exception
			}
			
		}
	}
}














