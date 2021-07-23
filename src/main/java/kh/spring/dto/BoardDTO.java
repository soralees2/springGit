package kh.spring.dto;

import java.sql.Date;

import lombok.Data;

@Data
	public class BoardDTO {
	  private int seq;
	  private String title;
	  private String contents;
	  private String writer;
	  private Date write_date;
}
