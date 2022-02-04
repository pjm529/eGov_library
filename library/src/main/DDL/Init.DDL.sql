create database library;

use library;

-- 회원 테이블
CREATE TABLE `member` (
  	`user_id`             VARCHAR(20)   NOT NULL COMMENT '회원아이디', -- 회원아이디
	`user_pw`             VARCHAR(1024) NOT NULL COMMENT '회원비밀번호', -- 회원비밀번호
	`user_name`           VARCHAR(50)   NOT NULL COMMENT '회원명', -- 회원명
	`user_birth`          DATE          NOT NULL COMMENT '회원생년월일', -- 회원생년월일
	`user_tel`            VARCHAR(30)   NOT NULL COMMENT '회원전화번호', -- 회원전화번호
	`user_email`          VARCHAR(40)   NOT NULL COMMENT '회원이메일', -- 회원이메일
	`user_zip`            VARCHAR(10)   NOT NULL COMMENT '회원우편번호', -- 회원우편번호
	`user_address`        VARCHAR(255)  NOT NULL COMMENT '회원주소', -- 회원주소
	`user_address_detail` VARCHAR(255)  NOT NULL COMMENT '회원상세주소', -- 회원상세주소
	`user_able_loan`      INT(11)       NOT NULL DEFAULT 10 COMMENT '대출가능도서수', -- 대출가능도서수
	`user_book_count`     INT(11)       NOT NULL DEFAULT 0 COMMENT '대출중도서수', -- 대출중도서수
	`user_overdue_date`   INT(11)       NOT NULL DEFAULT 0 COMMENT '대출정지일수', -- 대출정지일수
	`enabled`             TINYINT(1)    NOT NULL DEFAULT 1 COMMENT '권한', -- 권한
	`user_reg_date`       TIMESTAMP     NOT NULL DEFAULT current_timestamp() COMMENT '회원가입일' -- 회원가입일
  	PRIMARY KEY (`user_id`)
);

