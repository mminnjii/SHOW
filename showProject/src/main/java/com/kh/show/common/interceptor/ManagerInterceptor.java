package com.kh.show.common.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kh.show.manager.model.vo.Manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManagerInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	HttpSession session = request.getSession();
    	
        Manager manager = (Manager)request.getSession().getAttribute("loginManager");

        // 관리자 권한이 아니면 접근을 막고, 다른 페이지로 리디렉션
        if (manager.getManagerId() == "admin") {
        	session.setAttribute("alertMsg", "관리자만 이용 가능한 페이지입니다.");
            response.sendRedirect(request.getContextPath());
            return true;
        }
        	return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}