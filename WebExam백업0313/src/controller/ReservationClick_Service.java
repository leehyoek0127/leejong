package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BranchDetail_Action;
import model.BranchDto;
import model.GroundDto;

public class ReservationClick_Service implements Cominterface{
	
	static ReservationClick_Service impl = new ReservationClick_Service();

	public static ReservationClick_Service instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String branch_no = request.getParameter("branch_no");
		BranchDetail_Action branchdetailmodel = BranchDetail_Action.instance();
		ArrayList<GroundDto> GroundList = (ArrayList<GroundDto>) branchdetailmodel.getGroundDetail(branch_no);

		request.setAttribute("GroundList", GroundList);
		return "reservation.jsp";

	}

}
