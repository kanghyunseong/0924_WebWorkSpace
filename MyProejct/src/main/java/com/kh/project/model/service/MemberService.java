package com.kh.project.model.service;

import org.apache.ibatis.session.SqlSession;

import com.kh.project.common.Template;
import com.kh.project.model.dao.MemberDao;
import com.kh.project.model.vo.Member;

public class MemberService {

	private MemberDao md = new MemberDao();

	public Member login(Member member) {
		// 로그인 처리 -> DAO에 보내서 있나 없네 -> 결과값 반환
		// validateMember(member); 비즈니스 로직.

		SqlSession sqlSession = Template.getSqlSession();

		Member loginMember = md.login(sqlSession, member);

		sqlSession.close();

		return loginMember;
	}

	public void validateMember(Member member) {

		if ((member.getUserId() == null) || member.getUserId().trim().isEmpty()) {
			return;
		}

		String pattern = "^[a-zA-Z0-9]{4,20}$";

		if (!member.getUserId().matches(pattern)) {
			return;
		}

	}

	public int insertMember(Member member) {

		return 0;
	}

}
