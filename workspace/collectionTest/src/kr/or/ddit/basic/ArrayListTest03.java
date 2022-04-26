package kr.or.ddit.basic;

import java.util.ArrayList;

public class ArrayListTest03 {
	/*
	 	문제1) 5명 별명을 입력받아 ArrayList에 저장하고 
	 		이 별명 중에 제일 긴 별명을 출력하시오.
	 		(단, 별명의 길이는 모두 다르게 입력한다.)
	 		
	 	
	 */
	
	public static void main(String[] args) {
		
		ArrayList<String> name = new ArrayList<>();
		for(int i = 0; i < 5; i++) {
			System.out.println("별명을 입력하세요>");
			String str = ScanUtil.nextLine();
			name.add(str);
		}
		System.out.println(name);
		
		//문제1
		//제일 긴 별명이 저장될 변수 선언 ==> List의 첫번째 자료로 초기화 한다.
		String max = name.get(0);  
		for(int i = 1; i < name.size(); i++) {
			if(max.length() < name.get(i).length()) {
				max = name.get(i);
			}
		}
		System.out.println("제일긴 별명 : " + max);
		
		

		
		
		
		
		
		
	}

}
