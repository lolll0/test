package kr.or.ddit.basic;


import java.util.Vector;

public class VectorTest {
		//2022-02-22
	public static void main(String[] args) {
		// Collection들은 자바의 객체만 저장할 수 있다.
		// 배열의 단점을 보완하고 간단한 기능을 추가
		// 객체 생성
		Vector v1 = new Vector();
		// 데이터가 없기 때문에 0이 나온다.
		System.out.println("처음 크기 : " + v1.size());
		
		// 데이터 추가하기 : add(추가할 데이터)
		// 반환값 : 성공(true), 실패(false)
		v1.add("aaaa");
		v1.add(new Integer(123)); //발전하기 전에는 new Integer를 붙였다. Wrapper클래스를 사용해서 전환하였다.
		v1.add(111);  //111이 백터 안에서 일반 데이터가 자동으로 객체화가 진행이 된다. 오토박싱이라고 불린다. 오토언박싱 : 데이터를 풀어준다.
		v1.add('a'); //char형태 추가 가능
		v1.add(true); //논리형 데이터 추가가능
		
		boolean r = v1.add(3.14);
		
		System.out.println("현재 크기 : " + v1.size()); //위에서 6개의 데이터를 추가 하였기 때문에 크기가 6으로 바뀜
		System.out.println("반환값 : " + r); //3.14를 추가하는데 성공을 했기 때문에 true가 출력이 된다.
		
		// 데이터 추가하기2 : addElement(추가할 데이터) add와 역할이 동일하다.
		// ==> 이전 버전에서부터 지원하는 메서드
		//     이전 버전의 프로그램도 사용할 수 있도록 하기 위해서 남아있는 메서드
		v1.addElement("CCCC");
		
		System.out.println("v1 => " + v1); //v1에 들어있는 데이터를 출력
		// 백터 내부에서 데이터를 넘겨줄 때는 배열에 저장을 한다. 데이터를 추가를 하면 배열의 크기가 자동으로 늘어난다.
		// 데이터 추가하기2 : add(index, 데이터)
		// ==> 'index'번째에 '데이터'를 끼워 넣는다. 뒤에 데이터는 뒤로 한칸씩 물러난다.
		// ==> 'index'는 0부터 시작한다.
		// ==> 반환값이 없다.
		v1.add(1, "KKKK");
		System.out.println("v1 => " + v1);
		System.out.println();
		// 데이터 꺼내오기 : get(index)
		// ==> 'index'번째의 데이터를 꺼내와 반환한다.
		String temp = (String)v1.get(0); //형변환을 해주어야 한다.
		System.out.println("꺼내온 값 : " + temp); //오토 언박싱
		int i = (int)v1.get(2);
		System.out.println("꺼내온 값 : "  + i);
	    System.out.println();
		
	    // 데이터 수정하기 : set(index, 새로운데이터)
	    // ==> 'index'번쨰의 데이터를 '새로운 데이터'로 덮어쓴다.
	    // ==> 반환값 : 원래의 데이터  
	    String temp2 = (String)v1.set(0, "ZZZZ");
	    System.out.println("v1 => " + v1);
	    System.out.println("temp2 => " + temp2); //처음에 0번째 인덱스에 존재하던 값 aaaa
	    
	    // 데이터 삭제하기1 : remove(index)
	    // ==> 'index'번째의 자료를 삭제한다.
	    // ==> 반환값 : 삭제된 데이터
	    String temp3 = (String)v1.remove(0);
	    System.out.println("삭제후 v1 => " + v1); //0번째에 있던 ZZZZ가 삭제되어짐
	    System.out.println("삭제된 데이터 : " + temp3);
	    
	    // 데이터 삭제하기2 : remove(삭제할데이터)
	    // ==> '삭제할데이터'를 찾아서 삭제한다.
	    // ==> '삭제할데이터'가 여러개이면 앞에서부터 삭제된다.(데이터가 중복이 되어 있을 경우)
	    // ==> 반환값 : 삭제성공(true), 삭제실패(false)
	    // ==> '삭제할데이터'가 '정수형'이거나 'char형'일 경우에는 반드시 객체로 변환해서 사용해야 한다.
	    v1.remove("CCCC");
	    System.out.println("삭제후 v1 => " + v1);
	    
//	    v1.remove(123); //그냥 123이라고 적을 경우 인덱스로 인식된다. 그렇기에 배열의 범위를 벗어났다는 오류가 출력이 된다.
	    v1.remove(new Integer(123));
	    System.out.println("삭제후 v1 => " + v1);
	    
//	    v1.remove('a'); //char 형도 코드 값이 넘어가기 때문에 인덱스로 인식이 된다. 
	    v1.remove(new Character('a'));
	    System.out.println("삭제후 v1 => " + v1);
	    
	    v1.remove(true);
	    v1.remove(3.14);
	    System.out.println("삭제후 v1 => " + v1);
	    System.out.println("-----------------------------------------------------");
	    
	    //-----------------------------------------------------------------------------------
	    /*
	     - 제너릭타입(Generic Type) ==> 클래스 내부에서 사용할 데이터 타입을 
	       외부에서 지정하는 기법으로 객체를 생성할 때 < > 괄호안에 그 객체의 내부에서 사용할 데이터의 타입을 지정해주는 것을 말한다.
	       이런식으로 객체를 생성하면 제너릭 타입으로 지정한 종류의 데이터 이외의 다른 데이터는 저장할 수 없다.
	       제너릭 타입으로 지정할 수 있는 데이터 타입은 '클래스형'이어야 한다.
	       (int는 Integer, boolean은 Boolean, char는 Character 등으로 대체해서 기술해야한다.)
	       
	       제너릭을 사용하는 이유 : 제너릭 타입으로 생성하게 되면 데이터를 꺼내올 때 별도의 형변환 없이 사용이 가능하다.
	     */
	    
	    // String을 저장할 수 있는 Vector 객체 생성
	    Vector<String> v2 = new Vector<String>();
	    
	    //int형을 저장할 수 있는 Vector객체 생성
	    Vector<Integer> v3 = new Vector<>(); //뒤에 < >에는 생략이 가능하다.
	    
		v2.add("안녕하세요");
//		v2.add(100); // 오류 : 다른 종류의 데이터를 저장할 수 없다. 위에서 String타입으로 지정을 했기 때문에
		String temp4 = v2.get(0);
		System.out.println(temp4);
		
		Vector<Vector> vv= new Vector<Vector>(); //vector안에 vector를 집어넣는다. 이차원 배열과 비슷한 형태이다.
		Vector<Vector<Vector>> vvv = new Vector<Vector<Vector>>(); //3차원 배열
		System.out.println("-----------------------------------------------------");
		
		//모든 데이터 삭제하기 : clear()
		v2.clear();
		System.out.println("v2의 size : " + v2.size());
		
		v2.add("AAAA");
		v2.add("BBBB");
		v2.add("CCCC");
		v2.add("DDDD");
		v2.add("EEEE");
		
		Vector<String> v4 = new Vector<String>();
		v4.add("BBBB");
		v4.add("EEEE");
		
		System.out.println("v2 => " + v2);
		System.out.println("v4 => " + v4);
		
		// 데이터 삭제하기3 : removeAll(Collection객체)
		// ==> 'Collection객체'가 가지고 있는 데이터를 모두 삭제한다.
		// ==> 반환값 : 삭제성공(true), 삭제실패(false)
		v2.removeAll(v4); //v2중에 v4와 동일한 값을 삭제한다.
		System.out.println("v2 => " + v2);
		System.out.println("---------------------------------------------------------");
		
		v2.clear();
		v2.add("AAAA");
		v2.add("BBBB");
		v2.add("CCCC");
		v2.add("DDDD");
		v2.add("EEEE");
		
		// Vector의 데이터를 순서대로 모두 가져와 처리하기
		// 이 때 반복문을 사용한다.(주로 for문을 사용한다.)
		for(int j = 0; j < v2.size(); j++) {
			System.out.println(j + "번째 자료 : " + v2.get(j));
		}
		System.out.println("---------------------------------------------------------");
		
		//향상된 for문
		//for(자료형 변수 : 꺼내올 대상객체)
		for(String str : v2) {
			System.out.println(str);
		}
		
		
		
		

	}

}
