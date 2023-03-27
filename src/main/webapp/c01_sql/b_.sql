SELECT * FROM airport;
SELECT * FROM airline;
UPDATE AIRLINE SET 
='/b01_img/ke.PNG' WHERE AIRLINECODE ='KE';
INSERT INTO airline VALUES ('RS','에어서울','/b01_img/logo_airseoul.jpg');
INSERT INTO airline VALUES ('TW','티웨이항공','/b01_img/tw.jpg');
INSERT INTO airline VALUES ('DL','델타항공','/b01_img/dl.jpg');
SELECT * FROM flight;
INSERT INTO flight values('ICNLAX22122214','RS','ICN',to_date('2022-12-22 14:00','YYYY-MM-DD HH24:mi'),'LAX',9,700000);
INSERT INTO flight values('ICNLAX22122120','RS','ICN',to_date('2022-12-21 20:00','YYYY-MM-DD HH24:mi'),'LAX',9.5,720000);
INSERT INTO flight values('ICNLAX22122221','KE','ICN',to_date('2022-12-22 21:00','YYYY-MM-DD HH24:mi'),'LAX',10,820000);
INSERT INTO flight values('ICNLAX22122123','KE','ICN',to_date('2022-12-21 23:30','YYYY-MM-DD HH24:mi'),'LAX',9.5,850000);

INSERT INTO flight values('ICNLAX22122102','DL','ICN',to_date('2022-12-21 02:10','YYYY-MM-DD HH24:mi'),'LAX',9.3,700000);
INSERT INTO flight values('ICNSFO22122104','DL','ICN',to_date('2022-12-21 04:30','YYYY-MM-DD HH24:mi'),'LAX',9.4,720000);
INSERT INTO flight values('ICNNRT22122108','TW','ICN',to_date('2022-12-21 08:30','YYYY-MM-DD HH24:mi'),'NRT',2.5,200000);
INSERT INTO flight values('ICNNRT22122104','TW','ICN',to_date('2022-12-21 04:30','YYYY-MM-DD HH24:mi'),'NRT',2,300000);

INSERT INTO flight values('ICNFUK22122107','TW','ICN',to_date('2022-12-21 07:00','YYYY-MM-DD HH24:mi'),'FUK',1.5,200000);
INSERT INTO flight values('ICNFUK22122122','TW','ICN',to_date('2022-12-21 22:15','YYYY-MM-DD HH24:mi'),'FUK',2,150000);


INSERT INTO flight values('LAXICN22123011','KE','LAX',to_date('2022-12-30 11:00','YYYY-MM-DD HH24:mi'),'ICN',9.5,820000);
INSERT INTO flight values('SFOICN22123013','KE','SFO',to_date('2022-12-30 13:00','YYYY-MM-DD HH24:mi'),'ICN',9,800000);
INSERT INTO flight values('SFOICN22123020','KE','SFO',to_date('2022-12-30 20:00','YYYY-MM-DD HH24:mi'),'ICN',9.5,850000);
INSERT INTO flight values('FUKICN22123012','KE','FUK',to_date('2022-12-30 12:00','YYYY-MM-DD HH24:mi'),'ICN',2.5,250000);
INSERT INTO flight values('FUKICN22123015','RS','FUK',to_date('2022-12-30 15:00','YYYY-MM-DD HH24:mi'),'ICN',2.5,190000);
INSERT INTO flight values('NRTICN22123018','KE','NRT',to_date('2022-12-30 18:00','YYYY-MM-DD HH24:mi'),'ICN',3,280000);
INSERT INTO flight values('NRTICN22123008','RS','NRT',to_date('2022-12-30 08:00','YYYY-MM-DD HH24:mi'),'ICN',3,300000);
INSERT INTO flight values('CJUICN22123006','RS','CJU',to_date('2022-12-30 06:00','YYYY-MM-DD HH24:mi'),'ICN',2,80000);
INSERT INTO flight values('CJUICN22123009','RS','CJU',to_date('2022-12-30 09:00','YYYY-MM-DD HH24:mi'),'ICN',2,100000);
SELECT * FROM ticketOption;
ALTER TABLE ticketOption RENAME COLUMN class TO classfee;
INSERT INTO ticketOption VALUES('ICNLAX22122214ec1','ICNLAX22122214',0,50000,100);
INSERT INTO ticketOption VALUES('ICNLAX22122120ec0','ICNLAX22122120',0,0,100);
INSERT INTO ticketOption VALUES('ICNLAX22122221ec0','ICNLAX22122221',0,0,180);
INSERT INTO ticketOption VALUES('ICNLAX22122123ec1','ICNLAX22122123',0,0,180);

