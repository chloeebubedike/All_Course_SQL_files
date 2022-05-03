USE Pizza_Delivery;

CREATE VIEW vw_pizza_type_info_2
AS
SELECT name, ingredients 
FROM Pizza
WITH CHECK OPTION;

SELECT * FROM Pizza_Delivery.vw_pizza_type_info_2;