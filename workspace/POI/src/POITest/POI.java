package POITest;


import org.apache.commons.math3.geometry.partitioning.Region;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.util.CellReference;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.SettingsDocument;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

public class POI {
	
    public static String filePath = "d:/d_other";
    public static String fileNm = "poi_making_file_test.xlsx";

    public static void main(String[] args) {
    	
    	
    	
        // 빈 Workbook 생성
        XSSFWorkbook workbook = new XSSFWorkbook();

        // 빈 Sheet를 생성
        // 시트명을 student data로 설정
        XSSFSheet sheet = workbook.createSheet("student data");
        
//        // 행병합 CellRangeAddress(firstRow, lastRow, firstCol, lastCol);
//        // 행병합은 sheet를 채우기 전에 실행한다.
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 4));
      
        // Sheet를 채우기 위한 데이터들을 Map에 저장
        Map<String, Object[]> data = new TreeMap<>();
       
        
        data.put("0", new Object[] {"성적표"});
        data.put("1", new Object[]{"번호", "이름", "거주지","Java","JSP"});
        data.put("2", new Object[]{"1", "강동주", "대전", "73", ""});
        data.put("3", new Object[]{"2", "강정인", "대전", "62", ""});
        data.put("4", new Object[]{"3", "강현수", "서산", "71", ""});
        data.put("5", new Object[]{"4", "곽성상", "대전", "64", ""});
        data.put("6", new Object[]{"5", "김기웅", "대전", "85", ""});
        data.put("7", new Object[]{"6", "김민지", "대전", "76", ""});
        data.put("8", new Object[]{"7", "김형돈", "대전", "81", ""});
        data.put("9", new Object[]{"8", "노혜지", "대전", "72", ""});
        data.put("10", new Object[]{"9", "박태정", "대전", "93", ""});
        data.put("11", new Object[]{"10", "서난희", "대전", "88", ""});
        data.put("12", new Object[]{"11", "예현의", "대전", "97", ""});
        data.put("13", new Object[]{"12", "오지현", "대전", "86", ""});
        data.put("14", new Object[]{"13", "오혜지", "대전", "66", ""});
        data.put("15", new Object[]{"14", "유정민", "천안", "75", ""});
        data.put("16", new Object[]{"15", "이병진", "수원", "64", ""});
        data.put("17", new Object[]{"16", "이수민", "대전", "70", ""});
        data.put("18", new Object[]{"17", "이슬기", "대전", "83", ""});
        data.put("19", new Object[]{"18", "이유정", "대전", "92", ""});
        data.put("20", new Object[]{"19", "이의찬", "대전", "81", ""});
        data.put("21", new Object[]{"20", "이정규", "대전", "94", ""});
        data.put("22", new Object[]{"21", "이종민", "대전", "75", ""});
        data.put("23", new Object[]{"22", "장문석", "대전", "66", ""});
        data.put("24", new Object[]{"23", "정다영", "대전", "77", ""});
        data.put("25", new Object[]{"24", "최민규", "대전", "68", ""});
        data.put("26", new Object[]{"25", "최혁진", "대전", "69", ""});
        
        // sheet를 두개 만들어서 예제 두개를 보여줌ㄴ
        
        Set<String> keyset = data.keySet();
        int rownum = 0;
        
        for (String key : keyset) {
            Row row = sheet.createRow(rownum++);
            Object[] objArr = data.get(key);
            int cellnum = 0;
            for (Object obj : objArr) {
                Cell cell = row.createCell(cellnum++);
                
              
                // 셀스타일 설정
                CellStyle cellStyle = workbook.createCellStyle();
                
                cell.setCellStyle(cellStyle);
               
                
                
                
                // 셀 스타일 
                cellStyle.setBorderBottom(BorderStyle.DOUBLE); // 셀 아래 스타일 설정
                cellStyle.setBorderLeft(BorderStyle.DASH_DOT); // 셀 왼쪽 스타일 설정
                cellStyle.setBorderRight(BorderStyle.MEDIUM); // 셀 오른쪽 스타일 설정
                cellStyle.setBorderTop(BorderStyle.THIN); // 셀 위쪽 스타일 설정
                //정렬
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                
                // 배경색
                cellStyle.setFillForegroundColor(IndexedColors.YELLOW.getIndex());
                cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
                
       
              
                // 폰트설정
                XSSFFont font = workbook.createFont();
                font.setFontName("나눔고딕");
                font.setFontHeight((short)100);
                font.setColor(IndexedColors.GREEN.getIndex());
                font.setBold(true);
                
                cellStyle.setFont(font);
                

                // b2이전까지의 열을 선택한다.
                CellReference ref = new CellReference("B2");
                
              
                
                // B2열 전까지 선택
                Row r = sheet.getRow(ref.getRow());
                if(r != null) {
                	Cell c = r.getCell(ref.getCol()); // 열의 인덱스 확인
                }else {
                	// 배경색을 설정한다.
                	cellStyle.setFillForegroundColor(IndexedColors.RED.getIndex());
                	// 채우기 적용
                	cellStyle.setFillPattern(FillPatternType.BIG_SPOTS);
                	font.setFontName("테스트"); // 폰트명을 지정한다.
                	font.setFontHeight((short)300); // 폰트 크기를 설정한다.
                	font.setColor(IndexedColors.BLACK.getIndex()); // 폰트 색상을 설정한다.
                	font.setBold(false); // 폰트 굵기
                	row.setHeight((short)500);
                	
                	cellStyle.setFont(font);
                	
                	cellStyle.setBorderBottom(BorderStyle.DOUBLE); // 셀 아래 스타일 설정
                    cellStyle.setBorderLeft(BorderStyle.DASH_DOT); // 셀 왼쪽 스타일 설정
                    cellStyle.setBorderRight(BorderStyle.MEDIUM); // 셀 오른쪽 스타일 설정
                    cellStyle.setBorderTop(BorderStyle.THIN); // 셀 위쪽 스타일 설정
                }
        
                
                if (obj instanceof String) {
                    cell.setCellValue((String)obj);
                } else if (obj instanceof Integer) {
                    cell.setCellValue((Integer)obj);
                }
            }
            
        }
       
        XSSFWorkbook workbook2 = new XSSFWorkbook();
        
        XSSFSheet sheet2 = workbook2.createSheet("text data");
        
       
        Map<String, Object[]>test = new TreeMap<>();
        data.put("1",new Object[] {"번호"});
        int rownum1 =0;
        int cellnum1 = 0;
        Row row2 = sheet2.createRow(rownum1);
        Cell cell2 = row2.createCell(cellnum1);
     
        
        
        
        

////////////////////////////////
        try {
            FileOutputStream out = new FileOutputStream(new File(filePath, fileNm));
            workbook.write(out);
            System.out.println("저장 완료");
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("저장 실패");
        }
  //////////////////////////////////      
        
    }

    	
        
    

}