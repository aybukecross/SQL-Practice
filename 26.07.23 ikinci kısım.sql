CREATE TABLE talebeler
(
	id int primary key,  
	isim VARCHAR(50),
	veli_isim VARCHAR(50),
	yazili_notu int
);--parent

CREATE TABLE notlar( 
	talebe_id int,
	ders_adi varchar(30),
	yazili_notu int,
	CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
	ON DELETE CASCADE	
);--child

INSERT INTO talebeler VALUES(122, 'Kerem Can', 'Fatma',75);
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Veli Han', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Tan', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Ahmet Ran', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO talebeler VALUES(128, 'Mustafa Bak', 'Ali', 99);
INSERT INTO talebeler VALUES(129, 'Mehmet Bak', 'Alihan', 89);

INSERT INTO notlar VALUES (123,'kimya',75);
INSERT INTO notlar VALUES (124, 'fizik',65);
INSERT INTO notlar VALUES (125, 'tarih',90);
INSERT INTO notlar VALUES (126, 'Matematik',90);
INSERT INTO notlar VALUES (127, 'Matematik',90);
INSERT INTO notlar VALUES (null, 'tarih',90);

-- ON DELETE CASCADE sadece içindeki verileri silmek için çalışır, tabloyu drop edemezsin.

DROP TABLE talebeler CASCADE

-- DROP TABLE IF EXİSTS tableın olup olmadığından emin değilsen bunu kullanabilirsin

CREATE TABLE musteriler  (
	urun_id int,  
	musteri_isim varchar(50),
	urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

SELECT * FROM musteriler

SELECT * FROM musteriler WHERE urun_isim='Orange' OR urun_isim='Apple' OR urun_isim='Apricot'

-- YA DA İKİNCİ YOL

SELECT * FROM musteriler WHERE urun_isim IN ('Apple', 'Orange', 'Apricot')

SELECT * FROM musteriler WHERE musteri_isim IN ('John', 'Mark', 'Eddie')

-- OLMAYANLARI GETİRMEK İÇİN NOT IN

SELECT * FROM musteriler WHERE musteri_isim NOT IN ('John', 'Mark', 'Eddie')

SELECT * FROM musteriler WHERE urun_id BETWEEN 20 AND 40 -- between and olunca ikinci parametre küçük eşittir olarak sisteme işlenir 

--22-AGGREGATE Fonk.
CREATE TABLE calisanlar3 (
	id int, 
	isim VARCHAR(50), 
	sehir VARCHAR(50), 
	maas int, 
	isyeri VARCHAR(20)
);

INSERT INTO calisanlar3 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar3 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar3 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar3 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar3 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
	marka_id int, 
	marka_isim VARCHAR(20), 
	calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

SELECT * FROM markalar;
SELECT * FROM calisanlar3;

--calisanlar3 tablosunda max maaşı görüntüleyiniz
SELECT MAX(maas) FROM calisanlar3;

--calisanlar3 tablosunda min maaşı gösteriniz.
SELECT MIN(maas) FROM calisanlar3;

--calisanlar3 tablosunda tüm çalışanların toplam maaşını gösteriniz.
SELECT SUM(maas) FROM calisanlar3;

--calisanlar3 tablosunda tüm çalışanların ortalama maaşını gösteriniz.
SELECT AVG(maas) FROM calisanlar3;
SELECT ROUND(AVG(maas),2) FROM calisanlar3;--ondaliklı kısmı 2 basamağa yuvarlar

--calisanlar3 tablosunda tüm çalışanların sayısını gösteriniz.
SELECT COUNT(*) FROM calisanlar3;

--calisanlar3 tablosunda maaşı 2500 olan çalışanların sayısını gösteriniz.
SELECT COUNT(*) FROM calisanlar3 WHERE maas=2500;

--23-ALIASES:Etiket/Rumuz:tabloya veya sütunlarına geçici isim verebiliriz.
CREATE TABLE workers(
	calisan_id char(9),
	calisan_isim varchar(50),
	calisan_dogdugu_sehir varchar(50)
);

INSERT INTO workers VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO workers VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO workers VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT * FROM workers;

SELECT calisan_id AS id,calisan_isim AS isim FROM workers;

-- Concatenation İşlemi: İki sütunu birleştirerek tek bir sütun içinde gösterebilirsiniz.
SELECT calisan_id AS id,calisan_isim || calisan_dogdugu_sehir AS isim_sehir FROM workers;

SELECT calisan_id AS id,calisan_isim ||' - '||calisan_dogdugu_sehir AS isim_sehir FROM workers;
