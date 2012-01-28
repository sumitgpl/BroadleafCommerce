--
-- The Archetype is configured with "hibernate.hbm2ddl.auto" value="create-drop" in "persistence-mycompany.xml".
--
-- This will cause hibernate to populate the database when the application is started by processing the files that
-- were configured in the hibernate.hbm2ddl.import_files property.
--
-- This file is responsible for loading the the catalog data used in the Archetype.
--
-- Create BLC ROLES (These roles are required for the admin)
--

-- Sample Category
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,DISPLAY_TEMPLATE,LONG_DESCRIPTION,NAME,URL,URL_KEY,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_END_DATE,ACTIVE_START_DATE) VALUES (1,'Store',NULL,NULL,'Store',NULL,'store',NULL,'2020-01-01 00:00:00',CURRENT_DATE);

-- Sample Products
INSERT INTO BLC_PRODUCT (PRODUCT_ID,DEFAULT_CATEGORY_ID,NAME,LONG_DESCRIPTION,IS_FEATURED_PRODUCT,IS_MACHINE_SORTABLE,WIDTH,HEIGHT,DEPTH,MANUFACTURE,MODEL,WEIGHT,ACTIVE_END_DATE,ACTIVE_START_DATE) VALUES (1,1,'Item 1',NULL,FALSE,TRUE,NULL,NULL,NULL,'MyCompany',NULL,NULL,'2020-01-01 00:00:00',CURRENT_DATE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,DEFAULT_CATEGORY_ID,NAME,LONG_DESCRIPTION,IS_FEATURED_PRODUCT,IS_MACHINE_SORTABLE,WIDTH,HEIGHT,DEPTH,MANUFACTURE,MODEL,WEIGHT,ACTIVE_END_DATE,ACTIVE_START_DATE) VALUES (2,1,'Item 2',NULL,TRUE,TRUE,NULL,NULL,NULL,'MyCompany',NULL,NULL,'2020-01-01 00:00:00',CURRENT_DATE);

-- Both of the sample products are in the sample category
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (DISPLAY_ORDER, PRODUCT_ID, CATEGORY_ID) VALUES (1,1,1);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (DISPLAY_ORDER, PRODUCT_ID, CATEGORY_ID) VALUES (2,2,1);

-- Sample Skus
INSERT INTO BLC_SKU (SKU_ID,NAME,DESCRIPTION,RETAIL_PRICE,SALE_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_END_DATE,ACTIVE_START_DATE) VALUES (1,'Item 1',NULL,19.99,19.99,'Y','Y','2020-01-01 00:00:00',CURRENT_DATE);
INSERT INTO BLC_SKU (SKU_ID,NAME,DESCRIPTION,RETAIL_PRICE,SALE_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_END_DATE,ACTIVE_START_DATE) VALUES (2,'Item 2',NULL,15.99,15.99,'Y','Y','2020-01-01 00:00:00',CURRENT_DATE);

-- Simple product / sku mapping (1 to 1)
INSERT INTO BLC_PRODUCT_SKU (PRODUCT_ID, SKU_ID) VALUES (1,1)
INSERT INTO BLC_PRODUCT_SKU (PRODUCT_ID, SKU_ID) VALUES (2,2)

-- A custom extension of the sku for mycompany - this is meant to demonstrate a BLC extension
-- that your organization needs.
INSERT INTO PRODUCT_SKU_MYCOMPANY (PRODUCT_ID) VALUES (1)
INSERT INTO PRODUCT_SKU_MYCOMPANY (PRODUCT_ID) VALUES (2)

-- Mapping from product to sku
INSERT INTO BLC_PRODUCT_SKU_XREF VALUES(1,1);
INSERT INTO BLC_PRODUCT_SKU_XREF VALUES(2,2);