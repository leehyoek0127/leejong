package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BranchDto;
import model.BranchList_Action;
import model.GroundDto;

public class BranchList_Service implements Cominterface {
	static BranchList_Service impl = new BranchList_Service();

	public static BranchList_Service instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		BranchList_Action branchmodel = BranchList_Action.instance();
		ArrayList<BranchDto> BranchList = (ArrayList<BranchDto>) branchmodel.getBranchList();

		request.setAttribute("BranchList", BranchList);
		return "branchlist.jsp";

	}
}