INSERT INTO ticketOption VALUES('ICNNRT22122108ec2','ICNNRT22122108',0,100000,180);
INSERT INTO ticketOption VALUES('ICNNRT22122104ec1','ICNNRT22122104',0,50000,180);
INSERT INTO ticketOption VALUES('ICNFUK22122107ec1','ICNFUK22122107',0,50000,180);
INSERT INTO ticketOption VALUES('ICNFUK22122122ec1','ICNFUK22122122',0,50000,180);

INSERT INTO ticketOption VALUES('ICNLAX22122102ec2','ICNLAX22122102',0,100000,180);
INSERT INTO ticketOption VALUES('ICNSFO22122104ec2','ICNSFO22122104',0,100000,180);

INSERT INTO ticketOption VALUES('LAXICN22123011bs1','LAXICN22123011',230000,0,50);
INSERT INTO ticketOption VALUES('SFOICN22123013ec0','SFOICN22123013',0,0,180);
INSERT INTO ticketOption VALUES('SFOICN22123020ec1','SFOICN22123020',0,0,180);
INSERT INTO ticketOption VALUES('FUKICN22123012ec1','FUKICN22123012',0,0,100);
INSERT INTO ticketOption VALUES('FUKICN22123015ec2','FUKICN22123015',0,50000,120);
INSERT INTO ticketOption VALUES('NRTICN22123018ec0','NRTICN22123018',0,0,100);
INSERT INTO ticketOption VALUES('NRTICN22123008ec1','NRTICN22123008',0,0,100);
INSERT INTO ticketOption VALUES('CJUICN22123006ec0','CJUICN22123006',0,0,80);
INSERT INTO ticketOption VALUES('CJUICN22123009ec1','CJUICN22123009',0,0,80);




-- everywhere로 검색(편도)
SELECT DISTINCT a2.apnation, f.STANDARDFEE 
FROM(SELECT a.apnation, min(ff.standardfee) AS minfee FROM airport a, FLIGHT ff 
WHERE ff.ARRIVEAIRPORT =a.AIRPORTCODE 
AND TO_CHAR(ff.departdate,'yyyy-mm-dd')= '2022-12-21'
GROUP BY a.APNATION) cm, airport a2, flight f , airport a1, ticketOption t
WHERE cm.minfee = f.STANDARDFEE 
AND f.ARRIVEAIRPORT = a2.airportcode
AND f.DEPARTAIRPORT =a1.airportcode
AND f.flightnumber = t.flightnumber
AND (a1.apcity='인천' OR a1.airportcode='인천') 
AND t.stock>=1
;

-- everywhere로 검색(왕복, 돌아오는편) 나라별 최저가
SELECT DISTINCT f.flightnumber,a1.apnation, f.STANDARDFEE
FROM(SELECT a.apnation, min(ff.standardfee) AS minfee FROM airport a, FLIGHT ff 
WHERE ff.departAIRPORT =a.AIRPORTCODE 
AND TO_CHAR(ff.departdate,'yyyy-mm-dd')= '2022-12-30'
GROUP BY a.APNATION) cm, airport a2, flight f , airport a1, ticketOption t
WHERE cm.minfee = f.STANDARDFEE 
AND f.ARRIVEAIRPORT = a2.airportcode
AND f.DEPARTAIRPORT =a1.airportcode
AND f.flightnumber = t.flightnumber
AND a1.apnation='일본'
AND a2.airportcode='ICN'
AND t.stock>=1
;

SELECT f.* FROM FLIGHT f 
WHERE TO_CHAR(f.departdate,'yyyy-mm-dd')= '2022-12-30'
ORDER BY STANDARDFEE ;

-- 나라명으로 검색(편도)
SELECT DISTINCT  a2.apcity, f.standardfee, a2.apphoto
FROM ( SELECT a.apcity, min(ff.standardfee) AS minfee FROM airport a, FLIGHT ff 
WHERE ff.ARRIVEAIRPORT =a.AIRPORTCODE 
AND TO_CHAR(ff.departdate,'yyyy-mm-dd')= '2022-12-21'
GROUP BY  a.apcity) cm, FLIGHT F, airport a2, airport a1, ticketOption t
WHERE f.standardfee = cm.minfee
AND a2.apcity = cm.apcity
AND f.arriveairport = a2.airportcode
AND f.DEPARTAIRPORT =a1.airportcode
AND f.flightnumber = t.flightnumber
AND (a1.apcity='인천' OR a1.airportcode='인천') 
AND t.stock>=1
AND a2.apnation='미국'
ORDER BY f.standardfee
;

