-- select * from shopapp.products  -- * isareti hepsini getirir
-- select Name from shopapp.products 
-- select Name,Price from shopapp.products
-- select Name as ProductsName from shopapp.products   -- isim degistirme

-- DERS 2
-- select * from shopapp.products where Id = 1  -- id si 1 olani cagirma
-- select Name , Price from shopapp.products where Price > 2000 And Price <= 4000
-- select * from shopapp.products where Id = 1 Or Id = 2
-- select * from shopapp.products where Name = 'Samsung S5'
-- select * from shopapp.products where Name != 'Samsung S5'
-- select * from shopapp.products where NOT Name = 'Samsung S5'
-- select * from shopapp.products where Name = 'Samsung S5' and ( Price = 2000 or Price = 3000)

-- DERS 3 Where- Filtreleme Operatorleri
-- select Name , Price from shopapp.products where Price Between 2000 and 4000
-- select Name , Price from shopapp.products where Id NOT Between 1 and 3 
-- select * from shopapp.products where Category IN ('Telephone','Computer')
 -- select * from shopapp.products where Category NOT IN ('Telephone')
 
 -- select * from shopapp.products where Name = 'Samsung' -- dedigimizde kayit gelmez
 -- select * from shopapp.products where  Name LIKE '%Sam%'
-- select * from shopapp.products where  Name LIKE '%o'  -- sonu o ile biten
 -- select * from shopapp.products where  Name LIKE 'S%' -- S ile baslayan
 -- select * from shopapp.products where  Name LIKE 'S_m%' -- 2. karakterin ne oldugu onemlı degıl 
 -- select * from shopapp.products where Name LIKE '%Samsung%' and Description LIKE '%çift sim kart%'
 
 -- DERS 3: Order - Kayıt Sıralama
 -- select * from shopapp.products order by Price  -- ARTAN
 -- select * from shopapp.products order by Price DESC  -- AZALAN
 -- select * from shopapp.products order by Name -- id vs.
 -- select * from shopapp.products order by Category , Price DESC -- once category'e sonra kendi icinde fiyata gore siralama
 
 -- DERS 4: SQL Fonksiyonları - Hesaplama 
 -- min(), max(), count(), avg(), sum()
 
-- select min(price) as 'minimum price' from shopapp.products
 -- select max(price) as 'maximum price' from shopapp.products
 -- select name, price from shopapp.products order by price DESC limit 2 

-- select count(*) from shopapp.products -- kategoride kac tane oldugunu hesaplar 
-- select count(id) from shopapp.products  

-- select avg(price) as 'avarage price' from shopapp.products  -- ortalama price
-- select sum(price * stock) as sum from shopapp.products -- toplam price

-- Ders 3: SQL Fonksiyonlari String

-- select length('Melike Kurt') as karaktersayisi
-- select name, length(name) as karakteruzunlugu from shopapp.products
-- select name, concat(left(name,3), '...') as karakteruzunlugu from shopapp.products  -- concat string birlestirmesi icin , left soldan verilen sayi kadar karakter

-- left - right 

-- lower(), upper()

-- select name, replace(name,' ','-') as name from shopapp.products  -- bosluklari cizgi ile degistirdi

-- select trim(    'Melike Kurt'   ) as name  -- bastaki ve sondaki bosluklari siler
-- ltrim,rtrim sol ve sagdan bosluklar icin ozel 

-- Ders 3: Group By -Distinct
-- select distinct Category from shopapp.products

-- select Category, Count(*) as adet  from shopapp.products group by category
-- select Category, Sum(price) as toplam  from shopapp.products group by category
-- select Category, Avg(price) as ortalama  from shopapp.products group by category
-- select Category, Avg(price) as ortalama from shopapp.products where price>3000 group by category
-- select Category, Count(*) as adet  from shopapp.products group by category having Count(*)>1  -- computer categorysi kosulu gecemedi

-- DERS 3: Kayıt ekleme -INSERT
--  select * from shopapp.products

-- INSERT INTO shopapp.products (Id,Name,Price,Imageurl,Category,Description,Stock) VALUES (7,'Samsung S10',9000,'6.jpg','Telephone','Çok iyi telefon',10);

-- DERS 3: Kayıt Guncelleme - UPDATE
-- UPDATE shopapp.products SET Name = 'Samsung S7' , Price = 3000 WHERE Id=1


-- Hepsi ile ilgili update yaptigimizda (yani where blogu olmadigi durumlarda ) bize guvenlikten dolayi izin vermez bundan oncesinde safe update'i 0 seklinde set etmemiz lazim
-- SET SQL_SAFE_UPDATES = 0;
-- UPDATE shopapp.products SET Price = Price + 1000 

-- UPDATE shopapp.products SET Price = Price * 1.5  -- yuzde onbes zam telefon kategorisinde
-- WHERE Category= 'Telephone'

-- Resmi olmayan urun ekleyelim
-- INSERT INTO shopapp.products (Id,Name,Price,Category,Description,Stock) VALUES (8,'Samsung S10',9000,'Telephone','Çok iyi telefon',10)
-- Resmi guncelleyelim 
-- UPDATE shopapp.products SET imageurl = 'noproducts.jpg' Where imageurl IS NULL

-- DERS 3: Kayit Silme - Delete
-- DELETE from shopapp.products where id = 1 
-- SET SQL_SAFE_UPDATES = 0;
-- DELETE from shopapp.products where price > 2000   -- tum kayitlar silindi 