-- 회원 권한 테이블
CREATE TABLE `member_auth` (
  	`user_id` VARCHAR(20)  NOT NULL COMMENT '회원ID', -- 회원ID
	`auth`    VARCHAR(100) NOT NULL COMMENT '권한' -- 권한
	KEY `fk_member_auth_user_id` (`user_id`),
	CONSTRAINT `fk_member_auth_userid` FOREIGN KEY (`user_id`) REFERENCES `member` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 탈퇴 회원 테이블
CREATE TABLE `secession_member` (
  	`user_id`    VARCHAR(20) NOT NULL COMMENT '회원아이디', -- 회원아이디
	`user_email` VARCHAR(40) NOT NULL COMMENT '회원이메일', -- 회원이메일
	`reg_date`   TIMESTAMP   NOT NULL DEFAULT current_timestamp() COMMENT '탈퇴일' -- 탈퇴일
	PRIMARY KEY (`user_id`)
);

-- 대출 내역 테이블 
CREATE TABLE `loan_history` (
	`loan_no`        INT(11)       NOT NULL AUTO_INCREMENT COMMENT '대출번호', -- 대출번호
	`user_id`        VARCHAR(20)   NOT NULL COMMENT '대출자아이디', -- 대출자아이디
	`user_email`     VARCHAR(40)   NOT NULL COMMENT '대출자이메일', -- 대출자이메일
	`book_title`     VARCHAR(100)  NOT NULL COMMENT '대출도서명', -- 대출도서명
	`book_author`    VARCHAR(200)  NOT NULL COMMENT '대출도서저자', -- 대출도서저자
	`book_isbn`      VARCHAR(20)   NOT NULL COMMENT '대출도서ISBN', -- 대출도서ISBN
	`book_cover`     VARCHAR(2000) NULL     DEFAULT NULL COMMENT '대출도서표지', -- 대출도서표지
	`book_pubdate`   VARCHAR(20)   NOT NULL COMMENT '대출도서출간일', -- 대출도서출간일
	`book_publisher` VARCHAR(50)   NOT NULL COMMENT '대출도서출판사', -- 대출도서출판사
	`loan_date`      TIMESTAMP     NOT NULL DEFAULT current_timestamp() COMMENT '도서대출일', -- 도서대출일
	`return_date`    TIMESTAMP     NULL     DEFAULT NULL COMMENT '도서반납일', -- 도서반납일
	`return_period`  TIMESTAMP     NOT NULL DEFAULT current_timestamp() COMMENT '반납예정일', -- 반납예정일
	`return_status`  TINYINT(1)    NOT NULL DEFAULT 0 COMMENT '반납상태' -- 반납상태
  	PRIMARY KEY (`loan_no`),
 	KEY `loan_history_FK` (`user_id`),
 	CONSTRAINT `loan_history_FK` FOREIGN KEY (`user_id`) REFERENCES `member` (`user_id`)
);

-- 희망 도서 테이블
CREATE TABLE `hope` (
	`hope_no`        INT(11)       NOT NULL AUTO_INCREMENT COMMENT '희망도서번호', -- 희망도서번호
	`user_id`        VARCHAR(20)   NOT NULL COMMENT '신청자아이디', -- 신청자아이디
	`book_title`     VARCHAR(100)  NOT NULL COMMENT '희망도서명', -- 희망도서명
	`book_author`    VARCHAR(200)  NOT NULL COMMENT '희망도서저자', -- 희망도서저자
	`book_publisher` VARCHAR(50)   NOT NULL COMMENT '희망도서출판사', -- 희망도서출판사
	`book_pubdate`   VARCHAR(20)   NOT NULL COMMENT '희망도서출간일', -- 희망도서출간일
	`book_isbn`      VARCHAR(20)   NULL     DEFAULT NULL COMMENT '희망도서ISBN', -- 희망도서ISBN
	`note`           VARCHAR(1024) NULL     DEFAULT NULL COMMENT '비고', -- 비고
	`book_price`     VARCHAR(20)   NULL     DEFAULT NULL COMMENT '희망도서가격', -- 희망도서가격
	`hope_status`    TINYINT(1)    NOT NULL DEFAULT 0 COMMENT '처리상태', -- 처리상태
	`cancel_reason`  VARCHAR(100)  NULL     DEFAULT NULL COMMENT '취소사유', -- 취소사유
	`hope_reg_date`  TIMESTAMP     NOT NULL DEFAULT current_timestamp() COMMENT '희망도서신청일' -- 희망도서신청일
);

-- 추천 도서 테이블
CREATE TABLE `recommend_book` (
	`rec_no`         INT(11)       NOT NULL AUTO_INCREMENT COMMENT '추천도서번호', -- 추천도서번호
	`user_id`        VARCHAR(20)   NOT NULL COMMENT '등록자아이디', -- 등록자아이디
	`book_title`     VARCHAR(100)  NOT NULL COMMENT '추천도서명', -- 추천도서명
	`book_author`    VARCHAR(200)  NOT NULL COMMENT '추천도서저자', -- 추천도서저자
	`book_isbn`      VARCHAR(20)   NOT NULL COMMENT '추천도서ISBN', -- 추천도서ISBN
	`book_cover`     VARCHAR(2000) NOT NULL COMMENT '추천도서표지', -- 추천도서표지
	`book_pubdate`   VARCHAR(20)   NOT NULL COMMENT '추천도서출간일', -- 추천도서출간일
	`book_publisher` VARCHAR(50)   NOT NULL COMMENT '추천도서출판사', -- 추천도서출판사
	`recommend_date` TIMESTAMP     NOT NULL DEFAULT current_timestamp() COMMENT '추천도서등록일' -- 추천도서등록일
	PRIMARY KEY (`rec_no`),
	KEY `recommend_book_FK` (`user_id`),
	CONSTRAINT `recommend_book_FK` FOREIGN KEY (`user_id`) REFERENCES `member` (`user_id`)
);

-- 열람실 테이블
CREATE TABLE `reading_room` (
	`seat_no`       INT(11)     NOT NULL COMMENT '좌석번호', -- 좌석번호
	`user_id`       VARCHAR(20) NULL     DEFAULT NULL COMMENT '이용자아이디', -- 이용자아이디
	`checkin_time`  TIMESTAMP   NULL     DEFAULT NULL COMMENT '입실시간', -- 입실시간
	`checkout_time` TIMESTAMP   NULL     DEFAULT NULL COMMENT '퇴실예정시간' -- 퇴실예정시간
	PRIMARY KEY (`seat_no`),
	KEY `reading_room_FK` (`user_id`),
	CONSTRAINT `reading_room_FK` FOREIGN KEY (`user_id`) REFERENCES `member` (`user_id`) ON DELETE SET NULL
);

-- 도서관 일정 테이블
CREATE TABLE `calendar` (
	`cal_no`          INT(11)       NOT NULL AUTO_INCREMENT COMMENT '일정번호', -- 일정번호
	`groupId`         INT(11)       NOT NULL COMMENT '그룹ID', -- 그룹ID
	`user_id`         VARCHAR(20)   NOT NULL COMMENT '등록자ID', -- 등록자ID
	`title`           VARCHAR(1024) NOT NULL COMMENT '일정명', -- 일정명
	`start`           DATE          NOT NULL COMMENT '시작시간', -- 시작시간
	`end`             DATE          NOT NULL COMMENT '종료시간', -- 종료시간
	`allDay`          TINYINT(1)    NOT NULL DEFAULT 1 COMMENT 'allDay', -- allDay
	`textColor`       VARCHAR(50)   NOT NULL DEFAULT "black" COMMENT '글자색상', -- 글자색상
	`backgroundColor` VARCHAR(50)   NOT NULL DEFAULT "none" COMMENT '배경색상', -- 배경색상
	`borderColor`     VARCHAR(50)   NOT NULL DEFAULT "none" COMMENT '외곽선색상', -- 외곽선색상
	`reg_date`        TIMESTAMP     NOT NULL DEFAULT 'current_timestamp()' COMMENT '일정등록일' -- 일정등록일
  	PRIMARY KEY (`cal_no`),
 	KEY `calendar_FK` (`user_id`),
  	CONSTRAINT `calendar_FK` FOREIGN KEY (`user_id`) REFERENCES `member` (`user_id`)
);

-- 공지사항 테이블
CREATE TABLE `notice` (
	`notice_no`          INT(11)       NOT NULL AUTO_INCREMENT COMMENT '공지사항번호', -- 공지사항번호
	`notice_title`       VARCHAR(1024) NOT NULL COMMENT '공지사항제목', -- 공지사항제목
	`notice_content`     VARCHAR(8196) NOT NULL COMMENT '공지사항내용', -- 공지사항내용
	`writer_id`          VARCHAR(20)   NOT NULL COMMENT '작성자아이디', -- 작성자아이디
	`writer_name`        VARCHAR(50)   NOT NULL COMMENT '작성자명', -- 작성자명
	`notice_reg_date`    TIMESTAMP     NOT NULL DEFAULT current_timestamp() COMMENT '공지사항작성일', -- 공지사항작성일
	`notice_modify_date` TIMESTAMP     NULL     DEFAULT NULL COMMENT '공지사항수정일', -- 공지사항수정일
	`notice_views`       INT(11)       NOT NULL DEFAULT 0 COMMENT '공지사항조회수' -- 공지사항조회수
  	PRIMARY KEY (`notice_no`),
  	KEY `notice_FK` (`writer_id`),
  	CONSTRAINT `notice_FK` FOREIGN KEY (`writer_id`) REFERENCES `member` (`user_id`)
);

-- 댓글 테이블
CREATE TABLE `reply` (
	`reply_no` INT(11) 		NOT NULL AUTO_INCREMENT COMMENT '댓글번호', -- 댓글번호
	`notice_no` INT(11) 		NOT NULL COMMENT '공지사항번호', -- 공지사항번호
	`reply_content` VARCHAR(8196) 	NOT NULL COMMENT '댓글내용', -- 댓글내용
	`writer_id` VARCHAR(20) 	NULL	 DEFAULT NULL COMMENT '작성자아이디', -- 작성자아이디
	`writer_name` VARCHAR(50) 	NOT NULL COMMENT '작성자명', -- 작성자명
	`reply_reg_date` TIMESTAMP	NOT NULL DEFAULT current_timestamp() COMMENT '댓글작성일', -- 댓글작성일
	`reply_modify_date` TIMESTAMP 	NULL     DEFAULT NULL COMMENT '댓글수정일', -- 댓글수정일
	`parent_no` INT(11) 		NOT NULL DEFAULT 0 COMMENT '부모댓글번호', -- 부모댓글번호
	`depth` INT(11) 		NOT NULL DEFAULT 0 COMMENT '깊이', -- 깊이
	`order_id` INT(11) 		NOT NULL COMMENT '순서', -- 순서
	`group_id` INT(11) 		NOT NULL COMMENT '그룹', -- 그룹
	`delete_flag` TINYINT(1) 	NOT NULL DEFAULT 0 COMMENT '삭제상태', -- 삭제상태
	PRIMARY KEY (`reply_no`), 
	KEY `FK_reply_member` (`writer_id`),
  	CONSTRAINT `FK_reply_member` FOREIGN KEY (`writer_id`) REFERENCES `member` (`user_id`) ON UPDATE CASCADE ON DELETE SET NULL,
	KEY `FK_reply_notice` (`notice_no`),
  	CONSTRAINT `FK_reply_notice` FOREIGN KEY (`notice_no`) REFERENCES `notice` (`notice_no`) ON UPDATE CASCADE ON DELETE CASCADE
);

-- 공지사항 첨부파일 테이블
CREATE TABLE `notice_attach_file` (
	`uuid`        VARCHAR(500)  NOT NULL COMMENT 'uuid', -- uuid
	`upload_path` VARCHAR(4096) NOT NULL COMMENT '업로드경로', -- 업로드경로
	`file_name`   VARCHAR(100)  NOT NULL COMMENT '파일명', -- 파일명
	`file_type`   CHAR(1)       NULL     DEFAULT '1' COMMENT '파일타입', -- 파일타입
	`notice_no`   INT(11)       NOT NULL COMMENT '공지사항번호' -- 공지사항번호
  	PRIMARY KEY (`uuid`),
  	KEY `notice_no` (`notice_no`),
  	CONSTRAINT `notice_attach_file_ibfk_1` FOREIGN KEY (`notice_no`) REFERENCES `notice` (`notice_no`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 분실물 테이블
CREATE TABLE `article` (
	`article_no`          INT(11)       NOT NULL AUTO_INCREMENT COMMENT '분실물번호', -- 분실물번호
	`article_title`       VARCHAR(1024) NOT NULL COMMENT '분실물제목', -- 분실물제목
	`article_content`     VARCHAR(8196) NOT NULL COMMENT '분실물내용', -- 분실물내용
	`writer_id`           VARCHAR(20)   NOT NULL COMMENT '작성자아이디', -- 작성자아이디
	`writer_name`         VARCHAR(50)   NOT NULL COMMENT '작성자명', -- 작성자명
	`article_reg_date`    TIMESTAMP     NOT NULL DEFAULT current_timestamp() COMMENT '분실물등록일', -- 분실물등록일
	`article_modify_date` TIMESTAMP     NULL     DEFAULT NULL COMMENT '분실물수정일', -- 분실물수정일
	`article_views`       INT(11)       NOT NULL DEFAULT 0 COMMENT '분실물조회수' -- 분실물조회수
  	PRIMARY KEY (`article_no`),
  	KEY `article_FK` (`writer_id`),
  	CONSTRAINT `article_FK` FOREIGN KEY (`writer_id`) REFERENCES `member` (`user_id`)
);

-- 문의사항 테이블
CREATE TABLE `enquiry` (
	`enquiry_no`          INT(11)       NOT NULL AUTO_INCREMENT COMMENT '질문번호', -- 질문번호
	`enquiry_title`       VARCHAR(1024) NOT NULL COMMENT '질문제목', -- 질문제목
	`enquiry_content`     VARCHAR(8196) NOT NULL COMMENT '질문내용', -- 질문내용
	`writer_id`           VARCHAR(20)   NOT NULL COMMENT '작성자아이디', -- 작성자아이디
	`writer_name`         VARCHAR(50)   NOT NULL COMMENT '작성자명', -- 작성자명
	`enquiry_hits`        INT(11)       NOT NULL DEFAULT 0 COMMENT '질문조회수', -- 질문조회수
	`enquiry_reg_date`    TIMESTAMP     NOT NULL DEFAULT current_timestamp() COMMENT '질문등록일', -- 질문등록일
	`enquiry_modify_date` TIMESTAMP     NULL     DEFAULT NULL COMMENT '질문수정일' -- 질문수정일
  	PRIMARY KEY (`enquiry_no`),
  	KEY `enquiry_FK` (`writer_id`),
  	CONSTRAINT `enquiry_FK` FOREIGN KEY (`writer_id`) REFERENCES `member` (`user_id`)
);

-- 답변 테이블
CREATE TABLE `answer` (
	`answer_no`          INT(11)       NOT NULL AUTO_INCREMENT COMMENT '답변번호', -- 답변번호
	`enquiry_no`         INT(11)       NOT NULL COMMENT '질문번호', -- 질문번호
	`answer_title`       VARCHAR(1024) NOT NULL COMMENT '답변제목', -- 답변제목
	`answer_content`     VARCHAR(8196) NOT NULL COMMENT '단변내용', -- 단변내용
	`a_writer_id`        VARCHAR(20)   NOT NULL COMMENT '답변작성자아이디', -- 답변작성자아이디
	`a_writer_name`      VARCHAR(50)   NOT NULL COMMENT '답변작성자명', -- 답변작성자명
	`answer_hits`        INT(11)       NOT NULL DEFAULT 0 COMMENT '답변조회수', -- 답변조회수
	`answer_reg_date`    TIMESTAMP     NOT NULL DEFAULT current_timestamp() COMMENT '답변등록일', -- 답변등록일
	`answer_modify_date` TIMESTAMP     NULL     DEFAULT NULL COMMENT '답변수정일' -- 답변수정일
  	PRIMARY KEY (`answer_no`),
  	KEY `fk_answer_enquiry_no` (`enquiry_no`),
  	KEY `answer_FK` (`a_writer_id`),
  	CONSTRAINT `answer_FK` FOREIGN KEY (`a_writer_id`) REFERENCES `member` (`user_id`),
  	CONSTRAINT `fk_answer_enquiry_no` FOREIGN KEY (`enquiry_no`) REFERENCES `enquiry` (`enquiry_no`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 배너 테이블
CREATE TABLE `banner` (
	`user_id`  VARCHAR(20)   NOT NULL COMMENT '등록자ID', -- 등록자ID
	`path`     VARCHAR(4096) NOT NULL COMMENT '배너경로', -- 배너경로
	`reg_date` TIMESTAMP     NOT NULL DEFAULT current_timestamp() COMMENT '배너등록일' -- 배너등록일
  	KEY `banner_FK` (`user_id`),
  	CONSTRAINT `banner_FK` FOREIGN KEY (`user_id`) REFERENCES `member` (`user_id`)
);


-- 이벤트 출력
show variables like 'event%';

-- 이벤트 활성화
set global event_scheduler = on;

-- 등록 된 이벤트 출력
select * from information_schema.EVENTS;


-- 대출 불가 일수 -1
DELIMITER //
CREATE PROCEDURE overdue_decrease()
begin
   update member 
     set user_overdue_date = user_overdue_date - 1
   where user_overdue_date > 0;
END //

-- 자정마다 대출 불가 일수 -1 하는 이벤트
create event overdue_decrease
on schedule every 1 day
starts '2021-12-04 00:00:00'
comment '대출 불가 일 수'
do
call overdue_decrease(); 

-- 열람실 퇴실 프로시저
DELIMITER //
CREATE PROCEDURE seat_check()
begin
   update reading_room
      set user_id = null, checkin_time = null, checkout_time = null
    where checkout_time <= current_time;
END //

-- 열람실 실시간 검사 후 퇴실 처리하는 이벤트
create event check_seat
on schedule every 1 second
comment '열람실 실시간 검사'
do
call seat_check(); 

-- 공지사항 삭제 시 공지사항 번호 정렬
DELIMITER //
CREATE PROCEDURE notice_reset()
begin
   SET @CNT = 0;
   UPDATE notice SET notice.notice_no = @CNT:=@CNT+1;
   set @max = (SELECT MAX(notice_no)+ 1 FROM notice); 
   set @str = CONCAT('ALTER TABLE notice AUTO_INCREMENT = ', @max);
   PREPARE qry FROM @str;
   EXECUTE qry;
   DEALLOCATE PREPARE qry;
END //



-- 문의사항 삭제 시 문의사항 번호 정렬
DELIMITER //
CREATE PROCEDURE enquiry_reset()
begin
   SET @CNT = 0;
   UPDATE enquiry SET enquiry.enquiry_no = @CNT:=@CNT+1;
   set @max = (SELECT MAX(enquiry_no)+ 1 FROM enquiry); 
   set @str = CONCAT('ALTER TABLE enquiry AUTO_INCREMENT = ', @max);
   PREPARE qry FROM @str;
   EXECUTE qry;
   DEALLOCATE PREPARE qry;
END //

-- 답변 삭제 시 답변 번호 정렬
DELIMITER //
CREATE PROCEDURE answer_reset()
begin
   SET @CNT = 0;
   UPDATE answer SET answer.answer_no = @CNT:=@CNT+1;
   set @max = (SELECT MAX(enquiry_no)+ 1 FROM enquiry); 
    set @str = CONCAT('ALTER TABLE answer AUTO_INCREMENT = ', @max);
    PREPARE qry FROM @str;
    EXECUTE qry;
    DEALLOCATE PREPARE qry;
END //

-- 분실물 찾기 삭제 시 분실물 찾기 번호 정렬
DELIMITER //
CREATE PROCEDURE article_reset()
begin
   SET @CNT = 0;
   UPDATE article SET article.article_no = @CNT:=@CNT+1;
   set @max = (SELECT MAX(article_no)+ 1 FROM article); 
    set @str = CONCAT('ALTER TABLE article AUTO_INCREMENT = ', @max);
    PREPARE qry FROM @str;
    EXECUTE qry;
    DEALLOCATE PREPARE qry;
END //

-- 초기 관리자 계정 설정
-- id : admin
-- pw : zxcvzxcv

insert into member values
("admin", "$2a$10$oyw6645fwRPh9BOpgsVzZuqkSQr1N/b8UGE25hiU0ww7kEQ/e.YPW", "관리자", "2021-12-06", "01000000000",
"library.raon@gmail.com", "63309", "제주특별자치도 제주시 첨단로 242 (영평동)", "1", 10, 0, 0, 1, current_timestamp);
insert into member_auth values("admin", "ROLE_MEMBER");
insert into member_auth values("admin", "ROLE_ADMIN");
insert into member_auth values("admin", "ROLE_MASTER");

-- 열람실 좌석 insert
DELIMITER //
CREATE PROCEDURE insert_seat()
begin
    DECLARE i INT DEFAULT 1;
    WHILE (i <= 124) DO
        INSERT INTO reading_room(seat_no) VALUE (i); -- ⓓ 테이블에 i값 넣어주기
        SET i = i + 1; -- ⓔ i값에 1더해주고 WHILE문 처음으로 이동
    END WHILE;
END //

call insert_seat();

-- 기준일 기점으로 일주일 씩 휴관일 지정 (2021-11-29 기준)
DELIMITER //
CREATE PROCEDURE insert_day()
begin
    DECLARE i INT DEFAULT 1;
	DECLARE j int default 7;
    WHILE (i <= 54) DO
        insert into calendar values(null, 1, 'admin', '휴관일', DATE_ADD('2021-11-29', interval j day), 
		DATE_ADD('2021-11-29', interval j day), 1, "red", "none", "none", current_timestamp);	
		SET i = i + 1;
		SET j = j + 7;
    END WHILE;
END //

call insert_day();
