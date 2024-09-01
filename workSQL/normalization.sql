DROP TABLE IF EXISTS "actual_shipment";
DROP TABLE IF EXISTS "contract";
DROP TABLE IF EXISTS "customers";
DROP TABLE IF EXISTS "goods";

CREATE TABLE IF NOT EXISTS "goods"(
    "id" serial PRIMARY KEY,
    "name_goods" VARCHAR(256) NOT NULL CHECK ("name_goods" != ''),
    "price" DECIMAL(10,2) NOT NULL CHECK ("price">0 )
);

CREATE TABLE IF NOT EXISTS "customers"(
    "id" serial PRIMARY KEY,
    "full_name" VARCHAR(64) NOT NULL CHECK ("full_name" != ''),
    "address" VARCHAR(256),
    "phone_number" VARCHAR(15) NOT NULL CHECK ("phone_number" != '') UNIQUE
);

CREATE TABLE IF NOT EXISTS "contract"(
    "id" serial PRIMARY KEY,
    "goods_id" INT REFERENCES "goods"("id"),
    "customer_id" INT REFERENCES "customers"("id"),
    "createdate_contract" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "quantity" INT NOT NULL CHECK ("quantity" >0 ) DEFAULT 1
);

CREATE TABLE IF NOT EXISTS "actual_shipment"(
    "id" serial PRIMARY KEY,
    "contract_id" INT REFERENCES "contract"("id"),
    "createdate_shipment" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "quantity_shipment" INT NOT NULL CHECK ("quantity_shipment" >0 ) DEFAULT 1,
    "address" VARCHAR(256) NOT NULL CHECK ("address" != ''),
    "receiver" VARCHAR(256) NOT NULL CHECK ("receiver" != '')
);