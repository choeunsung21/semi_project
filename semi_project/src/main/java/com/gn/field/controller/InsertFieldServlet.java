package com.gn.field.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.address.service.AddressService;
import com.gn.address.vo.Address;

@WebServlet("/insertField")
public class InsertFieldServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertFieldServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Address> addr1List = new AddressService().selectAddr1All();

		RequestDispatcher view = request.getRequestDispatcher("/views/field/insertField.jsp");
		request.setAttribute("addr1List", addr1List);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
