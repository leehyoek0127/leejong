package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BranchDto;
import model.GroundDto;
import model.ReservationClick_Action;

public class ReservationClick_Service implements Cominterface{
	
	static ReservationClick_Service impl = new ReservationClick_Service();

	public static ReservationClick_Service instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String branch_no = request.getParameter("branch_no");
		ReservationClick_Action reservationclick_model = ReservationClick_Action.instance();
		ArrayList<GroundDto> GroundList = (ArrayList<GroundDto>) reservationclick_model.reservation_ground(branch_no);
		ArrayList<BranchDto> BranchList = (ArrayList<BranchDto>) reservationclick_model.reservation_branch(branch_no);

		request.setAttribute("GroundList", GroundList);
		request.setAttribute("BranchList", BranchList);
		return "reservation.jsp";

	}

}
