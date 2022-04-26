package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Scanner;

/*
  문제) 5명의 사람 이름을 입력받아 ArrayList에 저장한 후 이들 중 '김'씨 성의 이름을 모두 출력하시오
  	   (입력은 Scanner객체를 이용한다.)
 */
public class ArrayListTest02 {
		
	public static void main(String[] args) {
		
		ArrayList<String> name = new ArrayList<>();
		for(int i = 0; i < 5; i++) {
			System.out.println("이름을 입력하세요>");
			String str = ScanUtil.nextLine();
			name.add(str);
		}
		System.out.println(name);
		System.out.println();
		for(int i = 0; i < name.size(); i++) {
			if(name.get(i).indexOf("김") == 0) {
				System.out.println(name.get(i));
			}
		}
		System.out.println();
		for(int i = 0; i < name.size(); i++) {
			if(name.get(i).charAt(0) == '김') {
				System.out.println(name.get(i));
			}
		}
		System.out.println();
		for(int i = 0; i < name.size(); i++) {
			if(name.get(i).substring(0, 1).equals("김")) {
				System.out.println(name.get(i));
			}
		}
		System.out.println();
	    for(int i = 0; i < name.size(); i++) {
	    	if(name.get(i).startsWith("김") == true) { //==true를 생략해도 된다.
	    		System.out.println(name.get(i));
	    	}
	    }
	    
	    
		
		
		
		
		
	}

}
