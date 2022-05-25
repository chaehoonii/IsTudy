-- drop database istudy_db;

use istudy_db;

select * from user;
select * from board order by board_num;
select * from study_type order by study_type_num;
select * from board_type order by board_type_num;
select * from lang_type order by lang_type_num;
select * from report_type order by report_type_num;
select * from leave_type order by leave_type_num;
select * from level order by level;
select * from study_room;
select * from calendar_color order by color_num;
select * from calendar order by plan_num;
select * from board_image;

insert study_type(study_type_name) values('Frontend');
insert study_type(study_type_name) values('Backend');
insert study_type(study_type_name) values('Algorithm');
insert study_type(study_type_name) values('Project');
insert study_type(study_type_name) values('English');
insert study_type(study_type_name) values('etc');

insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want) values('admin0000', '관리자', '관리자', 'admin1111', '01000000000', 'hong@gmail.com', 'admin', '1', 'F');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, register_date) values('aaaa0000', '홍길동', '홍홍홍홍홍', 'aaaa1111', '01011111111', 'hong01@gmail.com', 'user', '2', 'F', '2022-01-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, register_date) values('bbbb0000', '김길동', '고구마조아', 'bbbb1111', '01022222222', 'hong02@gmail.com', 'user', '3', 'F', '2022-01-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, register_date) values('mmmm0000', '홍길동', '홍홍홍홍gg홍', 'mmmm1111', '01011111141', 'hong015@gmail.com', 'user', '2', 'F', '2022-01-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, register_date) values('nnnn0000', '홍길동', '홍홍홍홍gd', 'nnnn1111', '01013111141', 'hong014@gmail.com', 'user', '4', 'F', '2022-03-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, register_date) values('oooo0000', '홍길동', '홍홍홍홍gf홍', 'oooo1111', '01011411141', 'hong013@gmail.com', 'user', '5', 'F', '2022-02-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, register_date) values('pppp0000', '홍길동', '홍홍홍홍hf홍', 'pppp1111', '01011811141', 'hong016@gmail.com', 'user', '6', 'F', '2022-02-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, career, career_year, register_date) values('cccc0000', '이길동', '보라돌잉', 'cccc1111', '01033333333', 'hong03@gmail.com', 'user', '4', 'T', 'https://github.com/SeongSilver', '1~3년', '2021-08-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, career, career_year, exp, register_date) values('dddd0000', '박길동', '갓생개발자', 'dddd1111', '01044444444', 'hong04@gmail.com', 'mentor', '5', 'T','https://github.com/SeongSilver','4~6년',0, '2021-09-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, career, career_year, exp, register_date) values('eeee0000', '고길동', '사람인사람인', 'eeee1111', '01055555555', 'hong05@gmail.com', 'mentor', '1', 'T','https://github.com/kjy222','4~6년',150, '2021-08-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, career, career_year, exp, register_date) values('ffff0000', '강길동', '가가가아악', 'ffff1111', '01066666666', 'hong06@gmail.com', 'mentor', '2', 'T','https://github.com/kjy222','4~6년',250, '2021-08-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, career, career_year, exp, register_date) values('gggg0000', '유길동', '뚜비두바', 'gggg1111', '01077777777', 'hong07@gmail.com', 'mentor', '3', 'T','https://github.com/hyeyoung-dev','7~9년',350, '2021-10-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, career, career_year, exp, register_date) values('hhhh0000', '송길동', '나나나나난낭', 'hhhh1111', '01088888888', 'hong08@gmail.com', 'mentor', '4', 'T','https://github.com/hyeyoung-dev','7~9년',0, '2021-11-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, career, career_year, exp, register_date) values('iiii0000', '장길동', 'ㅠㅠㅠㅠ', 'iiii1111', '01099999999', 'hong09@gmail.com', 'mentor', '5', 'T','https://github.com/fnejd','7~9년',0, '2022-05-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, career, career_year, exp, register_date) values('jjjj0000', '나길동', '멘토오오오스', 'jjjj1111', '01011112222', 'hong10@gmail.com', 'mentor', '1', 'T','https://github.com/fnejd','10년 이상',450, '2022-05-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, career, career_year, exp, register_date) values('kkkk0000', '차길동', '개발인생', 'kkkk1111', '01022223433', 'hong11@gmail.com', 'mentor', '2', 'T','https://github.com/paestro95','1~3년',0, '2022-05-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, career, career_year, exp, register_date) values('qqqq0000', '차길동', '개발인생3', 'qqqq1111', '01022223553', 'hong17@gmail.com', 'mentor', '4', 'T','https://github.com/paestro95','1~3년',0, '2022-04-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, career, career_year, exp, register_date) values('rrrr0000', '차길동', '개발인생4', 'rrrr1111', '01022223733', 'hong18@gmail.com', 'mentor', '5', 'T','https://github.com/chaehoonii','10년 이상',0, '2021-11-01');
insert user(user_id, user_name, user_nick, user_pw, tel, email, permission, study_type_num, want, career, career_year, exp, register_date) values('ssss0000', '차길동', '개발인생5', 'ssss1111', '01022223633', 'hong19@gmail.com', 'mentor', '1', 'T','https://github.com/chaehoonii','10년 이상',0, '2021-11-01');

insert board_type(board_type_name) values('스터디 게시판');
insert board_type(board_type_name) values('Q&A');
insert board_type(board_type_name) values('공지사항');

insert lang_type(lang_type_name) values('HTML');
insert lang_type(lang_type_name) values('CSS');
insert lang_type(lang_type_name) values('javascript');
insert lang_type(lang_type_name) values('Python');
insert lang_type(lang_type_name) values('Java');
insert lang_type(lang_type_name) values('C++');
insert lang_type(lang_type_name) values('Kotlin');
insert lang_type(lang_type_name) values('Swift');
insert lang_type(lang_type_name) values('PHP');
insert lang_type(lang_type_name) values('Go');
insert lang_type(lang_type_name) values('C#');
insert lang_type(lang_type_name) values('SQL');
insert lang_type(lang_type_name) values('Scala');
insert lang_type(lang_type_name) values('R');
insert lang_type(lang_type_name) values('Bash');
insert lang_type(lang_type_name) values('Shell');

insert report_type(report_type_name) values('광고');
insert report_type(report_type_name) values('타인 사칭');
insert report_type(report_type_name) values('경력 위조');
insert report_type(report_type_name) values('욕설/비방');
insert report_type(report_type_name) values('불건전한 컨텐츠');
insert report_type(report_type_name) values('기타');

insert leave_type(leave_type_name) values('기록 삭제 목적');
insert leave_type(leave_type_name) values('회원간의 문제 발생');
insert leave_type(leave_type_name) values('이용이 불편하고 장애가 많아서');
insert leave_type(leave_type_name) values('다른 사이트가 더 좋아서');
insert leave_type(leave_type_name) values('사용빈도가 낮아서');
insert leave_type(leave_type_name) values('콘텐츠 불만');
insert leave_type(leave_type_name) values('기타');

insert level(exp_min, exp_max, level_icon) values(0, 100, '/images/level_icon/level02.png');
insert level(exp_min, exp_max, level_icon) values(101, 200, '/images/level_icon/level03.png');
insert level(exp_min, exp_max, level_icon) values(201, 300, '/images/level_icon/level04.png');
insert level(exp_min, exp_max, level_icon) values(301, 10000, '/images/level_icon/level05.png');

insert calendar_color(color_name) values('#B97687');
insert calendar_color(color_name) values('#B57FB3');
insert calendar_color(color_name) values('#EACACB');
insert calendar_color(color_name) values('#F6B99D');
insert calendar_color(color_name) values('#F5DDAD');
insert calendar_color(color_name) values('#C6D2BE');
insert calendar_color(color_name) values('#C3E2DD');
insert calendar_color(color_name) values('#83B1C9');
insert calendar_color(color_name) values('#838BB2');


insert job_info(info_link, info_img, info_com, info_job, info_region) values('https://career.greetinghr.com/o/NjU3Mg.ryjq-FHx-ElmLo5Rz9QktTAs_0w', 'pni1qf_n704-0_logo.jpg', '글로벌시스템스', 'S/W연구개발', '서울시 강남구');
insert job_info(info_link, info_img, info_com, info_job, info_sal, info_region) values('https://career.greetinghr.com/o/MTMyMzc.zN3m_l5rey7HPfCz8HJubLXNvO8', 'a9ef3e6997df5.jpg', '네오엔터디엑스', '웹 개발', '3,500 만원', '서울시 강남구');
insert job_info(info_link, info_img, info_com, info_job, info_sal, info_region) values('https://career.greetinghr.com/o/MTMxODY.TQ5G9I_wltb0EGaaJdDQ_XtZ5r8', '다운로드.jpg', '다인기술 주식회사', '앱 개발', '3,300 만원', '서울시 강남구');
insert job_info(info_link, info_com, info_job, info_region) values('https://career.greetinghr.com/o/NjU0NA.d8WkGE0YJtVUdn0alhQa0ukXMh0', '드림시큐리티', '보안솔루션 기술지원 엔지니어', '서울시 강남구');
insert job_info(info_link, info_img, info_com, info_job, info_region) values('https://career.greetinghr.com/o/MTA3NTY.XzEVPEEau2l6BZMYAZ02xYZh5es', '22TV08PCWG_1.jpg', '디투이노베이션', 'Frontend/backend 개발자', '서울시 강남구');
insert job_info(info_link, info_com, info_job, info_sal, info_region) values('https://career.greetinghr.com/o/NjU2OA._i3mkLunvFudo_U5MWbDSGW14ew', '리테일테크', 'JAVA/.NET 기반 유통 및 IoT 솔루션 개발 및 운영', '3,800 만원', '서울시 강남구');

insert study_room(study_type_num, study_name, study_img, study_rule, start_date, finish_date, max, host_id, is_mentor, ip) values (1, '초보개발자 스터디', 'study_default.jpg','기초부터 문제풀이까지 차근차근 함께해요. 주 2회 (매주 월, 수 밤 9:30) 공부하며, 멤버간 소통은 istudy채팅을 이용합니다. 참여 대상 : 자료구조 및 알고리즘에 대해 공부하실 분들, 그동안 공부한 내용을 정리하고 싶은 분들.  참여자 의무 : 정기 모임 참석, 일주일에 4-6시간 투자(평균 예상 시간, 전공, 경력 등에 따라 다를 수 있음) 스터디 운영 : 매주 정해진 주제에 대해 공부 후 모임을 통해 공유하며, 관련 문제 풀이를 통해 이해의 폭을 넓힙니다.', '2022-05-20', '2022-08-20', 6, 'aaaa0000', 'F', 0);
insert study_room(study_type_num, study_name, study_img, study_rule, start_date, finish_date, max, host_id, is_mentor, ip) values (2, '백엔드개발자 스터디', 'study_default.jpg','기초부터 문제풀이까지 차근차근 함께해요. 주 2회 (매주 월, 수 밤 9:30) 공부하며, 멤버간 소통은 istudy채팅을 이용합니다. 참여 대상 : 자료구조 및 알고리즘에 대해 공부하실 분들, 그동안 공부한 내용을 정리하고 싶은 분들.  참여자 의무 : 정기 모임 참석, 일주일에 4-6시간 투자(평균 예상 시간, 전공, 경력 등에 따라 다를 수 있음) 스터디 운영 : 매주 정해진 주제에 대해 공부 후 모임을 통해 공유하며, 관련 문제 풀이를 통해 이해의 폭을 넓힙니다.', '2022-05-10', '2022-06-20', 4, 'bbbb0000', 'F', 0);
insert study_room(study_type_num, study_name, study_img, study_rule, start_date, finish_date, max, host_id, is_mentor, ip) values (3, '알고리즘개발자 스터디', 'study_default.jpg','기초부터 문제풀이까지 차근차근 함께해요. 주 2회 (매주 월, 수 밤 9:30) 공부하며, 멤버간 소통은 istudy채팅을 이용합니다. 참여 대상 : 자료구조 및 알고리즘에 대해 공부하실 분들, 그동안 공부한 내용을 정리하고 싶은 분들.  참여자 의무 : 정기 모임 참석, 일주일에 4-6시간 투자(평균 예상 시간, 전공, 경력 등에 따라 다를 수 있음) 스터디 운영 : 매주 정해진 주제에 대해 공부 후 모임을 통해 공유하며, 관련 문제 풀이를 통해 이해의 폭을 넓힙니다.', '2022-06-20', '2022-07-20', 5, 'kkkk0000', 'T', 0);
insert study_room(study_type_num, study_name, study_img, study_rule, start_date, finish_date, max, host_id, is_mentor, ip) values (4, '프로젝트 개발자 스터디', 'study_default.jpg','기초부터 문제풀이까지 차근차근 함께해요. 주 2회 (매주 월, 수 밤 9:30) 공부하며, 멤버간 소통은 istudy채팅을 이용합니다. 참여 대상 : 자료구조 및 알고리즘에 대해 공부하실 분들, 그동안 공부한 내용을 정리하고 싶은 분들.  참여자 의무 : 정기 모임 참석, 일주일에 4-6시간 투자(평균 예상 시간, 전공, 경력 등에 따라 다를 수 있음) 스터디 운영 : 매주 정해진 주제에 대해 공부 후 모임을 통해 공유하며, 관련 문제 풀이를 통해 이해의 폭을 넓힙니다.', '2022-07-20', '2022-08-20', 6, 'jjjj0000', 'T', 0);
insert study_room(study_type_num, study_name, study_img, study_rule, start_date, finish_date, max, host_id, is_mentor, ip) values (5, '개발영어 스터디', 'study_default.jpg','기초부터 문제풀이까지 차근차근 함께해요. 주 2회 (매주 월, 수 밤 9:30) 공부하며, 멤버간 소통은 istudy채팅을 이용합니다. 참여 대상 : 자료구조 및 알고리즘에 대해 공부하실 분들, 그동안 공부한 내용을 정리하고 싶은 분들.  참여자 의무 : 정기 모임 참석, 일주일에 4-6시간 투자(평균 예상 시간, 전공, 경력 등에 따라 다를 수 있음) 스터디 운영 : 매주 정해진 주제에 대해 공부 후 모임을 통해 공유하며, 관련 문제 풀이를 통해 이해의 폭을 넓힙니다.', '2022-05-24', '2022-07-20', 4, 'cccc0000', 'F', 0);
insert study_room(study_type_num, study_name, study_img, study_rule, start_date, finish_date, max, host_id, is_mentor, ip) values (1, '222초보개발자 스터디', 'study_default.jpg','기초부터 문제풀이까지 차근차근 함께해요. 주 2회 (매주 월, 수 밤 9:30) 공부하며, 멤버간 소통은 istudy채팅을 이용합니다. 참여 대상 : 자료구조 및 알고리즘에 대해 공부하실 분들, 그동안 공부한 내용을 정리하고 싶은 분들.  참여자 의무 : 정기 모임 참석, 일주일에 4-6시간 투자(평균 예상 시간, 전공, 경력 등에 따라 다를 수 있음) 스터디 운영 : 매주 정해진 주제에 대해 공부 후 모임을 통해 공유하며, 관련 문제 풀이를 통해 이해의 폭을 넓힙니다.', '2022-05-20', '2022-9-20', 6, 'dddd0000', 'T', 0);
insert study_room(study_type_num, study_name, study_img, study_rule, start_date, finish_date, max, host_id, is_mentor, ip) values (1, '333초보개발자 스터디', 'study_default.jpg','기초부터 문제풀이까지 차근차근 함께해요. 주 2회 (매주 월, 수 밤 9:30) 공부하며, 멤버간 소통은 istudy채팅을 이용합니다. 참여 대상 : 자료구조 및 알고리즘에 대해 공부하실 분들, 그동안 공부한 내용을 정리하고 싶은 분들.  참여자 의무 : 정기 모임 참석, 일주일에 4-6시간 투자(평균 예상 시간, 전공, 경력 등에 따라 다를 수 있음) 스터디 운영 : 매주 정해진 주제에 대해 공부 후 모임을 통해 공유하며, 관련 문제 풀이를 통해 이해의 폭을 넓힙니다.', '2022-05-20', '2022-9-20', 6, 'eeee0000', 'T', 0);
insert study_room(study_type_num, study_name, study_img, study_rule, start_date, finish_date, max, host_id, is_mentor, ip) values (1, '444보개발자 스터디', 'study_default.jpg','기초부터 문제풀이까지 차근차근 함께해요. 주 2회 (매주 월, 수 밤 9:30) 공부하며, 멤버간 소통은 istudy채팅을 이용합니다. 참여 대상 : 자료구조 및 알고리즘에 대해 공부하실 분들, 그동안 공부한 내용을 정리하고 싶은 분들.  참여자 의무 : 정기 모임 참석, 일주일에 4-6시간 투자(평균 예상 시간, 전공, 경력 등에 따라 다를 수 있음) 스터디 운영 : 매주 정해진 주제에 대해 공부 후 모임을 통해 공유하며, 관련 문제 풀이를 통해 이해의 폭을 넓힙니다.', '2022-05-20', '2022-9-20', 4, 'ffff0000', 'T', 0);
insert study_room(study_type_num, study_name, study_img, study_rule, start_date, finish_date, max, host_id, is_mentor, ip) values (1, '555초보개발자 스터디', 'study_default.jpg','기초부터 문제풀이까지 차근차근 함께해요. 주 2회 (매주 월, 수 밤 9:30) 공부하며, 멤버간 소통은 istudy채팅을 이용합니다. 참여 대상 : 자료구조 및 알고리즘에 대해 공부하실 분들, 그동안 공부한 내용을 정리하고 싶은 분들.  참여자 의무 : 정기 모임 참석, 일주일에 4-6시간 투자(평균 예상 시간, 전공, 경력 등에 따라 다를 수 있음) 스터디 운영 : 매주 정해진 주제에 대해 공부 후 모임을 통해 공유하며, 관련 문제 풀이를 통해 이해의 폭을 넓힙니다.', '2022-05-20', '2022-9-20', 5, 'gggg0000', 'T', 0);
insert study_room(study_type_num, study_name, study_img, study_rule, start_date, finish_date, max, host_id, is_mentor, ip) values (1, '666초보개발자 스터디', 'study_default.jpg','기초부터 문제풀이까지 차근차근 함께해요. 주 2회 (매주 월, 수 밤 9:30) 공부하며, 멤버간 소통은 istudy채팅을 이용합니다. 참여 대상 : 자료구조 및 알고리즘에 대해 공부하실 분들, 그동안 공부한 내용을 정리하고 싶은 분들.  참여자 의무 : 정기 모임 참석, 일주일에 4-6시간 투자(평균 예상 시간, 전공, 경력 등에 따라 다를 수 있음) 스터디 운영 : 매주 정해진 주제에 대해 공부 후 모임을 통해 공유하며, 관련 문제 풀이를 통해 이해의 폭을 넓힙니다.', '2022-05-20', '2022-9-20', 4, 'hhhh0000', 'T', 0);
insert study_room(study_type_num, study_name, study_img, study_rule, start_date, finish_date, max, host_id, is_mentor, ip) values (1, '777 스터디', 'study_default.jpg','기초부터 문제풀이까지 차근차근 함께해요. 주 2회 (매주 월, 수 밤 9:30) 공부하며, 멤버간 소통은 istudy채팅을 이용합니다. 참여 대상 : 자료구조 및 알고리즘에 대해 공부하실 분들, 그동안 공부한 내용을 정리하고 싶은 분들.  참여자 의무 : 정기 모임 참석, 일주일에 4-6시간 투자(평균 예상 시간, 전공, 경력 등에 따라 다를 수 있음) 스터디 운영 : 매주 정해진 주제에 대해 공부 후 모임을 통해 공유하며, 관련 문제 풀이를 통해 이해의 폭을 넓힙니다.', '2022-05-20', '2022-9-20', 6, 'iiii0000', 'T', 0);
insert study_room(study_type_num, study_name, study_img, study_rule, start_date, finish_date, max, host_id, is_mentor, ip) values (6, 'etc 스터디', 'study_default.jpg','기초부터 문제풀이까지 차근차근 함께해요. 주 2회 (매주 월, 수 밤 9:30) 공부하며, 멤버간 소통은 istudy채팅을 이용합니다. 참여 대상 : 자료구조 및 알고리즘에 대해 공부하실 분들, 그동안 공부한 내용을 정리하고 싶은 분들.  참여자 의무 : 정기 모임 참석, 일주일에 4-6시간 투자(평균 예상 시간, 전공, 경력 등에 따라 다를 수 있음) 스터디 운영 : 매주 정해진 주제에 대해 공부 후 모임을 통해 공유하며, 관련 문제 풀이를 통해 이해의 폭을 넓힙니다.', '2022-05-20', '2022-9-20', 6, 'iiii0000', 'T', 0);

insert study_like(study_num, user_id) values(1, 'aaaa0000');
insert study_like(study_num, user_id) values(2, 'aaaa0000');
insert study_like(study_num, user_id) values(3, 'aaaa0000');
insert study_like(study_num, user_id) values(4, 'aaaa0000');
insert study_like(study_num, user_id) values(5, 'aaaa0000');
insert study_like(study_num, user_id) values(6, 'aaaa0000');
insert study_like(study_num, user_id) values(7, 'aaaa0000');
insert study_like(study_num, user_id) values(8, 'aaaa0000');
insert study_like(study_num, user_id) values(9, 'aaaa0000');
insert study_like(study_num, user_id) values(10, 'aaaa0000');
insert study_like(study_num, user_id) values(1, 'bbbb0000');
insert study_like(study_num, user_id) values(2, 'bbbb0000');
insert study_like(study_num, user_id) values(3, 'bbbb0000');
insert study_like(study_num, user_id) values(4, 'bbbb0000');
insert study_like(study_num, user_id) values(5, 'bbbb0000');
insert study_like(study_num, user_id) values(6, 'bbbb0000');
insert study_like(study_num, user_id) values(1, 'cccc0000');
insert study_like(study_num, user_id) values(2, 'cccc0000');
insert study_like(study_num, user_id) values(3, 'cccc0000');
insert study_like(study_num, user_id) values(1, 'dddd0000');
insert study_like(study_num, user_id) values(3, 'dddd0000');
insert study_like(study_num, user_id) values(4, 'dddd0000');

insert study_mate(study_num, user_id, want_ok, want_coment) values(1, 'bbbb0000', 'T', '스터디신청합니다!222');
insert study_mate(study_num, user_id, want_ok, want_coment) values(1, 'dddd0000', 'T', '스터디신청합니다!3333');
insert study_mate(study_num, user_id, want_ok, want_coment) values(1, 'eeee0000', 'T', '스터디신청합니다!4444');
insert study_mate(study_num, user_id, want_ok, want_coment) values(1, 'ffff0000', 'F', '스터디신청합니다!1111');
insert study_mate(study_num, user_id, want_ok, want_coment) values(2, 'gggg0000', 'T', '스터디신청합니다!5555');
insert study_mate(study_num, user_id, want_ok, want_coment) values(2, 'hhhh0000', 'T', '스터디신청합니다!6666');
insert study_mate(study_num, user_id, want_ok, want_coment) values(2, 'iiii0000', 'F', '스터디신청합니다7777!');
insert study_mate(study_num, user_id, want_ok, want_coment) values(3, 'kkkk0000', 'T', '스터디신청합니다!8888');
insert study_mate(study_num, user_id, want_ok, want_coment) values(4, 'aaaa0000', 'T', '스터디신청합니다9999!');
insert study_mate(study_num, user_id, want_ok, want_coment) values(4, 'bbbb0000', 'T', '스터디신청합니다54645!');
insert study_mate(study_num, user_id, want_ok, want_coment) values(4, 'cccc0000', 'F', '스터디신청합니다!23423');
insert study_mate(study_num, user_id, want_ok, want_coment) values(5, 'dddd0000', 'T', '스터디신청합니다!123123');
insert study_mate(study_num, user_id, want_ok, want_coment) values(5, 'eeee0000', 'T', '스터디신청합니다!34545');
insert study_mate(study_num, user_id, want_ok, want_coment) values(5, 'ffff0000', 'F', '스터디신청합니다!5675');
insert study_mate(study_num, user_id, want_ok, want_coment) values(6, 'bbbb0000', 'T', '스터디신청합니다!678');
insert study_mate(study_num, user_id, want_ok, want_coment) values(6, 'dddd0000', 'T', '스터디신청합니다!3453');
insert study_mate(study_num, user_id, want_ok, want_coment) values(6, 'eeee0000', 'T', '스터디신청합니다!234');
insert study_mate(study_num, user_id, want_ok, want_coment) values(6, 'ffff0000', 'F', '스터디신청합니다!12323');
insert study_mate(study_num, user_id, want_ok, want_coment) values(7, 'gggg0000', 'T', '스터디신청합니다!456');
insert study_mate(study_num, user_id, want_ok, want_coment) values(7, 'hhhh0000', 'T', '스터디신청합니다!567');
insert study_mate(study_num, user_id, want_ok, want_coment) values(7, 'iiii0000', 'F', '스터디신청합니다!678');
insert study_mate(study_num, user_id, want_ok, want_coment) values(8, 'kkkk0000', 'T', '스터디신청합니다!789');
insert study_mate(study_num, user_id, want_ok, want_coment) values(9, 'aaaa0000', 'T', '스터디신청합니다!890');
insert study_mate(study_num, user_id, want_ok, want_coment) values(9, 'bbbb0000', 'T', '스터디신청합니다!567');
insert study_mate(study_num, user_id, want_ok, want_coment) values(9, 'cccc0000', 'F', '스터디신청합니다!345');
insert study_mate(study_num, user_id, want_ok, want_coment) values(10, 'dddd0000', 'T', '스터디신청합니다!234');
insert study_mate(study_num, user_id, want_ok, want_coment) values(10, 'eeee0000', 'T', '스터디신청합니다!123');
insert study_mate(study_num, user_id, want_ok, want_coment) values(10, 'ffff0000', 'F', '스터디신청합니다!435');

insert study_lang_type(study_num, lang_type_num)values (1, 1);
insert study_lang_type(study_num, lang_type_num)values (1, 2);
insert study_lang_type(study_num, lang_type_num)values (1, 3);
insert study_lang_type(study_num, lang_type_num)values (1, 4);
insert study_lang_type(study_num, lang_type_num)values (1, 5);
insert study_lang_type(study_num, lang_type_num)values (2, 1);
insert study_lang_type(study_num, lang_type_num)values (2, 2);
insert study_lang_type(study_num, lang_type_num)values (2, 3);
insert study_lang_type(study_num, lang_type_num)values (2, 4);
insert study_lang_type(study_num, lang_type_num)values (2, 5);
insert study_lang_type(study_num, lang_type_num)values (3, 1);
insert study_lang_type(study_num, lang_type_num)values (3, 2);
insert study_lang_type(study_num, lang_type_num)values (4, 3);
insert study_lang_type(study_num, lang_type_num)values (4, 4);
insert study_lang_type(study_num, lang_type_num)values (4, 5);
insert study_lang_type(study_num, lang_type_num)values (5, 1);
insert study_lang_type(study_num, lang_type_num)values (5, 2);
insert study_lang_type(study_num, lang_type_num)values (5, 3);
insert study_lang_type(study_num, lang_type_num)values (5, 4);
insert study_lang_type(study_num, lang_type_num)values (6, 5);
insert study_lang_type(study_num, lang_type_num)values (7, 1);
insert study_lang_type(study_num, lang_type_num)values (7, 2);
insert study_lang_type(study_num, lang_type_num)values (7, 3);
insert study_lang_type(study_num, lang_type_num)values (8, 4);
insert study_lang_type(study_num, lang_type_num)values (8, 5);
insert study_lang_type(study_num, lang_type_num)values (8, 1);
insert study_lang_type(study_num, lang_type_num)values (9, 2);
insert study_lang_type(study_num, lang_type_num)values (9, 3);
insert study_lang_type(study_num, lang_type_num)values (10, 4);
insert study_lang_type(study_num, lang_type_num)values (10, 5);
insert study_lang_type(study_num, lang_type_num)values (11, 1);
insert study_lang_type(study_num, lang_type_num)values (11, 2);
insert study_lang_type(study_num, lang_type_num)values (11, 3);
insert study_lang_type(study_num, lang_type_num)values (11, 4);
insert study_lang_type(study_num, lang_type_num)values (11, 5);

insert study_hashtag(study_num, tag) value (1, 'Node.js');
insert study_hashtag(study_num, tag) value (1, 'React');
insert study_hashtag(study_num, tag) value (2, 'Spring-boot');
insert study_hashtag(study_num, tag) value (2, 'boot-strap');
insert study_hashtag(study_num, tag) value (2, 'eclipse');
insert study_hashtag(study_num, tag) value (3, 'Node.js');
insert study_hashtag(study_num, tag) value (4, 'React');
insert study_hashtag(study_num, tag) value (4, 'Spring-boot');
insert study_hashtag(study_num, tag) value (5, 'boot-strap');
insert study_hashtag(study_num, tag) value (5, 'eclipse');
insert study_hashtag(study_num, tag) value (5, 'Node.js');
insert study_hashtag(study_num, tag) value (6, 'React');
insert study_hashtag(study_num, tag) value (7, 'Spring-boot');
insert study_hashtag(study_num, tag) value (7, 'boot-strap');
insert study_hashtag(study_num, tag) value (7, 'eclipse');
insert study_hashtag(study_num, tag) value (7, 'Node.js');
insert study_hashtag(study_num, tag) value (7, 'React');
insert study_hashtag(study_num, tag) value (8, 'Spring-boot');
insert study_hashtag(study_num, tag) value (8, 'boot-strap');
insert study_hashtag(study_num, tag) value (9, 'eclipse');
insert study_hashtag(study_num, tag) value (9, 'Node.js');
insert study_hashtag(study_num, tag) value (10, 'React');
insert study_hashtag(study_num, tag) value (10, 'Spring-boot');
insert study_hashtag(study_num, tag) value (10, 'boot-strap');
insert study_hashtag(study_num, tag) value (10, 'eclipse');
insert study_hashtag(study_num, tag) value (11, 'Node.js');
insert study_hashtag(study_num, tag) value (11, 'React');

insert calendar(study_num, plan_name, plan_detail, plan_start, plan_finish, start_time, finish_time, color_num) values (1, '어린이날', '휴일', '2022-05-05', '2022-05-05', '10:00', '10:00', 1);
insert calendar(study_num, plan_name, plan_detail, plan_start, plan_finish, start_time, finish_time, color_num) values (1, '1번째 스터디모임', '페이지 완성하기2', '2022-05-06', '2022-05-10', '10:00', '10:00', 2);
insert calendar(study_num, plan_name, plan_detail, plan_start, plan_finish, start_time, finish_time, color_num) values (1, '2번째 스터디모임', '페이지 완성하기4', '2022-05-13', '2022-05-15', '10:00', '10:00', 3);
insert calendar(study_num, plan_name, plan_detail, plan_start, plan_finish, start_time, finish_time, color_num) values (1, '3번째 스터디모임', '페이지 완성하기3', '2022-05-15', '2022-05-15', '18:00', '20:00', 4);
insert calendar(study_num, plan_name, plan_detail, plan_start, plan_finish, start_time, finish_time, color_num) values (1, '4번째 스터디모임', '페이지 완성하기5', '2022-05-19', '2022-05-20', '10:00', '10:00', 5);
insert calendar(study_num, plan_name, plan_detail, plan_start, plan_finish, start_time, finish_time, color_num) values (1, '5번째 스터디모임', '페이지 완성하기6', '2022-05-21', '2022-05-21', '11:00', '14:00', 6);
insert calendar(study_num, plan_name, plan_detail, plan_start, plan_finish, start_time, finish_time, color_num) values (1, '6번째 스터디모임', '페이지 완성하기8', '2022-05-22', '2022-05-22', '10:00', '15:00', 7);
insert calendar(study_num, plan_name, plan_detail, plan_start, plan_finish, start_time, finish_time, color_num) values (1, '7번째 스터디모임', '페이지 완성하기7', '2022-05-24', '2022-05-25', '10:00', '10:00', 8);
insert calendar(study_num, plan_name, plan_detail, plan_start, plan_finish, start_time, finish_time, color_num) values (1, '8번째 스터디모임', '페이지 완성하기9', '2022-05-28', '2022-05-30', '10:00', '10:00', 9);

insert board(user_id, title, content, ip, board_type_num) values ('aaaa0000','스프링부트 디비연결','디비연결이 안된건가요ㅠㅠ 도와주세요',0,2);
insert board(user_id, title, content, ip, board_type_num) values ('bbbb0000','c#으로 처음 시작해도 괜찮나요?','안녕하세요. 26살에 처음으로 코딩 공부를 시작했습니다. 비전공자입니다.
우연히 패스트캠퍼스 c# 유니티 게임 개발 강의 (입문)을 구입했는데요. 게임 쪽이 확 끌리지 않아서 앱, 웹 등 다른 분야로도 가능성을 열어두고 싶습니다. 
c#으로 개발 공부를 시작해도 괜찮을까요?
그리고 c#의 앞으로의 활용도가 궁금합니다.
개발 쪽 지식이 전무하여 여쭤봅니다...',0,2);
insert board(user_id, title, content, ip, board_type_num) values ('cccc0000','스프링부트 JPA OneToOne 매핑 질문드립니다!!!!!!','안녕하세요
너무 초보라.. 질문드립니다
테이블에 외래키 매핑 관계를 추가했습니다. 단방향 일대일 관계라 한쪽에만 OneToOne을 붙여서 테이블 생성해주었습니다.
MySQL 켜서 확인하면 라인이 1:1이 아니고 1:n으로 나타나는데 이유가 뭘까요? 원래 이렇게 나오는건가요? 
잘 아시는 분들 답변부탁드리겠습니다 감사합니다!!',0,2);

insert board(user_id, title, content, ip, board_type_num, study_num) values ('aaaa0000','스프링부트 디비연결','디비연결이 안된건가요ㅠㅠ 도와주세요',0,1,9);
insert board(user_id, title, content, ip, board_type_num, study_num) values ('bbbb0000','스프링부트 디r비연결','디비연결이 안된건가sdf요ㅠㅠ 도와주세요',0,1,9);
insert board(user_id, title, content, ip, board_type_num, study_num) values ('cccc0000','스프링부트df 디비연결','디비연결이 안된건가요ㅠㅠ 도와주세요',0,1,9);
insert board(user_id, title, content, ip, board_type_num, study_num) values ('dddd0000','스프링부트 zxc디비연결','디비연결이 안된건가요ㅠㅠ 도와주세요',0,1,10);


insert board_image(board_num, file1) values(1,'1651922690712.jpg');
insert board_image(board_num, file1) values(3,'1651925182654.jpg');
insert board_image(board_num, file1,file2) values(4,'1651911713707.png','다운로드.png');

insert board_hashtag(board_num, tag) value (1, 'Spring-boot');
insert board_hashtag(board_num, tag) value (1, '스프링부트');
insert board_hashtag(board_num, tag) value (1, 'DB');
insert board_hashtag(board_num, tag) value (2, '비전공자');
insert board_hashtag(board_num, tag) value (2, '진로고민');
insert board_hashtag(board_num, tag) value (3, '스프링부트');
insert board_hashtag(board_num, tag) value (3, 'JPA');
insert board_hashtag(board_num, tag) value (3, 'DB');
insert board_hashtag(board_num, tag) value (4, '에러');

insert board_lang_type(board_num, lang_type_num) values(1, 12);
insert board_lang_type(board_num, lang_type_num) values(1, 5);
insert board_lang_type(board_num, lang_type_num) values(2, 11);
insert board_lang_type(board_num, lang_type_num) values(3, 12);
insert board_lang_type(board_num, lang_type_num) values(3, 5);
insert board_lang_type(board_num, lang_type_num) values(4, 4);

insert reply(board_num, user_id, reply_coment, ip) values(1, 'bbbb0000', '새로고침하세요222','0');
insert reply(board_num, user_id, reply_coment, ip) values(2, 'cccc0000', '저장하세요','0');
insert reply(board_num, user_id, reply_coment, ip) values(2, 'dddd0000', '새로고침하세요','0');
insert reply(board_num, user_id, reply_coment, ip) values(2, 'eeee0000', '저장하세요222','0');
insert reply(board_num, user_id, reply_coment, ip) values(3, 'ffff0000', '새로고침하세요333','0');
insert reply(board_num, user_id, reply_coment, ip) values(3, 'gggg0000', '저장하세요3333','0');

insert reply_like(reply_num, user_id) values(2,'eeee0000');
insert reply_like(reply_num, user_id) values(2,'bbbb0000');
insert reply_like(reply_num, user_id) values(3,'aaaa0000');
insert reply_like(reply_num, user_id) values(1,'eeee0000');

SELECT * FROM INFORMATION_SCHEMA.PROCESSLIST order by time desc;
CALL mysql.rds_kill(35041);

set foreign_key_checks=1;
truncate report;

		SELECT 	A.user_nick, ifnull(C.contribute,0) as contribute
		FROM 	user A
		JOIN 	study_mate B
		ON 		A.user_id=B.user_id
        join	(select user_id, count(*) as contribute from board where board_type_num=1 group by user_id) C
        on		C.user_id=A.user_id
		WHERE 	B.study_num=2
        and		B.want_ok='T';
        select user_id, count(*) as contribute from board where board_type_num=1 group by user_id;