-- 나라명으로 검색(왕복 리턴) 도시별 최저가
SELECT DISTINCT  a1.apcity, f.standardfee, f.flightnumber
FROM ( SELECT a.apcity, min(ff.standardfee) AS minfee FROM airport a, FLIGHT ff 
WHERE ff.DEPARTAIRPORT =a.AIRPORTCODE 
AND TO_CHAR(ff.departdate,'yyyy-mm-dd')= '2022-12-30'
GROUP BY  a.apcity) cm, FLIGHT F, airport a2, airport a1, ticketOption t
WHERE f.standardfee = cm.minfee
AND a1.apcity = cm.apcity
AND f.arriveairport = a2.airportcode
AND f.DEPARTAIRPORT =a1.airportcode
AND f.flightnumber = t.flightnumber
AND a1.apcity='후쿠오카'
AND a2.airportcode='ICN'
AND t.stock>=1
;


-- 도시명 / 공항으로 검색(편도)
SELECT DISTINCT  f.departdate, f.DEPARTAIRPORT , f.ARRIVEAIRPORT , f.FLIGHTHOURS, 
a1.PACIFICTIME , a2.PACIFICTIME, ar.AIRLINELOGO, f.STANDARDFEE , t.CLASS  
FROM FLIGHT f, airport a2, airport a1, ticketOption t, AIRLINE ar 
WHERE a1.AIRPORTCODE =f.DEPARTAIRPORT 
AND a2.AIRPORTCODE =f.ARRIVEAIRPORT 
AND t.FLIGHTNUMBER =f.FLIGHTNUMBER 
AND ar.AIRLINECODE =f.AIRLINECODE 
AND t.stock>=1
AND TO_CHAR(f.departdate,'yyyy-mm-dd')= '2022-12-21'
AND (a1.apcity='인천' OR a1.airportcode='인천') 
AND (a2.APCITY='FUK' OR a2.AIRPORTCODE='FUK')
AND substr(t.optioncode,15,2)='ec'
;


-- 2003 detail 시간 값 조절했을 때
SELECT DISTINCT f.flightnumber, f.departdate, f.DEPARTAIRPORT , f.ARRIVEAIRPORT , f.FLIGHTHOURS, 
a1.PACIFICTIME , a2.PACIFICTIME, ar.AIRLINELOGO, f.STANDARDFEE , t.CLASS  
FROM FLIGHT f, airport a2, airport a1, ticketOption t, AIRLINE ar 
WHERE a1.AIRPORTCODE =f.DEPARTAIRPORT 
AND a2.AIRPORTCODE =f.ARRIVEAIRPORT 
AND t.FLIGHTNUMBER =f.FLIGHTNUMBER 
AND ar.AIRLINECODE =f.AIRLINECODE 
AND t.stock>=1
AND TO_CHAR(f.departdate,'yyyy-mm-dd')= '2022-12-21'
AND (a1.apcity='인천' OR a1.airportcode='인천') 
AND (a2.APCITY='FUK' OR a2.AIRPORTCODE='FUK')
AND substr(t.optioncode,15,2)='ec'
AND TO_NUMBER(TO_char(f.departdate,'sssss')) >=0 and TO_NUMBER(TO_char(f.departdate,'sssss')) <=86400
ORDER BY f.STANDARDFEE--f.DEPARTDATE--f.FLIGHTHOURS -- --
;



