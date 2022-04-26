package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;

public class BaseballTest {
	
	/*
	 	문제) Set을 활용하여 숫자 야구 게임  프로그램을 작성하시오.
	 		컴퓨터의 숫자는 난수를 이용해서 구한다.
	 		(스트라이크는 S, 볼은 B로 나타낸다.)
	 		
		예시) 컴퓨터 난수 ==> 9 5 7
		
		실행예시) 숫자입력 : 3 5 6 => 1S 0B
		 	   		    7 8 9 => 0S 2B
	 */
	public static void main(String[] args) {
		
		HashSet<Integer> base = new HashSet<Integer>();
		while(base.size() < 3) {
			base.add((int)(Math.random() * 9) + 1);
		}
		
		ArrayList<Integer> baseList = new ArrayList<Integer>(base);
		
		Collections.shuffle(baseList);
//		System.out.println(baseList);
		int strike, ball;
		int count = 0;
		
		do {
			System.out.print("숫자를 입력하시오>");
			int n1 = ScanUtil.nextInt();
			System.out.print("숫자를 입력하시오>");
			int n2 = ScanUtil.nextInt();
			System.out.print("숫자를 입력하시오>");
			int n3 = ScanUtil.nextInt();
			ArrayList<Integer> userList = new ArrayList<Integer>();
			userList.add(n1);
			userList.add(n2);
			userList.add(n3);
			strike = 0;
			ball = 0;
			for(int i = 0; i < baseList.size(); i++) {
				for(int j = 0; j < userList.size(); j++) {
					if(baseList.get(i) == userList.get(j)) {
						if(i == j) {
							strike++;
						}else {
							ball++;
						}
					}
				}
			}
			System.out.println(strike + "S" + ball + "B");
			count++;
		}while(strike != 3);
		System.out.println("시도 횟수 : " + count + "회");
		System.out.println("게임종료");

	}

}
