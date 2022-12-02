--Database olusturma
Create database darc;

--DDL - DATA DEFINITION LANG.
--CREATE - TABLO OLUSTURMA
CREATE TABLE ogrenciler
(
ogrenci_no char(7), --Uzunluğunu bildiğimiz stringler icin CHAR kullanilir
isim varchar(20),	--Uzunluğunu bilmedigimiz stringler icin VARCHAR kullanilir
soyisim varchar(25),
not_ortalaması real, --Ondalıklı sayılar için kullanılır(Double gibi)
kayit_tarihi date --Kayit tarihi icin DATE kullanilir
);

--VAROLAN TABLODAN YENİ BİR TABLO OLUŞTURMA
CREATE TABLE ogrenci_notlari
as --Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo olusturmak icin kullanılır.
select isim,soyisim,not_ortalaması,kayit_tarihi from ogrenciler;

-- DML - DATA MANUPULATION LANG.
-- INSERT (Database'e veri ekleme)

INSERT INTO ogrenciler VALUES (1234567,'Furkan','Darıcı',85.5,now());
INSERT INTO ogrenciler VALUES (1234567,'Furkan','Darıcı',85.5,'2022-12-1');

-- BIR TABLOYA PARCALI VERI EKLEMEK ISTERSEK

INSERT INTO ogrenciler (isim,soyisim) VALUES ('Furkan','Darıcı')

-- DQL - DATA QUERY LANG.
-- SELECT

select * FROM ogrenciler; --Burdaki * sembolü herşey anlamındadır



