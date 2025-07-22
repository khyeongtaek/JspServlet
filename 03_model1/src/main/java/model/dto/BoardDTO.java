package model.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardDTO {
    private int bid;
    private UserDTO user;  //------------ uid, nickname 관리
    private String title;
    private String content;
    private Timestamp createdAt;  //----- MySQL's TIMESTAMP 타입은 java.sql.Timestamp 클래스 타입으로 처리합니다.
    private Timestamp modifiedAt;
}
