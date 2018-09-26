package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.PaginatedList;
import com.dao.PaginatedListDao;
import com.google.gson.Gson;

@WebServlet("/PaginatedListServlet")
public class PaginatedListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public PaginatedListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		System.out.println("servlet");
		List<PaginatedList> pl=PaginatedListDao.getPaginatedList();
		Gson g=new Gson();
		out.write(g.toJson(pl));
	}


}
