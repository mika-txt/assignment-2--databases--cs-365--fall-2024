INSERT INTO website VALUES ("eBay", "https://ebay.com");
INSERT INTO user_info VALUES ("https://ebay.com", "Mika", "D'Aloisio", "mika-txt", "mika@example.com");
INSERT INTO site_password (site_url, my_password) VALUES ("https://ebay.com", AES_ENCRYPT("J^KdfZ;5)R", @key_str, @init_vector));
INSERT INTO comment VALUES ("https://ebay.com", "");

SELECT AES_DECRYPT(my_password, @key_str, @init_vector) FROM site_password WHERE site_url = "https://github.com";

SELECT site_url, AES_DECRYPT(my_password, @key_str, @init_vector), time_created FROM site_password WHERE site_url LIKE "https%" LIMIT 2;
SELECT *, AES_DECRYPT(my_password, @key_str, @init_vector) FROM site_password WHERE site_url LIKE "https%" LIMIT 2;

UPDATE site_password SET site_url="https://twitter.com" WHERE site_url="https://x.com";

UPDATE site_password SET my_password = AES_ENCRYPT("Z-Y!=rqv8R", @key_str, @init_vector) WHERE site_url="https://mysql.com";

DELETE FROM site_password WHERE site_url="https://linkedin.com";

DELETE FROM site_password WHERE my_password = AES_ENCRYPT("Z-Y!=rqv8R", @key_str, @init_vector);
