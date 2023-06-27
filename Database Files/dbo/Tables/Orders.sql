CREATE TABLE [dbo].[Orders] (
    [id]           NCHAR (10)     NULL,
    [date]         DATETIME       NULL,
    [product]      NCHAR (2)      NULL,
    [sales_person] NCHAR (2)      NULL,
    [order_type]   NCHAR (1)      NULL,
    [weight]       NUMERIC (5, 2) NULL
);


GO

