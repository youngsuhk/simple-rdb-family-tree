



insert INTO human VALUES('1','�����', 'M', '50/3/4','','10','0');
insert INTO human VALUES('2','�����', 'F', '53/5/9','','20','0');

insert INTO human VALUES('3','�Ҿƹ���', 'M', '70/1/3','','30','3');
insert INTO human VALUES('4','�Ҿƹ���������', 'F', '72/7/6','','40','3');
insert INTO human VALUES('5','�Ҿƹ���������', 'M', '80/9/14','','50','3');

insert INTO human VALUES('6','�ҸӴ�', 'M', '70/3/4','','60','2');
insert INTO human VALUES('7','�Ҿƹ�������������', 'M', '72/3/4','','70','3');
insert INTO human VALUES('8','�Ҿƹ�������������', 'M', '80/3/4','','80','2');


insert INTO human VALUES('9','���', 'F', '50/3/4','','90','0');

insert INTO human VALUES('10','�ƹ���', 'M', '50/3/4','','100','0');
insert INTO human VALUES('11','�����ƹ���', 'M', '50/3/4','','110','0');

insert INTO human VALUES('12','������', 'M', '50/3/4','','120','0');


insert INTO human VALUES('13','��', 'M', '50/3/4','','130','0');



insert INTo parents VALUES('10',NULL,NULL,NULL);
insert INTo parents VALUES('20','NULL','NULL',NULL);
insert INTo parents VALUES('30','1','2',3);
insert INTo parents VALUES('40','1','2',3);
insert INTo parents VALUES('50','1','2',3);
/*�Ҿƹ��� �Ҿƹ��������� �Ҿƹ��������� �� �ƹ���*/
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

insert INTO human VALUES('15','��Ӵ�', 'F', '50/3/4',NULL,'200','0');

insert INTO human VALUES('16','��', 'M', '50/3/4','','140','0');
insert INTO human VALUES('17','������', 'F', '50/3/4','','150','0');
insert INTO human VALUES('18','��ȣ��', 'M', '50/3/4','10','0');
insert INTO human VALUES('19','��ȣ��', 'M', '50/3/4','10','0');

///////////////////////////////////////////////////////////////////////////////////////////////////
/*ģ�� ã��*/
SELECT H.HID AS HID, H.NAME AS NAME, H.PID AS PID, P.FHID AS FHID
    FROM HUMAN H LEFT OUTER JOIN PARENTS P ON (H.PID = P.PID)
    START WITH HID = (SELECT HH.HID FROM HUMAN HH WHERE HH.NAME = '��')
    CONNECT BY PRIOR FHID = HID;


/* �ܰ� �ΰ� ã�� */
SELECT LEVEL, H.HID AS HID, H.NAME AS NAME, H.PID AS PID, P.FHID AS FHID
    FROM HUMAN H LEFT OUTER JOIN PARENTS P ON (H.PID = P.PID)
    START WITH HID = (
        SELECT P.MHID
            FROM HUMAN HH, PARENTS P
            WHERE HH.NAME = '����' AND HH.PID = P.PID
    )
    CONNECT BY PRIOR FHID = HID;

select *from human;

/*�ڽ�ã��*/
SELECT H2.HID AS HID, H2.NAME AS NAME, H2.PID AS PID, P.FHID AS FHID
    FROM HUMAN h, PARENTS P ,human h2 
    where p.pid=h2.pid
    and h.hid=p.fhid
    START WITH h.HID = '01'
    CONNECT BY PRIOR  h2.HID = FHID;
    
