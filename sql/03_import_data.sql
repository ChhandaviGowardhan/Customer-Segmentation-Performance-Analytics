LOAD DATA LOCAL INFILE 'C:/Users/Hp/Desktop/Customer-Segmentation-Retail-Analytics/data/processed/cleaned_sales_data.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country,
    TotalAmount
);

LOAD DATA LOCAL INFILE 'C:/Users/Hp/Desktop/Customer-Segmentation-Retail-Analytics/data/processed/customer_rfm.csv'
INTO TABLE customer_rfm
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    CustomerID,
    Recency,
    Frequency,
    Monetary,
    TotalQuantity
);

LOAD DATA LOCAL INFILE 'C:/Users/Hp/Desktop/Customer-Segmentation-Retail-Analytics/data/processed/customer_segments.csv'
INTO TABLE customer_segments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    CustomerID,
    Recency,
    Frequency,
    Monetary,
    TotalQuantity,
    Cluster,
    Segment
);