package com.kh.project.member.contorller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.project.model.service.MemberService;
import com.kh.project.model.vo.Member;

@WebServlet("/signUp")
public class signUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public signUpController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String name = request.getParameter("userName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		Member member = new Member();

		member.setUserId(userId);
		member.setUserPwd(userPwd);
		member.setUserName(name);
		member.setEmail(email);
		member.setPhone(phone);

		int result = new MemberService().insertMember(member);

		request.getRequestDispatcher("/WEB-INF/views/common/signUp.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
