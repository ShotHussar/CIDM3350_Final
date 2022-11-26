create schema if not exists 3350_Final;
use 3350_Final; -- assumes that you have a schema named 3350_Final
/*DDL File
  all commands are lowercase cause I'm a gangster

  table names are Upper and/or Upper_Upper
  attribute names are lowerUpper
  foreign keys are lowerinital_Upper
  primary and foreign keys are declared after creation of attribute
  constraint names are lower_Upper_Upper etc

  attributes are declared in the above order*/

create table if not exists Customer (
    ID integer not null,
    customerName varchar(50),
    address varchar(50),
    postCode integer,
    email varchar(50),
    phoneNumber varchar(20),
    primary key (ID)
);

create table if not exists Bill (
    ID         integer not null ,
    billDate   date,
    total      float,
    amountRemaining float,
    c_ID integer,
    primary key (ID),
    constraint customer_Bill foreign key (c_ID)
        references Customer (ID)
);

create table if not exists Car (
    ID varchar(30) not null,
    make varchar(20),
    model varchar(20),
    carYear integer,
    mileage integer,
    primary key(ID)
);

create table if not exists Customer_Car( -- M:N relation
   c_ID integer references Customer (ID),
   VIN integer references Car (ID)
);

create table if not exists Ticket (
    ID integer not null,
    ticketDate date,
    ticketDesc varchar(255),
    c_ID varchar(30) not null, -- VIN
    b_ID integer not null,
    primary key(ID),
    constraint ticket_Car foreign key (c_ID)
        references Car (ID),
    constraint ticket_Bill foreign key (b_ID)
        references Bill (ID)
);

create table if not exists Part (
    ID integer not null,
    priceName varchar(150),
    price float,
    amount integer, -- amount in inventory
    primary key(ID)
);

create table if not exists Service (
    ID integer not null,
    decription varchar(100),
    laborCost float,
    partCost float,
    t_ID int not null,
    primary key(ID),
    constraint service_Ticket foreign key (t_ID)
        references Ticket (ID)
);

create table if not exists Part_Service ( -- M:N relation
    p_ID integer references Part (ID),
    s_ID integer references Service (ID),
    amountUsed integer,
    primary key (p_ID, s_ID)
);

create table if not exists Vendor (
    ID integer not null,
    vendorName varchar(50),
    address varchar(50),
    phoneNumber varchar(20),
    primary key(ID)
);

create table if not exists Part_Vendor ( -- M:N relation
    p_ID integer references Part (ID),
    v_ID integer references Vendor (ID)
    );

create table if not exists Mechanic (
    ID integer not null,
    mechanicName varchar(20),
    hourlyRate float,
    primary key(ID)
);

create table if not exists Mechanic_Service ( -- M:N relation
    m_ID integer references Mechanic (ID),
    s_ID integer references Service (ID)
);