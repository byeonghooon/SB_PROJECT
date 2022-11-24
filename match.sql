#경기 정보 테이블
CREATE TABLE `match game` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate CHAR(20) NOT NULL,
    title CHAR(60) NOT NULL,
    N_A_name CHAR(20) NOT NULL,
    N_B_name CHAR(20) NOT NULL,
    F_A_Ranking CHAR(20) NOT NULL,
    F_B_Ranking CHAR(20) NOT NULL,
    A_score INT(10) UNSIGNED NOT NULL COMMENT 'a 나라 득점',
    B_score INT(10) UNSIGNED NOT NULL COMMENT 'b 나라 득점'
);

INSERT INTO `match game`
SET regDate = '2022-11-23',
title = '일본 vs 독일',
N_A_name = '일본',
N_B_name = '독일',
F_A_Ranking = '24위',
F_B_Ranking = '11위',
A_score = 0,
B_score = 1;