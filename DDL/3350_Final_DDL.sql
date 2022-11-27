create schema if not exists 3350_Final;
use 3350_Final;
-- assumes that you have a schema named 3350_Final
/*DDL File
  all commands are lowercase cause I'm a gangster

  table names are Upper and/or Upper_Upper
  attribute names are lowerUpper
  foreign keys are lowerinital_Upper
  primary and foreign keys are declared after creation of attribute
  constraint names are lower_Upper_Upper etc

  attributes are declared in the above order*/

create table if not exists Customer
(
    ID           integer not null AUTO_INCREMENT,
    customerName varchar(50),
    address      varchar(50),
    postCode     integer,
    email        varchar(50),
    phoneNumber  varchar(20),
    primary key (ID)
);

create table if not exists Bill
(
    ID              integer not null AUTO_INCREMENT,
    billDate        date,
    total           float,
    amountRemaining float,
    c_ID            integer,
    primary key (ID),
    constraint customer_Bill foreign key (c_ID)
        references Customer (ID)
);

create table if not exists Car
(
    ID      varchar(30) not null,
    make    varchar(20),
    model   varchar(20),
    carYear integer,
    mileage integer,
    primary key (ID)
);

create table if not exists Customer_Car
( -- M:N relation
    c_ID integer references Customer (ID),
    VIN  varchar(30) references Car (ID)
);

create table if not exists Ticket
(
    ID         integer     not null AUTO_INCREMENT,
    ticketDate date,
    ticketDesc varchar(255),
    c_ID       varchar(30) not null, -- VIN
    b_ID       integer,
    primary key (ID),
    constraint ticket_Car foreign key (c_ID)
        references Car (ID),
    constraint ticket_Bill foreign key (b_ID)
        references Bill (ID)
);

create table if not exists Part
(
    ID        integer not null AUTO_INCREMENT,
    partName varchar(150),
    price     float,
    amount    integer, -- amount in inventory
    primary key (ID)
);

create table if not exists Service
(
    ID         integer not null AUTO_INCREMENT,
    decription varchar(100),
    laborCost  float,
    partCost   float,
    t_ID       int     not null,
    primary key (ID),
    constraint service_Ticket foreign key (t_ID)
        references Ticket (ID)
);

create table if not exists Part_Service
( -- M:N relation
    s_ID       integer references Service (ID),
    p_ID       integer references part (ID),
    amountUsed integer
);

create table if not exists Vendor
(
    ID          integer not null AUTO_INCREMENT,
    vendorName  varchar(50),
    address     varchar(50),
    phoneNumber varchar(20),
    primary key (ID)
);

create table if not exists Part_Vendor
( -- M:N relation
    p_ID integer references Part (ID),
    v_ID integer references Vendor (ID)
);

create table if not exists Mechanic
(
    ID           integer not null AUTO_INCREMENT,
    mechanicName varchar(20),
    hourlyRate   float,
    primary key (ID)
);

create table if not exists Mechanic_Service
( -- M:N relation
    s_ID integer references Service (ID),
    ms_date date,
    m_ID integer references Mechanic (ID),
    hours float
);