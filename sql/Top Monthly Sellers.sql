WITH RankedSales AS (
    SELECT 
        product_category, 
        seller_id, 
        SUM(total_sales) AS total_sales,
        ROW_NUMBER() OVER (PARTITION BY product_category ORDER BY SUM(total_sales) DESC) AS sales_rank
    FROM 
        Top_Monthly_Sellers
    WHERE 
        DATEPART(Month, month) = 1
    GROUP BY 
        product_category, 
        seller_id
)
SELECT 
    product_category, 
    seller_id, 
    total_sales
FROM 
    RankedSales
WHERE 
    sales_rank <= 3
ORDER BY 
    product_category, 
    total_sales DESC;
