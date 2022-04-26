package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.HashSet;

public class Lotto {

	public static void main(String[] args) {
		ArrayList<Integer> numList = new ArrayList<Integer>();
		ArrayList<Integer> userList = new ArrayList<Integer>();
		
		while(true) {
			System.out.println("============");
			System.out.println("Lotto프로그램");
			System.out.println("1. Lotto구입");
			System.out.println("2. 프로그램종료");
			System.out.println("============");
			System.out.println("메뉴선택>");
			int input = ScanUtil.nextInt();
			if(input == 1) {
				System.out.println("Lotto 구입 시작");
				System.out.println("1000원에 로또번호 하나입니다.");
				System.out.println("금액 입력 : ");
				int money = ScanUtil.nextInt();
				if(money > 100000) {
					System.out.println("입력 금액이 너무 많습니다. 로또번호 구입 실패!!!");
					continue;
				}else if(money < 1000) {
					System.out.println("입력 금액이 너무 적습니다. 로또번호 구입 실패!!!");
					continue;
				}
				int count = money / 1000;
				System.out.println("행운의 로또번호는 다음과 같습니다.");
				for(int i = 0; i < count; i++) {
					HashSet<Integer> lottoSet = new HashSet<Integer>();
					while(lottoSet.size() < 6) {
						lottoSet.add((int)(Math.random() * 45 + 1));
					}
					System.out.println("로또번호" + (i+1) + " : " + lottoSet);
				}
				System.out.println("받음 금액은" + money + "원 이고 거스름돈은" + (money - count * 1000) + "원입니다.");
			}else {
				System.out.println("감사합니다.");
				break;
			}
		}

	}

}
