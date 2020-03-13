package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GroundDto;
import model.BranchDetail_Action;
import model.BranchDto;
import model.BranchList_Action;

public class BranchDetail_Service implements Cominterface {
	
	static BranchDetail_Service impl = new BranchDetail_Service();

	public static BranchDetail_Service instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String branch_no = request.getParameter("branch_no");
		BranchDetail_Action branchdetailmodel = BranchDetail_Action.instance();
		ArrayList<GroundDto> GroundList = (ArrayList<GroundDto>) branchdetailmodel.getGroundDetail(branch_no);
		ArrayList<BranchDto> BranchList = (ArrayList<BranchDto>) branchdetailmodel.getBranchDetail(branch_no);

		request.setAttribute("GroundList", GroundList);
		request.setAttribute("BranchList", BranchList);
		return "branchdetail.jsp";

	}
}
