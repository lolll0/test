package kr.or.ddit.basic.singleton;

public class SingletonTest {

	public static void main(String[] args) {
		
//		MySingleton test1 = new MySingleton();  //생성자에 접근할 수 없어서 외부에서 new명령으로 생성 불가
		
		MySingleton test2 = MySingleton.getInstance();
		MySingleton test3 = MySingleton.getInstance();  //또 다른 객체처럼 보이지만~ 
		
		System.out.println("test2 =>" + test2);
		System.out.println("test3 =>" + test3);  //같은 참조값
		
		System.out.println(test2 == test3);
		System.out.println(test2.equals(test3));
		
		test2.displayTest();
	}

}
