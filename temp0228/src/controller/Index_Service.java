package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BranchDto;
import model.BranchList_Action;



public class Index_Service implements Cominterface {
	static Index_Service impl = new Index_Service();

	public static Index_Service instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardListAction.java");
		request.setCharacterEncoding("UTF-8");

		BranchList_Action branchmodel = BranchList_Action.instance();
		ArrayList<BranchDto> BranchList = (ArrayList<BranchDto>) branchmodel.getBranchList();

		request.setAttribute("BranchList", BranchList);
		return "index.jsp";

	}
}
