package kh.spring.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	
	  public int contentWrite(int seq, String title, String id, String contents) throws Exception {
	      String sql = "insert into board2 values(board2_seq.nextval, ?, ?, ?, sysdate)";
	      return jdbc.update(sql,seq,title,id,contents);
	            
	   }
}
