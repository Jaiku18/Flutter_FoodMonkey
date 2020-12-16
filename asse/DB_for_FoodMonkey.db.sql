BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Menus" (
	"Hotel_id"	INTEGER,
	"Dish_Name"	TEXT,
	"Dish_Description"	TEXT,
	"Amount"	NUMERIC,
	"Image"	TEXT,
	"Veg/NonVeg"	TEXT,
	FOREIGN KEY("Hotel_id") REFERENCES "hotels"("id")
);
CREATE TABLE IF NOT EXISTS "hotels" (
	"id"	INTEGER,
	"hotel_name"	TEXT,
	"Area"	TEXT,
	"Cusine"	TEXT,
	"Timing"	TEXT,
	"Image"	TEXT,
	"Amount"	TEXT,
	"Rating"	TEXT,
	"lat"	TEXT,
	"lon"	TEXT,
	"onlyVeg"	INTEGER,
	PRIMARY KEY("id")
);
INSERT INTO "hotels" VALUES (1,'testing','testing','testing','testing',NULL,'testing','testing','testing','testing',NULL);
INSERT INTO "hotels" VALUES (2,'Salem RR','Thuraipakam','North Indian, Chinese, Chettinad, Beverages','45 Mins','UI/SalemRR.PNG','350','3.9','12.9876121916','80.2183274883',0);
INSERT INTO "hotels" VALUES (3,'Chennai Darbar Restaurant','Ashok Nagar','Chinese,Indian,Middle Eastern','25 Mins','UI/Chennai_Darbar_Restaurant.PNG','450','3.8','13.0373','80.2123',0);
INSERT INTO "hotels" VALUES (4,'Sandwich Square','Perungudi','Indian,Cafe,Fast food','30 Mins','UI/Sandwich_Square.PNG','150','3.7','13.1143','80.1548',0);
COMMIT;
