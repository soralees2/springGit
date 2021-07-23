package kh.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kh.spring.dto.BoardDTO;

@Repository
public class BoardDAO {

   @Autowired
   private JdbcTemplate jdbc;


   // 게시판에 글쓰기
   public int contentWrite(String title, String contents, String id) throws Exception {
      String sql = "insert into board2 values(board2_seq.nextval, ?, ?, ?, sysdate)";
      return jdbc.update(sql,title,contents,id);
            
   }


   public List<BoardDTO> selectAll() {
      String sql = "select * from board2";
      return jdbc.query(sql,new RowMapper<BoardDTO>(){
         @Override
         public BoardDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
            BoardDTO dto = new BoardDTO();
            dto.setSeq(rs.getInt("seq"));
            dto.setTitle(rs.getString("title"));
            dto.setContents(rs.getString("contents"));
            dto.setWriter(rs.getString("writer"));
            dto.setWrite_date(rs.getDate("write_date"));
            return dto;

         }
      });
   }
   
}