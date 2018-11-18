



insert INTO human VALUES('1','조상부', 'M', '50/3/4','','10','0');
insert INTO human VALUES('2','조상모', 'F', '53/5/9','','20','0');

insert INTO human VALUES('3','할아바지', 'M', '70/1/3','','30','3');
insert INTO human VALUES('4','할아버지여동생', 'F', '72/7/6','','40','3');
insert INTO human VALUES('5','할아버지남동생', 'M', '80/9/14','','50','3');

insert INTO human VALUES('6','할머니', 'M', '70/3/4','','60','2');
insert INTO human VALUES('7','할아버지여동생남편', 'M', '72/3/4','','70','3');
insert INTO human VALUES('8','할아버지남동생부인', 'M', '80/3/4','','80','2');


insert INTO human VALUES('9','고모', 'F', '50/3/4','','90','0');

insert INTO human VALUES('10','아버지', 'M', '50/3/4','','100','0');
insert INTO human VALUES('11','작은아버지', 'M', '50/3/4','','110','0');

insert INTO human VALUES('12','사촌형', 'M', '50/3/4','','120','0');


insert INTO human VALUES('13','나', 'M', '50/3/4','','130','0');



insert INTo parents VALUES('10',NULL,NULL,NULL);
insert INTo parents VALUES('20','NULL','NULL',NULL);
insert INTo parents VALUES('30','1','2',3);
insert INTo parents VALUES('40','1','2',3);
insert INTo parents VALUES('50','1','2',3);
/*할아버지 할아버지여동생 할아버지남동생 나 아버지*/
insert INTo parents VALUES('60','1','2',NULL);
insert INTo parents VALUES('70','1','2',NULL);
insert INTo parents VALUES('80','1','2',NULL);

insert INTo parents VALUES('90','3','6',3);
insert INTo parents VALUES('100','3','6',3);
insert INTo parents VALUES('110','3','6',3);

insert INTo parents VALUES('130','10','15',3);
////////////////////////////////////////////////////////////////////////////////////////////
insert INTo parents VALUES('140','10','15',NULL);
insert INTo parents VALUES('150','10','15',NULL);
insert INTo parents VALUES('90','1','2',NULL);

insert INTO human VALUES('15','어머니', 'F', '50/3/4',NULL,'200','0');

insert INTO human VALUES('16','형', 'M', '50/3/4','','140','0');
insert INTO human VALUES('17','여동생', 'F', '50/3/4','','150','0');
insert INTO human VALUES('18','강호동', 'M', '50/3/4','10','0');
insert INTO human VALUES('19','강호동', 'M', '50/3/4','10','0');

///////////////////////////////////////////////////////////////////////////////////////////////////
/*친가 찾기*/
SELECT H.HID AS HID, H.NAME AS NAME, H.PID AS PID, P.FHID AS FHID
    FROM HUMAN H LEFT OUTER JOIN PARENTS P ON (H.PID = P.PID)
    START WITH HID = (SELECT HH.HID FROM HUMAN HH WHERE HH.NAME = '나')
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

select *from human;

/*자식찾기*/
SELECT H2.HID AS HID, H2.NAME AS NAME, H2.PID AS PID, P.FHID AS FHID
    FROM HUMAN h, PARENTS P ,human h2 
    where p.pid=h2.pid
    and h.hid=p.fhid
    START WITH h.HID = '01'
    CONNECT BY PRIOR  h2.HID = FHID;
    
