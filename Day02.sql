CREATE TABLE ogrenciler
(
ogrenci_no char(7), --Uzunluğunu bildiğimiz stringler icin CHAR kullanilir
isim varchar(20),	--Uzunluğunu bilmedigimiz stringler icin VARCHAR kullanilir
soyisim varchar(25),
not_ortalaması real, --Ondalıklı sayılar için kullanılır(Double gibi)
kayit_tarihi date --Kayit tarihi icin DATE kullanilir
);

-- VAROLAN BIR TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE notlar
AS
SELECT isim,not_ortalaması FROM ogrenciler;

select * from notlar;

--INSERT - TABLO ICINE VERI EKLEME

INSERT INTO notlar VALUES ('darc',85.5);

select isim from notlar;

-- CONSTRAINT
-- UNIQEU
-- NOT NULL

CREATE TABLE ogrenciler1
(
ogrenci_no char(7) unique, 
isim varchar(20) not null,	
soyisim varchar(25),
not_ortalaması real, 
kayit_tarihi date 
);
select * from ogrenciler1

INSERT INTO ogrenciler1 VALUES ('1234567','furkii','darcii',75.9,now());
INSERT INTO ogrenciler1 VALUES ('1234568','Ali','Veli',75.9,now());
INSERT INTO ogrenciler1 (ogrenci_no,soyisim,not_ortalaması) VALUES ('1234569','darc',89.6);  -- NOT NULL kisitlamasi oldugu icin bu veri eklenemez

-- PRIMARY KEY atamasi

CREATE TABLE ogrenciler2
(
ogrenci_no char(7)primary key, 
isim varchar(20),	
soyisim varchar(25),
not_ortalaması real, 
kayit_tarihi date 
);

-- PRIMARY KEY atamasi 2.yol

CREATE TABLE ogrenciler3
(
ogrenci_no char(7), 
isim varchar(20),	
soyisim varchar(25),
not_ortalaması real, 
kayit_tarihi date,
CONSTRAINT ogr PRIMARY KEY(ogrenci_no)
);

-- FOREIGN KEY

/*Practice 1:
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/

CREATE TABLE tedarikciler3
(
tedarikci_id char(10) PRIMARY KEY,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)
);

CREATE TABLE urunler(
tedarikci_id char(10),
urun_id char(15),
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);
select * from tedarikciler3;
select * from urunler;

/*
Practice 2
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama”
field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve “sehir”
fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
*/

CREATE TABLE calisanlar
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date
);

CREATE TABLE adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); -- UNIQEU CONS. Kabul etmez.
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- NOT NULL. Kabul etmez.
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- UNIQEU CONS. Kabul etmez.
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --INT / STRING
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- PRIMARY KEY
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- PRIMARY KEY
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');

-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

SELECT * FROM calisanlar;
SELECT * FROM adresler;


CREATE TABLE calisanlar1
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000),
ise_baslama date
);

INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' ,19000, '2018-04-14');

-- DQL -- WHERE KULLANIMI

SELECT * FROM calisanlar;
SELECT isim FROM calisanlar;

-- Calisanlar tablosundan maasi 5000'den buyuk olanlari isimleri listeleyiniz.
SELECT isim,maas FROM calisanlar WHERE maas>5000;

-- Calisanlar tablosundan ismi Veli Han olan tum verileri listeleyiniz.
SELECT * FROM calisanlar WHERE isim='Veli Han'

-- Calisanlar tablosundan maasi 5000 olan tum verileri listeleyiniz.
SELECT * FROM calisanlar WHERE maas=5000;

-- DML -- DELETE KOMUTU
DELETE FROM calisanlar; -- Eger parent tablo baska bir child tablo ile iliskili ise once child tablo silinmeli
DELETE FROM adresler;
SELECT * FROM adresler;

-- Adresler tablosundan sehri Antep olan verileri silelim
DELETE FROM adresler WHERE sehir = 'Antep';





