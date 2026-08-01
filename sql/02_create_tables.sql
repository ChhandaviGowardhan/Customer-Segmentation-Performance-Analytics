USE customer_segmentation;

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID BIGINT,
    Country VARCHAR(100),
    TotalAmount DECIMAL(12,2)
);

DROP TABLE IF EXISTS customer_segments;

CREATE TABLE customer_segments (
    CustomerID BIGINT,
    Recency INT,
    Frequency INT,
    Monetary DECIMAL(15,2),
    TotalQuantity INT,
    Cluster INT,
    Segment VARCHAR(100)
);

DROP TABLE IF EXISTS customer_rfm;

CREATE TABLE customer_rfm (
    CustomerID BIGINT,
    Recency INT,
    Frequency INT,
    Monetary DECIMAL(15,2),
    TotalQuantity INT
);