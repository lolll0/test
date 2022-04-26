package kr.or.ddit.basic.stream;

import java.awt.Panel;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.swing.JFileChooser;

/*
 * 문제) D드라이브의 d_other폴더에 있는 '펭귄.jpg'파일을 
 * D드라이브의 d_other폴더에 있는 '연습용'폴더에 '펭귄_복사본.jpg'파일로 복사하는 프로그램을 작성하시오.
 */

public class FileCopy {

   public static void main(String[] args) {
      FileCopy fc = new FileCopy();

      File file = fc.getSelectFile("OPEN");
      if(file==null) {
         System.out.println("선택한 원본 파일이 없습니다.");
         System.out.println("복사작업 끝");
         return;
      }
      
      File targetFile = fc.getSelectFile("SAVE");
      if(targetFile==null) {
         System.out.println("선택한 대상 파일이 없습니다.");
         System.out.println("복사작업 끝");
         return;
      }
      

      
      try {
         //복사할 파일 스트림 객체 생성
         FileInputStream fin = new FileInputStream(file);
         BufferedInputStream bin = new BufferedInputStream(fin);
         
         //복사될 파일 스트림 객체 생성
//         FileOutputStream fout = new FileOutputStream("d:/d_other/연습용/펭귄_복사본.jpg");
         FileOutputStream fout = new FileOutputStream(targetFile);
         BufferedOutputStream bout = new BufferedOutputStream(fout);
         
         System.out.println("복사 시작");
         
         int data;
         
         while((data = bin.read()) != -1) {
            bout.write(data);
         }
         
         bout.flush();
         
         //스트림 닫기
         bin.close();
         bout.close();
         
         System.out.println("복사 작업 끝");
         
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
   }
   
   //파일을 선택하여 선택한 파일을 반환하는 메서드
   public File getSelectFile(String option) {
      //SWING의 파일 '열기창', '저장창' 연습
      JFileChooser chooser = new JFileChooser(); 
      
      //확장자 목록 중에 '모든 파일' 목록의 표시여부 설정
      //true : 모든 파일목록 보이기, false : 해제
      chooser.setAcceptAllFileFilterUsed(true);
//      chooser.setAcceptAllFileFilterUsed(false);
      
      //Dialog 창이 나타낼 기본 경로 설정
      //예1) 'D:/d_other'폴더로 설정
      chooser.setCurrentDirectory(new File("D:/d_other"));
      //예2) '바탕화면'으로 설정
//      chooser.setCurrentDirectory(new File(System.getProperty("user.home") + "/desktop"));
      
      
      int result;
      if("OPEN".equals(option)) {
         //열기용 창
         result = chooser.showOpenDialog(new Panel());
      }else if("SAVE".equals(option)) {
         //저장용 창
      result = chooser.showSaveDialog(new Panel());
      } else {
         System.out.println("option이 잘못되었습니다.");
         return null;
      }
      
      File selectedFile = null;
      //창에서 '저장' 또는 '열기' 버튼을 클릭했을 때 처리
      if(result == JFileChooser.APPROVE_OPTION) {
         //현재 선탁한 파일 정보를 가져올 수 있다.
         selectedFile = chooser.getSelectedFile();
      }
      return selectedFile;
   }
   

}




