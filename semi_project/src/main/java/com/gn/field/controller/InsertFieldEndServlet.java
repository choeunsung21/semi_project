package com.gn.field.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.gn.field.service.FieldService;
import com.gn.field.vo.Dayoff;
import com.gn.field.vo.Field;
import com.gn.field.vo.FieldAttach;

@WebServlet("/insertFieldEnd")
public class InsertFieldEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertFieldEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Field field = new Field();
		Dayoff dayoff = new Dayoff();
		FieldAttach attach = new FieldAttach();
		
		String path = "C:\\upload\\field";
		
		File dir = new File(path);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(dir);
		factory.setSizeThreshold(1024*1024*10);	// 파일 크기는 10mb로 제한
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		/* 필수로 받을거라서 null 일 수가 없는 속성들 */
		int userNo = 0;
		String fieldName = "";
		String fieldAddr = "";
		int fieldLimit = 0;
		String fieldSize = "";
		
		/* 선택적으로 받을거라서 null 일 수도 있는 속성들*/
		String isIndoor = "실내";
		String fieldType = "인조잔디";
		boolean isPark = false;
		boolean isShower = false;
		String rentPrice = null;
		String message = null;

		/* 배열 처리를 위한 배열과 리스트 */
		int[] tempArr = null;
		List<String> tempList = new ArrayList<>();
		
		String temp = null;
		try {
			List<FileItem> items = upload.parseRequest(request);
			
			for(int i=0; i<items.size(); i++) {
				FileItem fileItem = items.get(i);
				
				if(fileItem.isFormField()) {
					switch(fileItem.getFieldName()) {
					case "user_no":
						temp = fileItem.getString("UTF-8");
						if(temp != null) {
							userNo = Integer.parseInt(temp);
						}
						field.setUserNo(userNo);
						break;
					case "field_name":
						fieldName = fileItem.getString("UTF-8");
						field.setFieldName(fieldName);
						break;
					case "field_addr":
						fieldAddr = fileItem.getString("UTF-8");
						field.setFieldAddr(fieldAddr);
						break;
					case "field_limit":
						temp = fileItem.getString("UTF-8");
						if(temp != null && temp.length() != 0) {
							fieldLimit = Integer.parseInt(temp);
						}
						field.setFieldLimit(fieldLimit);
						break;
					case "field_size_width":
						temp = fileItem.getString("UTF-8");
						if(temp != null && temp.length() != 0) {
							fieldSize += temp + "(m)";
						}
						break;
					case "field_size_height":
						temp = fileItem.getString("UTF-8");
						if(temp != null) {
							fieldSize += " x "+temp +"(m)";
						}
						field.setFieldSize(fieldSize);
						break;
					case "is_indoor":
						temp = fileItem.getString("UTF-8");
						if("1".equals(temp)) {
							isIndoor = "실외";
						}
						field.setIsIndoor(isIndoor);
						break;
					case "field_type":
						temp = fileItem.getString("UTF-8");
						if("1".equals(temp)) {
							fieldType = "천연잔디";
						}
						field.setFieldType(fieldType);
						break;
					case "is_park":
						temp = fileItem.getString("UTF-8");
						if("1".equals(temp)) {
							isPark = true;
						}
						field.setIsPark(isPark);
						break;
					case "is_shower":
						temp = fileItem.getString("UTF-8");
						if("1".equals(temp)) {
							isShower = true;
						}
						field.setIsShower(isShower);
						break;
					case "rent_price":
						temp = fileItem.getString("UTF-8");
						if(temp != null && temp.length() != 0) {
							rentPrice = temp;
						}
						field.setRentPrice(rentPrice);
						break;
					case "message":
						temp = fileItem.getString("UTF-8");
						if(temp != null && temp.length() != 0) {
							message = temp;
						}
						field.setMessage(message);
						break;
					case "dayoff_list":
							tempList.add(fileItem.getString("UTF-8"));
						break;
					}	
				} else {
					if(fileItem.getSize() > 0) {
						String oriName = fileItem.getName();
						
						int idx = oriName.lastIndexOf(".");
						String ext = oriName.substring(idx);
						
						String uuid = UUID.randomUUID().toString().replace("-", "");
						String newName = uuid+ext;
						
						File uploadFile = new File(dir, newName);
						fileItem.write(uploadFile);
						
						attach.setOriName(oriName);
						attach.setNewName(newName);
						attach.setFilePath(path+"\\"+newName);	// C:\\upload\\field\\새로운이름.확장자 
					}
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/* dayoff 객체 담아주기 - 배열 관련 후처리 작업*/
		if(!(tempList.isEmpty() || tempList.size() == 0)) {
			tempArr = new int[tempList.size()];
			for(int i=0; i<tempList.size(); i++) {
				tempArr[i] = Integer.parseInt(tempList.get(i));
			}
			
			for(int i=0; i<tempArr.length; i++) {
				switch(tempArr[i]) {
				case 1:
					dayoff.setSun(true);
					break;
				case 2:
					dayoff.setMon(true);
					break;
				case 3:
					dayoff.setTue(true);
					break;
				case 4:
					dayoff.setWed(true);
					break;
				case 5:
					dayoff.setThu(true);
					break;
				case 6:
					dayoff.setFri(true);
					break;
				case 7:
					dayoff.setSat(true);
					break;
				}
			}
		}
		
		/* 서비스로 넘겨서 트랜잭션 처리 */		
		int result = new FieldService().insertField(field, dayoff, attach);
		
		if(result > 0) {
//			System.out.println("InsertFieldEndServlet : 트랜잭션에 성공하였습니다.");
			
			RequestDispatcher view = request.getRequestDispatcher("/views/field/insertField_success.jsp");
			view.forward(request, response);
			
		} else {
//			System.out.println("InsertFieldEndServlet : 트랜잭션에 실패하였습니다.");
			
			String deletePath = attach.getFilePath();
			File deleteFile = new File(deletePath);
			
			if(deleteFile.exists()) {
				deleteFile.delete();
			}
			
			RequestDispatcher view = request.getRequestDispatcher("/views/field/insertField_fail.jsp");
			view.forward(request, response);
		}
		
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
; 