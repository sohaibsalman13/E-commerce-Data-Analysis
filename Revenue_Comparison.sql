SELECT
    sd.SKU,
    -- sd.ProcessedAt,  
    sd.Revenue AS Actual_Revenue,  
    tr.Target_Revenue,  
    -- Calculate the difference between actual and target revenue
    sd.Revenue - tr.Target_Revenue AS Revenue_Difference
FROM
    SKU_Data sd  
JOIN
    Target_Revenue_SKU tr  
    ON sd.SKU = tr.SKU  -- Join on SKU to match target and actual revenue
ORDER BY
    sd.SKU;
    
   