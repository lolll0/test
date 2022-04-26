package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

// 회원번호의 내림차순으로 정렬될 수 있는 외부 정렬 기준을 작성하시오.

public class ListSortTest02 {

	public static void main(String[] args) {
		ArrayList<Member> memList = new ArrayList<Member>();
		
		memList.add(new Member(1, "홍길동", "010-1111-1111"));
		memList.add(new Member(5, "이순신", "010-1111-1111"));
		memList.add(new Member(9, "성춘향", "010-1111-1111"));
		memList.add(new Member(3, "강감찬", "010-1111-1111"));
		memList.add(new Member(6, "일지매", "010-1111-1111"));
		memList.add(new Member(2, "변학도", "010-1111-1111"));
		
		System.out.println("정렬전...");
		for(Member mem : memList) {
			System.out.println(mem);
		}
		
		Collections.sort(memList); //내부정렬 기준을 이용한다.
		
		System.out.println("정렬후...");
		for(Member mem : memList) {
			System.out.println(mem);
		}
		System.out.println();
		
		Collections.sort(memList, new numdesc());
		System.out.println("회원번호 정렬후");
		for(Member mem : memList) {
			System.out.println(mem);
		}
	}

}

// Member클래스 작성하기
// ==> 회원이름을 기준으로 오름차순 정렬이 되도록 내부 정렬 기준을 추가해보자 ==> Comparable인터페이스를 구현한다.

class Member implements Comparable<Member>{ //내부정렬 기준을 만드는 인터페이스
	private int num;		//회원번호
	private String name;	//회원이름
	private String tel;		//전화번호
	
	//생성자
	public Member(int num, String name, String tel) {
		super();
		this.num = num;
		this.name = name;
		this.tel = tel;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "Member [num=" + num + ", name=" + name + ", tel=" + tel + "]";
	}
	
	// 회원 이름의 오름차순 정렬 기준 만들기
	@Override
	public int compareTo(Member mem) { //자기 자신과 비교를 한다.
		return name.compareTo(mem.getName());
	}
	
}

//Member의 회원번호(num값)의 내림차순으로 정렬
class numdesc implements Comparator<Member>{

	@Override
	public int compare(Member num1, Member num2) {
		
		// 방법1
//		if(num1.getNum() > num2.getNum()) {
//			return -1;
//		}else if(num1.getNum() < num2.getNum()) {
//			return 1;
//		}else {
//			return 0;
//		}
		
		//Wrapper클래스를 이용하는 방법1
//		return new Integer(num1.getNum()).compareTo(num2.getNum()) * -1; //compareTo는 오름차순을 기본으로 한다.
		
		//Wrapper클래스를 이용하는 방법2
		return Integer.compare(num1.getNum(), num2.getNum()) * -1;
		
	}
}
// 반환값이 0일때   ==> 두 값이 서로 같다.
// 반환값이 양수일때 ==> 두 값의 순서가 바뀐다.
// 반환값이 음수일때 ==> 두 값의 순서가 바뀌지 않는다.












