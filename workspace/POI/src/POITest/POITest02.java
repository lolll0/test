package POITest;

import java.awt.Color;
import java.awt.Font;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
//import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.sl.usermodel.TableCell.BorderEdge;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.DefaultIndexedColorMap;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;

public class POITest02 {
	
	// 시트 열 너비 설정
//	// 시트 셀 크기 자동지정
//	int temp = 0;
//	for(int i = 0; i < temp; i++) {
//		sheet.autoSizeColumn(i);
//		sheet.setColumnWidth(i, (sheet.getColumnWidth(i))+512);
//	}
//	
//	// row(행) 순서 변수, cell(셀) 순서 변수
//	int rowCount = 0;
//	int cellCount = 0;
	
	private static final BorderStyle BorderEdge_THIN = null;

	public static void main(String[] args) {
		
		// 주요 메서드 ==> 워크북 및 시트 생성
		// 생성 순서 : 워크북 > 시트 > 로우 > 셀
		
		// 워크북 생성
		SXSSFWorkbook workbook = new SXSSFWorkbook();
		
		// 시트 생성
		SXSSFSheet sheet = workbook.createSheet("시트명");
		
		// 시트 열 너비 지정
		// 첫번째 argument : column 두번째 argument:width
		
		sheet.setColumnWidth(0, 256);
		
		// row(행) 순서 변수, cell(셀) 순서 변수
		int rowCount = 0;
		int cellCount = 0;
		
		// row(행) 생성
		Row row = sheet.createRow(rowCount++);
		
		// cell(셀) 생성
		Cell cell = row.createCell(cellCount++);
		
		// cell(셀)값 입력
		cell.setCellValue("값");
		
		//********** 셀 스타일 및 폰트 설정 **********************
		
		// 셀 Style 정보를 저장할 객체 생성
		CellStyle cellStyle = workbook.createCellStyle();
		
		// Style 정보를 Cell에 입력하기
		cell.setCellStyle(cellStyle);
		
		// Cell 병합
		// CellRangeAddress(첫행, 마지막행, 첫열, 마지막열)
		//sheet.addMergedRegion(new CellRangeAddress(0,0,0,0));
		
		// 정렬
//		cellStyle.setAlignment(cellStyle.ALIGN_CENTER); // 가운데 정렬
//		cellStyle.setAlignment(cellStyle.ALIGN_RIGHT); // 우측 정렬
//		cellStyle.setAlignment(cellStyle.ALIGN_LEFT); // 좌측 정렬
//		cellStyle.setVerticalAlignment(cellStyle.VERTICAL_CENTER); // 높이 가운데 정렬
//		cellStyle.setVerticalAlignment(VerticalAlignment.TOP); // 높이 상단 정렬
		
		// 테두리 선(좌, 우, 위, 아래))
		// BorderStyle
		
//		cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cellStyle.setBorderBottom(BorderStyle.THIN);
//		cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
//		cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
//		cellStyle.setBorderLeft(BorderEdge_THIN);
		
		// 1. 배경 색상 : Color 사용
		// Color(RGB 색상 선택)
 		Color color = new Color(231,234,236); // 그레이색
// 		cellStyle.setFillForegroundColor((color, new DefaultIndexedColorMap()));
		cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		// 2. 배경 색상 : XSSFCellStyle 사용
		XSSFCellStyle xssCellSytle = (XSSFCellStyle) workbook.createCellStyle();
		xssCellSytle.setFillForegroundColor(new XSSFColor(new byte[] {(byte)231, (byte)234, (byte)236}, null));
//		xssCellStyle.setFillPattern(FillPatternType.FINE_DOTS);
		
		// 폰트 설정
		// 폰트 높이는 24, 폰트 종류는 Courier New, 이탈릭체로 설정
//		HSSFFont font = (HSSFFont) workbook.createFont();
//		font.setFontHeightInPoints((short)24);
//		font.setFontName("Courier New");
//		font.setItalic(true);
//		font.setStrikeout(true);
		
		// 설정한 폰트를 스타일에  적용한다.
//		CellStyle style = workbook.createCellStyle();
//		style.setFont(font);
		
//		Cell cell = row.createCell((short)1); 
//		cell.setCellValue("테스트 폰트 입니다.");
//		cell.setCellStyle(style);
//		
		Map<String, Object[]> data = new TreeMap<>();
		data.put("1", new Object[] {"ID", "NAME", "PHONE_NUMBER"});
		data.put("2", new Object[] {"1", "cookie", "010-1111-1111"});
		data.put("3", new Object[] {"2", "sickBBang", "010-2222-2222"});
		data.put("4", new Object[] {"3", "workingAnt", "010-3333-3333"});
		data.put("5", new Object[] {"4", "wow", "010-4444-4444"});
		
		// data에서 keySet를 가져온다. 이 Set값들을 조회하면서 데이터들을 sheet에 입력한다.
		Set<String> keyset = data.keySet();
		int rownum = 0;
		
		// 알아야할 점, TreeMap을 통해 생성된keySet는 for를 조회시키고, 키값이
		// 오름차순으로 조회된다.
		for(String key : keyset) {
			row = sheet.createRow(rownum++);
			Object[] objArr = data.get(key);
			for(Object obj : objArr) {
				cell = row.createCell(rownum++);
				if(obj instanceof String) {
					cell.setCellValue((String)obj);
				}else if(obj instanceof Integer) {
					cell.setCellValue((Integer)obj);
				}
			}
			
		}
		
		try {
			FileOutputStream out = new FileOutputStream(new File("d:/d_other/poi_test_file.xlsx"));
			workbook.write(out);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	
	
	}
		
	}


