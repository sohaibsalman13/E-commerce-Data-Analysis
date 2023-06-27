DECLARE @id INT = 0;
DECLARE @date DATETIME = getdate();
DECLARE @product INT = 0;
DECLARE @sales_person INT = 0;
DECLARE @order_type INT = 0;
DECLARE @weight INT = 0 ;

DECLARE @i INT = 1

WHILE (@i <= 20)
    BEGIN
        WAITFOR DELAY '00:00:01'
        SET @id = abs(checksum(newid()) % 999999);
        SET @date = getdate();
        SET @product = abs(checksum(newid()) % 10) + 10;
        SET @sales_person = (abs(checksum(newid()) % 5) + 1) + 10 ;
        SET @order_type = abs(checksum(newid()) % 3) + 1;
        SET @weight = abs(checksum(newid()) % 10) + 1;
        INSERT INTO Orders VALUES (@id, @date, @product, @sales_person, @order_type, @weight);

        SET @i = @i + 1;

    END 

