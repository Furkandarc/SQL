--GROUP BY

CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,  
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

SELECT * FROM personel

-- 1)Isme gore toplam maaslari bulun

SELECT isim,sum(maas) FROM personel
GROUP BY isim

DELETE FROM personel

-- 2)Personel tablosunda'ki isimleri gruplayiniz

SELECT isim FROM personel GROUP BY isim



--HAVING:
--SADECE GROUP BY ILE KULLANILIR, WHERE YERINE KULLANILIR, SONA YAZILIR.

--1) Her sirketin MIN maaslarini eger 4000’den buyukse goster
SELECT * FROM personel

SELECT sirket,min(maas) as en_dusuk_maas FROM personel
GROUP BY sirket
HAVING min(maas)>4000