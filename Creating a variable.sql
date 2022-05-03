SET @qty = (SELECT Quantity
FROM stock
WHERE BookID = 4);
SELECT @qty;

-- If statement to check if qty > 0