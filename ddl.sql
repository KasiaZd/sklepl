create table Uzytkownicy
	(
		id serial primary key not null,
		imie varchar not null,
		haslo varchar not null, 
		haslo_szyfrowane varchar not null, 
	    data_dodania date,
	    data_aktualizacji date, 
        id_roli integer	
	);
create table Role --słownik
	( 
		id serial primary key not null,
		kod varchar not null
	); 
create table Adresy 
	(
		id serial primary key not null,
		miasto varchar not null,
		ulica varchar not null, 
		numer_domu integer not null,
		numer_mieszkania integer,
		kod_pocztowy integer not null,
		id_user integer not null
	);
create table Produkty
	(
		id serial primary key not null,
		nazwa varchar not null, 
		ean integer not null, 
		sku integer not null,
		cena integer not null,
		data_utworzenia date, 
		data_aktualizacji date, 
		id_opakowanie integer
	);
	-- słownik 
create table "LukaszSklep"."Opakowanie"
	(
		id serial primary key not null,
		kod varchar not null,
		ilosc integer, 
		jednostka varchar
	);
create table Zamowienia
	(
		id serial primary key not null,
		numer integer not null,
		suma integer not null,
		id_adres integer not null, 
		numer_przesylki integer not null,
		firma_przewozowa varchar,
        czy_dostarczona boolean,
        data_wysylki date,
        data_utworzenia date,
        data_aktualizacji date,
        wystawil varchar,
		id_user integer not null        
	);
--tabele pośrednie 
create table user2adres 
	(
		id_user integer not null,
		id_adres integer not null
	);
create table zamow2produk
	(
		id_produkt integer not null, 
		id_zamowienia integer not null,
		cena integer not null,
		nazwa varchar not null,
		sku integer not null,
		ean integer not null,
        data_utworzenia date, 
        data_aktualizacji date
	);
    
    
    Insert into "LukaszSklep".Role (id, kod) Values (1, 'admin');
    Insert into "LukaszSklep".Role (id, kod) Values (2, 'akceptant');
    Insert into "LukaszSklep".Role (id, kod) Values (3, 'klient');
        
    Insert into "LukaszSklep".Uzytkownicy (id, imie, haslo, haslo_szyfrowane, data_dodania, data_aktualizacji, id_roli)
        values (1, 'admin', 'admin', 'admin', '2018-09-28 ', '2018-09-28', 1);    
    Insert into "LukaszSklep".Uzytkownicy (id, imie, haslo, haslo_szyfrowane, data_dodania, data_aktualizacji, id_roli)
        values (2, 'Luk', 'lukasz', 'lukasz', '2018-09-28', '2018-09-28', 2);
    Insert into "LukaszSklep".Uzytkownicy (id, imie, haslo, haslo_szyfrowane, data_dodania, data_aktualizacji, id_roli)
        values (3, 'kate', 'kate', 'kate', '2018-09-28', '2018-09-28', 3);
        
    Insert into "LukaszSklep".Adresy (id, miasto, ulica, numer_domu, numer_mieszkania, kod_pocztowy, id_user)
        values (1, 'Zduńska Wola', 'Sieradzka', 12, 99, 98200, 2);
    Insert into "LukaszSklep".Adresy (id, miasto, ulica, numer_domu, numer_mieszkania, kod_pocztowy, id_user)
        values (2, 'Warszawa', 'Marszałkowska', 12, 99, 00200, 3);
    
    Insert into "LukaszSklep".Produkty (id, nazwa, ean, sku, cena, data_utworzenia, data_aktualizacji, opakowanie)
        values (1, 'piwo marki piwo', 2346789652, 32234, 2, '2018-09-28', '2018-09-28', 'butelka');
    Insert into "LukaszSklep".Produkty (id, nazwa, ean, sku, cena, data_utworzenia, data_aktualizacji, opakowanie)
        values (2, 'jabłka', 2346789357, 32134, 3, '2018-09-28', '2018-09-28', 'luz');
    Insert into "LukaszSklep".Produkty (id, nazwa, ean, sku, cena, data_utworzenia, data_aktualizacji, opakowanie)
        values (3, 'cukierki Michałki', 2346780982, 32334, 12, '2018-09-28', '2018-09-28', 'luz'); 

    Insert into "LukaszSklep".Opakowanie (id,	kod, ilosc, jednostka) values (1, 'butelka', 330, 'ml');
    Insert into "LukaszSklep".Opakowanie (id,	kod, ilosc, jednostka) values (2, 'luz', 1, 'kg');
    Insert into "LukaszSklep".Opakowanie (id,	kod, ilosc, jednostka) values (3, 'karton', 1, 'kg');
/

alter table "LukaszSklep".produkty rename column opakowanie to  id_opakowanie;
alter table "LukaszSklep".produkty ALTER COLUMN id_opakowanie TYPE integer; 

