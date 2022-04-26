//package kr.or.ddit.basic;
//
//import java.lang.Thread.State;
//import java.lang.reflect.Array;
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.Collections;
//
///*
//	 	10마리의 말들이 경주하는 경마 프로그램 작성하기
//	 	
//	 	말은 Horse라는 이름의 쓰레드 클래스를 작성하는데
//	 	이 클래스는 말이름(String), 등수(int), 현재위치(int)를 멤버변수로 갖는다.
//	 	그리고, 이 클래스에는 등수를 오름차순으로 처리할 수 있는 내부 정렬기준이 있다.
//	 	(Compare인터페이스 구현)
//	 	
//	 	경기 구간은 1 ~ 50 구간으로 되어 있다.
//	 	
//	 	경기가 끝나면 등수 순으로 출력한다.
//	 	
//	 	경기가 진행 중일때는 중간 중간에 말들의 위치를 아래와 같이 나타낸다.
//	 	예)
//	 	01번말 : --->----------------------------------------------
//	 	02번말 : ------>-------------------------------------------
//	 	....
//	 	10번말 : ---->---------------------------------------------
//	 */
//public class ThreadTest13 {
//
//	public static void main(String[] args) {
//		
//		Horse[] hs = new Horse[] {
//			new Horse("01번마"),	
//			new Horse("02번마"),	
//			new Horse("03번마"),	
//			new Horse("04번마"),	
//			new Horse("05번마"),	
//			new Horse("06번마"),	
//			new Horse("07번마"),	
//			new Horse("08번마"),	
//			new Horse("09번마"),	
//			new Horse("10번마")
//		};
//		
//		state st = new state(hs);
//		
//		
//		for(Horse h : hs) {
//			h.start();
//		}
//		st.start();
//		try {
//			st.join();
//		} catch (InterruptedException e) {
//			// TODO: handle exception
//		}
//		
//		for(Horse h : hs) {
//			try {
//				h.join();
//			} catch (InterruptedException e) {
//				// TODO: handle exception
//			}
//		}
//		System.out.println();
//		System.out.println("경기 결과");
//		
//		
////		Arrays.sort(hs);
////		for(Horse h : hs) {
////			System.out.println(h);
////		}
//		ArrayList<Horse>horseList = new ArrayList<Horse>();
//		for(Horse h : hs) {
//			horseList.add(h);
//		}
//		Collections.sort(horseList);
//		for(Horse h : horseList) {
//			System.out.println(h);
//		}
//	}
//
//}
//
//class Horse extends Thread implements Comparable<Horse>{
//	public static int setRank = 1;
//	public String name;
//	public int rank;
//	public int place = 1;
//	
//	public Horse(String name) {
//		super();
//		this.name = name;
//	}
//	
//	
//	
//	public static int getSetRank() {
//		return setRank;
//	}
//
//
//
//	public static void setSetRank(int setRank) {
//		Horse.setRank = setRank;
//	}
//
//
//
//
//
//	public int getRank() {
//		return rank;
//	}
//
//
//
//	public void setRank(int rank) {
//		this.rank = rank;
//	}
//
//
//
//	public int getPlace() {
//		return place;
//	}
//
//
//
//	public void setPlace(int place) {
//		this.place = place;
//	}
//	
//	
//
//
//
//	@Override
//	public String toString() {
//		return "경주마" + name + "은(는)" + rank + "등 입니다.";
//	}
//
//
//
//	@Override
//	public void run() {
//		for(int i = 0; i < 50; i++) {
//			try {
//				Thread.sleep((int)(Math.random() * 1000));
//			} catch (InterruptedException e) {
//				// TODO: handle exception
//			}
//			if(place < 50) {
//				place++;
//			}
//		}
//		System.out.println(name + "경기완료");
//		rank = setRank++;
//		System.out.println("등수 : " + rank);
//	}
//
//	@Override
//	public int compareTo(Horse h) {
//		return Integer.compare(rank, h.rank);
//	}
//	
//	
//}
//
//class state extends Thread{
//	private Horse[] horses;
//
//	public state(Horse[] horses) {
//		super();
//		this.horses = horses;
//	}
//	
//	@Override
//	public void run() {
//		while(true) {
//			if(Horse.setRank==horses.length) {
//				break;
//			}
//			for(int i = 1; i <= 15; i++) {
//				System.out.println();
//			}
//			
//			for(int i = 0; i < horses.length; i++) {
//				System.out.println(horses[i].getName() + " : ");
//				
//				for(int j = 0; j <= 50; j++) {
//					if(horses[i].getPlace() == j) {
//						System.out.print(">");
//					}else {
//						System.out.print("-");
//					}
//				}
//				System.out.println();
//			}
//			try {
//				Thread.sleep(100);
//			} catch (InterruptedException e) {
//				// TODO: handle exception
//			}
//		}
//	}
//	
//	
//	
//	
//}
