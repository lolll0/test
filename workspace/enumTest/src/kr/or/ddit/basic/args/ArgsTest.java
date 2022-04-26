package kr.or.ddit.basic.args;

public class ArgsTest {
	
	// 메서드를 호출할 때 사용되는 데이터의 개수가 실행될 때마다 다를 때...
	
	
	// 1. 배열을 이용한 메서드
	// 예) 매개변수로 받은 정수들의 합계를 구하는 메서드
	//	  (이 정수들의 개수는 상황에 따라 다르다.)
	public int sumArr(int[] data ) {
		int sum = 0;
		
		for(int i = 0; i < data.length; i++	) {
			sum += data[i];
		}
		
		return sum;
	}
	
	// 가변형 인수 ==> 메서드에 매개변수의 개수가 실행될 때마다 다를 때 사용한다.
	//  - 가변형 인수에 사용되는 매개변수는 메서드 안에서 배열로 처리된다.
	//  - 가변형 인수는 한가지 자료형만 사용할 수 있다.
	
	public int sumArg(int...data) { // 메서드 하나당 가변형 인수는 한개만 사용가능하다.(일반변수의 갯수는 상관이 없다.)
		int sum = 0;
		
		for(int i = 0; i < data.length; i++	) {
			sum += data[i];
		}
		
		return sum;
	}
	
	//가변형 인수와 일반적인 인수를 같이 사용할 경우에는 가변형 인수를 제일 뒤쪽에 배치해야 한다.
	
	public String sumArgs2(String name, int...data) { // 일반변수를 여러개 쓰는 것도 가능하다.
		int sum = 0; 
		for(int i = 0; i < data.length; i++) {
			sum += data[i];
		}
		
		return name + "씨 총점 :" + sum;
	}
	
	
//	public void ttt(int a) {
//		
//	}
	
	public static void main(String[] args) {
		ArgsTest test = new ArgsTest();
		
		int[] nums = {100, 200, 300};
		
		int[] nums2;
		
		nums2 = new int[]{100, 200, 300}; //new int[]를 붙어야 한다.
		
		System.out.println(test.sumArr(nums));
		System.out.println(test.sumArr(new int[] {1,2,3,4,5}));
		System.out.println("--------------------------------------");
		
		System.out.println(test.sumArg(100, 200, 300)); //가변형 인수를 썻을 때에는 값을 직접 넣어도 된다.
		System.out.println(test.sumArg(1,2,3,4,5));
		System.out.println("--------------------------------------");
		
		System.out.println(test.sumArgs2("홍길동", 1,2,3,4,5,6,7));
		
//		int k = 0;
//		test.ttt(k);
//		test.ttt(300);
	}

}
