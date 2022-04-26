package kr.or.ddit.basic.stream;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/*
 	문제) D드라이브의 d_other폴더에 있는 '펭귄.jpg'파일을
 		 D드라이브의 d_other폴더에 있는 '연습용'폴더에 '펭귄_복사본.jpg'파일로
 		 복사하는 프로그램을 작성하시오.
 */
public class FileCopy01 {

	public static void main(String[] args) {
		
		
		
		try {
			FileInputStream fin = new FileInputStream("d:/d_other/펭귄.jpg");
			
			FileOutputStream fout = new FileOutputStream("D:\\D_Other\\연습용\\펭귄_복사본.jpg");
			
			int c;
			System.out.println("복사시작");
			while((c=fin.read())!=-1) {
				fout.write(c);
			}
			System.out.println("복사완료");
			fout.close();
			fin.close();
		} catch (IOException e) {
			// TODO: handle exception
		}
		
	}

}
