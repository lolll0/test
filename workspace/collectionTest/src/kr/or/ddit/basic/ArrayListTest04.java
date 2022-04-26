package kr.or.ddit.basic;

import java.util.ArrayList;

public class ArrayListTest04 {
	
	/*	
	문제2) 5명의 별명을 입력받아 ArrayList에 저장하고 이 별명 중에 제일 긴 별명을 출력하시오.
	(단, 별명의 길이가 같은 것을 입력할 수 있다.)
	*/
	
	public static void main(String[] args) {
		
		ArrayList<String> name = new ArrayList<>();
		for(int i = 0; i < 5; i++) {
			System.out.println("별명을 입력하세요>");
			String str = ScanUtil.nextLine();
			name.add(str);
		}
		System.out.println(name);
		
		//제일 긴 별명의 길이가 저장될 변수
		//  ==> 첫번째 별명의 길이로 초기화한다.
		int maxLength = name.get(0).length();
		for(int i = 1; i < name.size(); i++) {
			if(maxLength < name.get(i).length()) {
				maxLength = name.get(i).length();
			}
		}
		System.out.println("제일 긴 별명들...");
		
		for(String str : name) {
			if(maxLength == str.length()) {
				System.out.println(str);
			}
		}
		
	}

}
