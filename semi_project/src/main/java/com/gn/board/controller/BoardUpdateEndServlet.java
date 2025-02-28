package com.gn.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

import com.gn.board.service.BoardService;
import com.gn.board.vo.Attach;
import com.gn.board.vo.Board;


@WebServlet("/boardUpdateEnd")
public class BoardUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public BoardUpdateEndServlet() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				
		
		//1. 요청 시 전달된 데이터를 담을 바구니 생성
				Board board = new Board();
				//Attach attach = new Attach();
				//파일 없이 업로드하고 싶어서 Attach attach를 null로 미리 선언
				Attach attach = null;
				
				//2.파일을 업로드할 경로 설정
				String path = "C:\\upload\\board";
				File dir = new File(path);
				//파일 경로가 존재하지 않는다면 만들어 주는 코드 생성
				if(! dir.exists()) {
					dir.mkdirs();
				}
				
				//3.파일을 업로드 할 저장 공간 정보 세팅
				DiskFileItemFactory factory = new DiskFileItemFactory();
				//(1)저장은 어디에? dir에
				factory.setRepository(dir);
				//(2)파일 크기는 얼마나?
				factory.setSizeThreshold(1024*1024*10);
				
				//4. 요청을 통해 전달된 데이터 읽어오기
				//매개 변수로 세팅한 정보 넣어주기 -> 매개변수는 factory //try ~ catch문 필요
				ServletFileUpload upload = new ServletFileUpload(factory);
				try {
					//요청을 한 것이 매개변수 = request
					List<FileItem> item = upload.parseRequest(request);
					for(int i = 0 ; i < item.size(); i++) {
						FileItem fileItem = item.get(i);
						// (1) 파일이 아닌 폼 내부 요소 -> input type = "text" 아님 "password"
						if(fileItem.isFormField()) {
							switch(fileItem.getFieldName()) {
						case "title" : board.setBoardTitle(fileItem.getString("utf-8")); 
							break;
						case "content" : board.setBoardContent(fileItem.getString("utf-8"));
							break;
						case "writerNo" : board.setWriterNo(Integer.parseInt(fileItem.getString("utf-8")));
							break;
						case "boardNo" : board.setBoardNo(Integer.parseInt(fileItem.getString("utf-8")));
							break;
						case "attachNo" : board.setAttachNo(fileItem.getString("utf-8"));
						System.out.println("테스트 : boardupdateEndServelt " + board.getAttachNo());
							break;
							}
						}else {
							//파일이면 attach를 재할당
							if(fileItem.getSize() > 0) {
								attach = new Attach();
								String oriName = fileItem.getName();
								int idx = oriName.indexOf(".");
								String ext = oriName.substring(idx);
								
								String uuid = UUID.randomUUID().toString().replace("-", "");
								String newName = uuid+ext;
								
								//세팅해준 dir에 넣어주기
								File uploadFile = new File(dir,newName);
								fileItem.write(uploadFile);
								
								attach.setOriName(oriName);
								attach.setNewName(newName);
								attach.setAttachPath(path+"\\"+newName);
//								System.out.println("attachPath: " + attach.getAttachPath());
//								System.out.println("oriName: " + attach.getOriName());
//								System.out.println("newName: " + attach.getNewName());
							}
						}
					}
					int result = new BoardService().writeBoard(board,attach);
					JSONObject obj = new JSONObject();
					
					//null체크
//					if(result > 0) {
//						System.out.println("(BoardWriterEndServlet에 있습니다)게시글이 작성 완료!");
//					}else {
//						System.out.println("게시글이 작성 실패 ㅠㅠ");
//					}
					if(result > 0) {
						obj.put("res_code", 200);
						obj.put("res_msg", "정삭적으로 수정이 되었습니다");
					}else {
						obj.put("res_code", 500);
						obj.put("res_msg", "수정실패");
						if(attach != null) {
						String deletePath = attach.getAttachPath();
						File deleteFile = new File(deletePath);
						if(deleteFile.exists()) {
							deleteFile.delete();
						}
					}
				}
					response.setContentType("application/json; charset=utf-8");
					response.getWriter().print(obj);
				}catch(Exception e){
					e.printStackTrace();
				}
		
		
		
			
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
