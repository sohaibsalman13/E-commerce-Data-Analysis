CREATE TABLE IF NOT EXISTS Target_Revenue_SKU (
    SKU VARCHAR(255),
    Original_Revenue DECIMAL(10,2),
    Target_Revenue DECIMAL(10,2)
);

INSERT INTO Target_Revenue_SKU (SKU, Original_Revenue, Target_Revenue)
SELECT 
    sd.SKU, 
    sd.Revenue AS Original_Revenue,
    CASE 
        WHEN RAND() < 0.5 THEN sd.Revenue * (1 + (RAND() * 0.15))  
        ELSE sd.Revenue * (1 - (RAND() * 0.10))  
    END AS Target_Revenue
FROM SKU_Data sd;

