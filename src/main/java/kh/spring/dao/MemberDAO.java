package kh.spring.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	public int login(String id,String pw) {
		String sql = "select count(*) from member where id=? and pw=?";
		return jdbc.queryForObject(sql, Integer.class,id,pw);
	}

}
