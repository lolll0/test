package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/*
 *  문제) 학번, 이름(String), 국어점수, 영어점수, 수학점수, 총점, 등수를 멤버로 갖는 Student클래스를 만든다.
 *       이 Student클래스의 생성자에서는 학번, 이름, 국어점수, 영어점수, 수학점수만 매개변수로 받아서 초기화한다.
 *       이 클래스는 학번의 오름차순으로 정렬할 수 있는 내부 정렬 기준을 구현한다.
 *       
 *       이 Student객체는 List에 저장하여 관리한다.
 *       List에 저장된 Student객체를 총점의 역순(내림차순)으로 정렬하는데 총점이 같으면 
 *       이름의 오름차순으로 정렬이되는 외부정렬기준 클래스도 작성하시오. 
 *       
 *       단, 등수는 List에 전체 데이터가 모두 저장된 후에 구한다.
 */
public class StudentTest {

	public static void main(String[] args) {
		StudentTest test = new StudentTest();
		ArrayList<Student> student = new ArrayList<Student>();
		
		student.add(new Student(1,"김기웅",90,63,67));
		student.add(new Student(4,"박태정",70,89,90));
		student.add(new Student(6,"이정규",75,60,68));
		student.add(new Student(3,"강동주",80,40,100));
		student.add(new Student(2,"최민규",65,62,73));
		student.add(new Student(5,"강현수",81,68,79));
		test.setRanking(student);
		
		
		System.out.println("정렬 전...");
		for(Student stu : student) {
			System.out.println(stu);
		}
		
		Collections.sort(student);
		System.out.println("학번 순정렬 후...");
		for(Student stu : student) {
			System.out.println(stu);
		}
		
		Collections.sort(student, new studentSumDesc());
		System.out.println("총점 내림차순 정렬(동점시 이름 오름차순) 후...");
		for(Student stu : student) {
			System.out.println(stu);
		}
		
	}

	//등수를 구하는 메서드
	public void setRanking(ArrayList<Student> student) {
		
		for(Student std1 : student) { //기준이 되는 데이터를 위한 반복문(등수를 구할 값)
			int rank = 1;
			for(Student std2 : student) {//비교 대상을 찾기위한 반복문
				if(std1.getStuSum() < std2.getStuSum()) { //기준보다 큰 값을 만나면 rank 값 증가
					rank++;
				}
			}
			//구해진 등수를 Student객체의 setStuRank변수에 저장
			std1.setStuRank(rank);
		}
	}
}

class Student implements Comparable<Student>{
	private int stuNum;
	private String stuName;
	private int stuKor;
	private int stuEng;
	private int stuMath;
	private int stuSum;
	private int stuRank;
	
	//생성자
	public Student(int stuNum, String stuName, int stuKor, int stuEng, int stuMath) {
		super();
		this.stuNum = stuNum;
		this.stuName = stuName;
		this.stuKor = stuKor;
		this.stuEng = stuEng;
		this.stuMath = stuMath;
		stuSum = stuKor + stuEng + stuMath;
	}
	
	public int getStuSum() {
		return stuSum;
	}

	public void setStuSum(int stuSum) {
		this.stuSum = stuSum;
	}

	public int getStuRank() {
		return stuRank;
	}

	public void setStuRank(int stuRank) {
		this.stuRank = stuRank;
	}

	public int getStuNum() {
		return stuNum;
	}

	public void setStuNum(int stuNum) {
		this.stuNum = stuNum;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public int getStuKor() {
		return stuKor;
	}

	public void setStuKor(int stuKor) {
		this.stuKor = stuKor;
	}

	public int getStuEng() {
		return stuEng;
	}

	public void setStuEng(int stuEng) {
		this.stuEng = stuEng;
	}

	public int getStuMath() {
		return stuMath;
	}

	public void setStuMath(int stuMath) {
		this.stuMath = stuMath;
	}

	@Override
	public String toString() {
		return "Student [stuNum=" + stuNum + ", stuName=" + stuName + ", stuKor=" + stuKor + ", stuEng=" + stuEng
				+ ", stuMath=" + stuMath + ", stuSum=" + stuSum + ", stuRank=" + stuRank + "]";
	}
	@Override
	public int compareTo(Student stu1) {
		return Integer.compare(stuNum, stu1.getStuNum());
	}
}

class studentSumDesc implements Comparator<Student>{
	
	@Override
	public int compare(Student stu1, Student stu2) {
		if(stu1.getStuSum() > stu2.getStuSum()) {
			return -1;
		}else if(stu1.getStuSum() < stu2.getStuSum()) {
			return 1;
		}else {
			return stu1.getStuName().compareTo(stu2.getStuName());
		}
	}
}























