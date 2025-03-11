package com.gn.address.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.gn.address.service.AddressService;
import com.gn.address.vo.Address;

@WebServlet("/selectAddressEnd")
public class SelectAddressEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectAddressEnd() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String addr1 = request.getParameter("addr1");
		
		List<Address> addr2List = new AddressService().selectAddr2All(addr1);
		
		JSONArray objArray = new JSONArray();
		for(Address addr2 : addr2List) {
			JSONObject obj = new JSONObject();
			obj.put("addr2", addr2.getAddr2());
			objArray.add(obj);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().write(objArray.toJSONString());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
