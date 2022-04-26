package kr.or.ddit.basic;

public class ThreadTest04 {
	/*
	 	1~20억까지의 합계를 구하는 프로그램을 하나의 쓰레드가 단독으로 처리할 대와
	 	여러개의 쓰레드가 협력해서 처리할 때의 경과시간을 비교해보자.
	 */
	public static void main(String[] args) {
		// 단독으로 처리하기
		SumThread smth = new SumThread(1L, 2_000_000_000L); // _는 없는 취급이기 때문에 자릿수 체크용을 사용
		// khs 
		// currentTread() : 현재 실행중인 Thread를 가져온다.
		long startTime = System.currentTimeMillis();
		smth.start();
		try {
			smth.join(); 
		} catch (Exception e) {
			// TODO: handle exception
		}
		long endTime = System.currentTimeMillis();
		
		System.out.println("단독으로 처리했을 때 경과 시간 : " + (endTime - startTime));
		System.out.println();
		System.out.println("-----------------------------------------------");
		
		// 여럿의 쓰레드가 협력해서 처리하기 (4개의 쓰레드 이용하기)
		SumThread[] smths = new SumThread[] {
			new SumThread(            1L,   500_000_000L),	
			new SumThread(  500_000_001L, 1_000_000_000L),	
			new SumThread(1_000_000_001L, 1_500_000_000L),	
			new SumThread(1_500_000_001L, 2_000_000_000L)
		};
		
		startTime = System.currentTimeMillis();
		
		for(int i = 0; i < smths.length; i++) {
			smths[i].start();
		}
		
		for(SumThread sm : smths) {
			try {
				sm.join();
			} catch (InterruptedException e) {
				// TODO: handle exception
			}
		}
		
		endTime = System.currentTimeMillis();
		
		System.out.println("협력해서 처리한 경과시간 : " + (endTime - startTime));

	}

}

// 합계를 구하는 쓰레드 class 작성
class SumThread extends Thread{
	// 합계를 구할 영역의 시작값과 종료값이 저장될 변수 선언
	private long min; 
	private long max;
	
	// 생성자
	public SumThread(long min, long max) {
		super();
		this.min = min;
		this.max = max;
	}
	
	@Override
	public void run() {
		long sum = 0L;
		for(long i = min; i <= max; i++) {
			sum += i;
		}
		
		System.out.println("합계 : " + sum);
	}
	
	
}














