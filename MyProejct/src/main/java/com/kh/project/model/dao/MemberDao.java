package com.kh.project.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.project.model.vo.Member;

public class MemberDao {

	public Member login(SqlSession sqlSession, Member member) {
		// 설명할게 꽤 많습니다.
		return sqlSession.selectOne("memberMapper.login", member);
	}

}
