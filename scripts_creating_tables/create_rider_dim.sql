Begin
    Drop table rider_dim
end;

GO

CREATE Table rider_dim(
    rider_id int,
    first varchar(50),
    last varchar(50),
    address varchar(255),
    birthday date,
    account_start_date date,
    account_end_date date,
    is_member bit
)

GO

Insert into rider_dim(rider_id, first, last, address, account_start_date, account_end_date, birthday, is_member)
Select 
    r.rider_id as rider_id,
    r.first as first,
    r.last as last,
    r.address as address,
    Convert(Datetime, SUBSTRING(r.birthday,1,19),120) as birthday,
    Convert(Datetime, SUBSTRING(r.account_start_date,1,19),120) as account_start_date,
    Convert(Datetime, SUBSTRING(r.account_end_date,1,19),120) as account_end_date,
    r.is_member as is_member
From staging_rider as r

go 

Select top 10 * from rider_dim
