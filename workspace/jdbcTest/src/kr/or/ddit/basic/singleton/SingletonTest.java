package kr.or.ddit.basic.singleton;

public class SingletonTest {
	
	public static void main(String[] args) {
		
		// 외부에서 new 명령으로는 생성이 불가하다.
//		MySingleton test1 = new MySingleton();
		
		// 겉으로 보기에는 객체가 2개 생긴 것 처럼 보인다.
		// 하지만 같은 객체가 생성이 된 것이다.
		MySingleton test2 = MySingleton.getInstance();
		MySingleton test3 = MySingleton.getInstance();
		
		System.out.println("test2 ==> " + test2);
		System.out.println("test3 ==> " + test3);
		
		System.out.println(test2 == test3);
		System.out.println(test2.equals(test3));
		
		test2.displayTest();
		
	}
}
