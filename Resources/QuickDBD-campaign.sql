-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/GmXDgX
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Campaign" (
    "cf_id" Integer   NOT NULL,
    "contact_id" Integer   NOT NULL,
    "company_name" Varchar(30)   NOT NULL,
    "description" Varchar(100)   NOT NULL,
    "goal" Float   NOT NULL,
    "pledged" Integer   NOT NULL,
    "outcome" Varchar(30)   NOT NULL,
    "backers_count" Integer   NOT NULL,
    "country" Varchar(30)   NOT NULL,
    "currency" Varchar(10)   NOT NULL,
    "launch_date" Varchar(30)   NOT NULL,
    "end_date" Varchar(30)   NOT NULL,
    "category_id" Varchar(30)   NOT NULL,
    "subcategory_id" Varchar(30)   NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY (
        "cf_id"
     ),
    CONSTRAINT "uc_Campaign_contact_id" UNIQUE (
        "contact_id"
    ),
    CONSTRAINT "uc_Campaign_category_id" UNIQUE (
        "category_id"
    ),
    CONSTRAINT "uc_Campaign_subcategory_id" UNIQUE (
        "subcategory_id"
    )
);

CREATE TABLE "Category" (
    "category_id" Varchar(30)   NOT NULL,
    "category" Varchar(30)   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "Subcategory" (
    "subcategory_id" Varchar(30)   NOT NULL,
    "subcategory" Varchar(30)   NOT NULL,
    CONSTRAINT "pk_Subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "Contacts" (
    "contact_id" Integer   NOT NULL,
    "firstname" Varchar(30)   NOT NULL,
    "lastname" Varchar(30)   NOT NULL,
    "email" Varchar(30)   NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY (
        "contact_id"
     )
);

ALTER TABLE "Category" ADD CONSTRAINT "fk_Category_category_id" FOREIGN KEY("category_id")
REFERENCES "Campaign" ("category_id");

ALTER TABLE "Subcategory" ADD CONSTRAINT "fk_Subcategory_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "Campaign" ("subcategory_id");

ALTER TABLE "Contacts" ADD CONSTRAINT "fk_Contacts_contact_id" FOREIGN KEY("contact_id")
REFERENCES "Campaign" ("contact_id");

