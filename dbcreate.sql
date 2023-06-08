CREATE TABLE GS (
  gsm_id INT,
  pname VARCHAR(50),
  age INT CHECK (age >= 20),
  comdt DATE,
  money INT,
  po CHAR(1) CHECK (po IN ('S','F','C'))
);

INSERT INTO GS (gsm_id, pname, age, comdt, money, po) VALUES (1, 'John', 25, '2023-06-01', 5000, 'S');
INSERT INTO GS (gsm_id, pname, age, comdt, money, po) VALUES  (2, 'Jane', 30, '2023-06-02', 8000, 'F');
INSERT INTO GS (gsm_id, pname, age, comdt, money, po) VALUES  (3, 'Michael', 35, '2023-06-03', 10000, 'C');
INSERT INTO GS (gsm_id, pname, age, comdt, money, po) VALUES  (4, 'Emily', 28, '2023-06-04', 6000, 'S');
INSERT INTO GS (gsm_id, pname, age, comdt, money, po) VALUES (5, 'David', 32, '2023-06-05', 7500, 'F');

select * from gs;

CREATE TABLE GS2 (
  gs2_id INT PRIMARY KEY,
  pname VARCHAR(50),
  age INT CHECK (age >= 20),
  comdt DATE,
  money INT,
  gsm_id INT,
  po CHAR(1) CHECK (po IN ('S','F','C')),
  CONSTRAINT fk_gsm_id FOREIGN KEY (gsm_id) REFERENCES GS(gsm_id)
);

INSERT INTO GS2 (gs2_id, pname, age, comdt, money, gsm_id,po) VALUES (1, 'sinmyongho', 34, '2020-06-01', 500, 2,'F');
INSERT INTO GS2 (gs2_id, pname, age, comdt, money, gsm_id,po) VALUES (2, 'huhjae', 50, '2010-06-01', 300, 1,'S');
INSERT INTO GS2 (gs2_id, pname, age, comdt, money, gsm_id,po) VALUES (3, 'HasungJin', 40, '2015-03-01', 500, 3,'C');
INSERT INTO GS2 (gs2_id, pname, age, comdt, money, gsm_id,po) VALUES (4, 'seojanghun', 48, '2020-06-01', 600, 5,'F');
INSERT INTO GS2 (gs2_id, pname, age, comdt, money, gsm_id,po) VALUES (5, 'wooJiwon', 43, '2020-06-01', 560, 4,'S');

select * from gs,gs2,gsc
where gs2.gsm_id = gs.gsm_id and gs.gsm_id = gsc.gc_id;


CREATE TABLE GSC (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  price INT CHECK (price>0),
  juil INT CHECK (juil > 0),
  sty VARCHAR(50),
  gc_id INT,
  description VARCHAR(200),
  CONSTRAINT fk_gc_id FOREIGN KEY (gc_id) REFERENCES GS(gsm_id)
);

INSERT INTO GSC (product_id, product_name, price, juil, sty, gc_id,description) VALUES (1, 'juchan', 5000,5,'슛 맞춤교육',1,'미친슛코치');
INSERT INTO GSC (product_id, product_name, price, juil, sty, gc_id,description) VALUES (2, 'youngjun', 50,2,'샌드백',3,'이게 왜 코치임');
INSERT INTO GSC (product_id, product_name, price, juil, sty, gc_id,description) VALUES (3, 'Huckgi', 300,1,'포스트업',2,'그냥 함');
INSERT INTO GSC (product_id, product_name, price, juil, sty, gc_id,description) VALUES (4, 'sihwan', 3000,5,'슛 맞춤교육',4,'미친슛코치');
INSERT INTO GSC (product_id, product_name, price, juil, sty, gc_id,description) VALUES (5, 'Jordon', 50000,5,'레전드',5,'레전드코치님');

select * from gsc;