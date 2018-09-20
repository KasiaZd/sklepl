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
		opakowanie varchar
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