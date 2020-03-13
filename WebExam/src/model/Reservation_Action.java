package model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class Reservation_Action {
	static Reservation_Action model = new Reservation_Action();

	public static Reservation_Action instance() {
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public void insertReservation(ReservationDto ReservationDto) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert("input_reservation", ReservationDto);
		sqlSession.commit();

		sqlSession.close();
	}

}
