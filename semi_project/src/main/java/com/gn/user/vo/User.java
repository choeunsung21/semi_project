package com.gn.user.vo;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
public class User {
	 private int userNo;
	 private String userId;
	 private String userPw;
	 private String userName;
	 private String userGender;
	 private String userPhone;
	 private String userEmail;
	 private int userType;
	 private int isManager;
	 private Timestamp regDate;
	 private Timestamp modDate;	 
}
