package com.kh.show.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.chat.model.vo.Chat;
import com.kh.show.chat.model.vo.ChatJoin;
import com.kh.show.common.template.PageInfo;
import com.kh.show.customer.model.vo.Question;
import com.kh.show.meeting.model.vo.Meeting;
import com.kh.show.meeting.model.vo.MeetingJoin;
import com.kh.show.member.model.vo.Coupon;
import com.kh.show.member.model.vo.Member;
import com.kh.show.reservation.model.vo.Reservation;
import com.kh.show.showInfo.model.vo.Review;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck",checkId);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember",m);
	}

	public int memberAddress(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("memberMapper.memberAddress", map);
	}

	public int pwdCheck(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.pwdCheck",map);
	}

	public String memberPwd(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.memberPwd",userId);
	}

	public int updatePassword(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePassword",m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.deleteMember",userId);
	}

	public String findId(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.findId",map);
	}

	public int findPwd(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.findPwd",map);
	}

	public int updateNewPassword(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("memberMapper.updateNewPassword",map);
	}

	public int startSub(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.startSub",userId);
	}

	public int listCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.listCount",userNo);
	}

	public ArrayList<Question> qnaList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.qnaList",userNo, rowbounds);
	}

	public int rListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.rListCount",userNo);
	}

	public ArrayList<Review> reviewList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset,limit);

		return (ArrayList)sqlSession.selectList("memberMapper.reviewList",userNo, rowbounds);
	}

	public int sListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.sListCount",userNo);
	}

	public ArrayList<Reservation> showList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.mshowList",userNo,rowbounds);
	}

	public int couponCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.couponCount",userNo);
	}

	public ArrayList<Coupon> couponList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.couponList",userNo);
	}

	public int pListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.pListCount",userNo);
	}

	public ArrayList<Reservation> payList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("memberMapper.payList",userNo,rowbounds);
	}

	public int reserveCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.reserveCount",userNo);
	}

	public ArrayList<Reservation> reserveList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("memberMapper.reserveList",userNo,rowbounds);
	}

	public int cancelRes(SqlSessionTemplate sqlSession, String reservationId) {
		return sqlSession.update("memberMapper.cancelRes",reservationId);
	}

	public int cancelTicket(SqlSessionTemplate sqlSession, String reservationId) {
		return sqlSession.update("memberMapper.cancelTicket",reservationId);
	}

	public int cancelPay(SqlSessionTemplate sqlSession, String reservationId) {
		return sqlSession.update("memberMapper.cancelPay", reservationId);
	}

	public int rollbackSeats(SqlSessionTemplate sqlSession, int seatId) {
		return sqlSession.update("memberMapper.rollbackSeats",seatId);
	}

	public int phoneCheck(SqlSessionTemplate sqlSession, String phone) {
		return sqlSession.selectOne("memberMapper.phoneCheck",phone);
	}

	public int chatCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.chatJoinCount",userNo);
	}

	public ArrayList<ChatJoin> chatList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("memberMapper.chatJoinList",userNo,rowbounds);
	}

	public int chatCount2(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.chatHostCount",userNo);
	}

	public ArrayList<Chat> chatList2(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("memberMapper.chatHostList",userNo,rowbounds);
	}

	public int meetingCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.meetingJoinCount",userNo);
	}

	public ArrayList<MeetingJoin> meetingList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("memberMapper.meetingJoinList",userNo,rowbounds);
	}

	public int meetingCount2(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.meetingHostCount",userNo);
	}

	public ArrayList<Meeting> meetingList2(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("memberMapper.meetingHostList",userNo,rowbounds);
	}

	public int cancelCoupon(SqlSessionTemplate sqlSession, int couponNo) {
		return sqlSession.update("memberMapper.cancelCoupon",couponNo);
	}

	public int cancelSub(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapper.cancelSub",userNo);
	}


}
