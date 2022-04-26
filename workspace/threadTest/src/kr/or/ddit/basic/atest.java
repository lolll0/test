package kr.or.ddit.basic;

public class atest {
	public static void main(String[] args) {
		System.out.println(Thread.currentThread().getName() + "start");
		Runnable r = new MyRunnable();
		Thread thread = new Thread(r);
		thread.start();
		try {
			thread.join();
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println(Thread.currentThread().getName() + "end]");
		
	}
}


class MyRunnable implements Runnable{
	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("쓰레드 1");
		thread2();
	}

	private void thread2() {
		// TODO Auto-generated method stub
		System.out.println("쓰레드 2");
		thread3();
	}

	private void thread3() {
		// TODO Auto-generated method stub
		System.out.println("쓰레드 3");
	}
}