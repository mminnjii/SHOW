package com.kh.show.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.show.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.clio.annotations.Debug;


@Slf4j
public class LoginInterceptor implements HandlerInterceptor{

	
		// 사용자의 요청 처리 전 해당 요청에 대해 간섭
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			
			// 로그인 정보를 가져와 로그인 되어 있는지 판별 후 로그인 되어 있지 않다면 요청 막기 
			HttpSession session = request.getSession();
			
			// 로그인 정보 추출
			Member loginUser = (Member)session.getAttribute("loginUser");
			
			// 로그인 되어 있는지 체크 
			if(loginUser == null) {
				
				session.setAttribute("alertMsg", "회원만 이용 가능한 서비스 입니다.");
				
				response.sendRedirect(request.getContextPath());
				
				// 기존 요청 막기 
				return false;
			}
			
			// return true => 요청 흐름 유지 
			return HandlerInterceptor.super.preHandle(request, response, handler);
		}
	
}
