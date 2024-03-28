Begin
    DROP TABLE payment_fact
END;

Go

CREATE TABLE payment_fact(
    payment_id INT,
    date DATE,
    amount FLOAT,
    rider_id INT
)

GO

INSERT INTO payment_fact (payment_id, date, amount, rider_id)
SELECT p.payment_id as payment_id, p.date as date, p.amount as amount, p.rider_id as rider_id
FROM staging_payment as p

GO

SELECT TOP 10 * from payment_fact

Go