-- 2003 detail 시간 값 조절했을 때(왕복정렬까지포함)
SELECT DISTINCT f1.flightnumber, f1.departdate, f1.DEPARTAIRPORT , f1.ARRIVEAIRPORT , f1.FLIGHTHOURS, 
a1.PACIFICTIME , a2.PACIFICTIME, ar1.AIRLINELOGO, f1.STANDARDFEE , t1.CLASS,
f2.FLIGHTNUMBER,f2.DEPARTDATE, f2.FLIGHTHOURS, ar2.AIRLINELOGO, f2.STANDARDFEE , t2.CLASS 
FROM FLIGHT f1, airport a2, airport a1, ticketOption t1, TICKETOPTION t2, AIRLINE ar1, AIRLINE ar2, FLIGHT f2 
WHERE a1.AIRPORTCODE =f1.DEPARTAIRPORT 
AND a2.AIRPORTCODE =f1.ARRIVEAIRPORT 
AND t1.FLIGHTNUMBER =f1.FLIGHTNUMBER 
AND ar1.AIRLINECODE =f1.AIRLINECODE 
AND t1.stock>=1 AND t2.STOCK >=1
AND a2.AIRPORTCODE =f2.DEPARTAIRPORT AND a1.AIRPORTCODE =f2.ARRIVEAIRPORT 
AND t2.FLIGHTNUMBER =f2.FLIGHTNUMBER AND ar2.AIRLINECODE =f2.AIRLINECODE 
AND TO_CHAR(f1.departdate,'yyyy-mm-dd')= '2022-12-21'
AND TO_CHAR(f2.departdate,'yyyy-mm-dd')= '2022-12-30'
AND (a1.apcity='인천' OR a1.airportcode='인천') 
AND (a2.APCITY='FUK' OR a2.AIRPORTCODE='FUK')
AND substr(t1.optioncode,15,2)='ec'
AND substr(t2.optioncode,15,2)='ec'
AND TO_NUMBER(TO_char(f1.departdate,'sssss')) >=0 and TO_NUMBER(TO_char(f1.departdate,'sssss')) <=86400
AND TO_NUMBER(TO_char(f2.departdate,'sssss')) >=0 and TO_NUMBER(TO_char(f2.departdate,'sssss')) <=86400
ORDER BY f2.departdate --f1.STANDARDFEE+f2.STANDARDFEE --f1.FLIGHTHOURS+f2.FLIGHTHOURS -- --
;


-- 도시, 공항으로 검색했을 때 /// 경유Exp
SELECT DISTINCT  f.departdate, f.DEPARTAIRPORT , f.ARRIVEAIRPORT , f.FLIGHTHOURS, 
a1.PACIFICTIME , a2.PACIFICTIME, ar.AIRLINELOGO, f.STANDARDFEE , t.CLASS  
FROM FLIGHT f, airport a2, airport a1, ticketOption t, AIRLINE ar , airport a3 -- 경유하는 곳
, FLIGHT f2 , TICKETOPTION t2, AIRLINE ar2
WHERE a1.AIRPORTCODE =f.DEPARTAIRPORT 
AND a3.AIRPORTCODE =f.ARRIVEAIRPORT 
AND a2.AIRPORTCODE =f2.DEPARTAIRPORT 
AND a2.AIRPORTCODE =f2.ARRIVEAIRPORT 
AND t.FLIGHTNUMBER =f.FLIGHTNUMBER 
AND t2.FLIGHTNUMBER =f2.FLIGHTNUMBER
AND ar.AIRLINECODE =f.AIRLINECODE 
AND ar2.AIRLINECODE =f2.AIRLINECODE 
AND t.stock>=1 AND t2.stock>=1
AND TO_CHAR(f.departdate,'yyyy-mm-dd')= '2022-12-21'
AND (a1.apcity='인천' OR a1.airportcode='인천') 
AND (a3.apcity LIKE  OR a1.airportcode='인천') 
AND (a2.APCITY='SFO' OR a2.AIRPORTCODE='SFO')
--AND substr(t.optioncode,15,2)='ec'
;

SELECT f1.flightnumber, f2.flightnumber FROM FLIGHT f1, FLIGHT f2 
WHERE f1.ARRIVEAIRPORT =f2.DEPARTAIRPORT 
;



-- 국가이름으로 검색했을 때 결과 (중휘씨한테 국가검색/나라검색했을 때 구분하는거 어떻게 하는지 물어보기) // 직항
-- 코드에서 앞뒤 국가명만 바꿔서 넣으면 왕복에서 돌아오는 티켓 알 수 있음 // 직항
SELECT ap1.apnation, ap1.apcity,ap1.PACIFICTIME , f.flightnumber, f.departdate,f.flighthours,f.standardfee, t.CLASS, 
t.optioncode,ap2.apnation, ap2.apcity, ap2.PACIFICTIME , ap2.apphoto, ar.airlinelogo 
FROM airport ap2, flight f, airport ap1, ticketOption t, airline ar 
WHERE f.arriveairport=ap2.airportcode
AND f.departairport = ap1.airportcode
AND f.flightnumber = t.flightnumber
AND ar.airlinecode = f.airlinecode
AND ap1.apnation='대한민국' --출발국가
AND ap2.apnation='미국' -- 도착국가
AND TO_CHAR(f.departdate,'yyyy-mm-dd')= '2022-12-21' -- 출발일자
AND substr(t.optioncode,15,2)='bs' -- 클래스
AND ap1.apcity='인천' --출발도시
AND ap2.apcity='LA'-- 도착도시
AND t.stock>=1 -- 좌석이 있으면
;





