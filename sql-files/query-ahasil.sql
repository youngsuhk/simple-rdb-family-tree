/* 할아버지 추가 */
INSERT INTO HUMAN VALUES (SYS_GUID(), '할아버지', 'M', '2018-10-31', NULL, NULL, NULL);

/* 외할아버지 추가 */
INSERT INTO HUMAN VALUES (SYS_GUID(), '외할아버지', 'M', '2018-10-30', NULL, NULL, NULL);

/* 아버지 추가 */
INSERT INTO PARENTS VALUES (
    SYS_GUID(),
    (SELECT HID FROM HUMAN WHERE NAME = '할아버지'),
    NULL,
    NULL
);
INSERT INTO HUMAN VALUES (SYS_GUID(), '아버지', 'M', '2018-11-01', NULL, (
    SELECT P.PID FROM PARENTS P, HUMAN FH WHERE P.FHID = FH.HID AND FH.NAME = '할아버지'
), NULL);

/* 어머니 및 결혼 추가 */
INSERT INTO PARENTS VALUES (
    SYS_GUID(),
    (SELECT HID FROM HUMAN WHERE NAME = '외할아버지'),
    NULL,
    NULL
);
INSERT INTO HUMAN VALUES (SYS_GUID(), '어머니', 'F', '2018-11-02', NULL, (
    SELECT P.PID FROM PARENTS P, HUMAN FH WHERE P.FHID = FH.HID AND FH.NAME = '외할아버지'
), NULL);

/* 여자 하나 추가 */
INSERT INTO PARENTS VALUES (
    SYS_GUID(),
    (SELECT HID FROM HUMAN WHERE NAME = '아버지'),
    (SELECT HID FROM HUMAN WHERE NAME = '어머니'),
    NULL
);
INSERT INTO HUMAN VALUES (SYS_GUID(), '여자', 'F', '2018-11-03', NULL, (
    SELECT P.PID FROM PARENTS P, HUMAN FH WHERE P.FHID = FH.HID AND FH.NAME = '아버지'
), NULL);

/* SELECT */
SELECT H.*, PN.FHNAME, PN.MHNAME
    FROM HUMAN H LEFT OUTER JOIN PARENTS_WITH_NAMES PN ON (H.PID = PN.PID)
    ORDER BY H.BIRTH;
    
SELECT * FROM PARENTS_WITH_NAMES;


/* 친가 부계 찾기 */
SELECT LEVEL, H.HID AS HID, H.NAME AS NAME, H.PID AS PID, P.FHID AS FHID
    FROM HUMAN H LEFT OUTER JOIN PARENTS P ON (H.PID = P.PID)
    START WITH HID = (SELECT HH.HID FROM HUMAN HH WHERE HH.NAME = '여자')
    CONNECT BY PRIOR FHID = HID;

/* 외가 부계 찾기 */
SELECT LEVEL, H.HID AS HID, H.NAME AS NAME, H.PID AS PID, P.FHID AS FHID
    FROM HUMAN H LEFT OUTER JOIN PARENTS P ON (H.PID = P.PID)
    START WITH HID = (
        SELECT P.MHID
            FROM HUMAN HH, PARENTS P
            WHERE HH.NAME = '여자' AND HH.PID = P.PID
    )
    CONNECT BY PRIOR FHID = HID;
    