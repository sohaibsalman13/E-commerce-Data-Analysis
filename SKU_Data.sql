CREATE OR REPLACE VIEW SKU_Data AS
WITH Details AS (
    SELECT
        JSON_UNQUOTE(JSON_EXTRACT(prod_info, "$.sku")) AS SKU,
        CAST(JSON_UNQUOTE(JSON_EXTRACT(prod_info, "$.price")) AS DECIMAL(10,2)) AS Price,
        CAST(JSON_UNQUOTE(JSON_EXTRACT(prod_info, "$.quantity")) AS INT) AS Quantity
    FROM
        Customer_Data cd,
        JSON_TABLE(LineAggregate, '$[*]' COLUMNS (
            prod_info JSON PATH '$'
        )) AS products
    WHERE
        DATE(ProcessedAt) BETWEEN '2023-01-01' AND '2023-12-31'
)
SELECT
    SKU,
    ROUND(SUM(Price * Quantity), 2) AS Revenue,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Price * Quantity) / NULLIF(SUM(Quantity), 0), 2) AS Revenue_Per_SKU
FROM
    Details
GROUP BY
    SKU;