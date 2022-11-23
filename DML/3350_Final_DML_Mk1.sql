use 3350_Final; -- assumes that you have a schema named 3350_Final
/*DDL File
  all commands are lowercase cause I'm a gangster

  table names are Upper and/or Upper_Upper
  attribute names are lowerUpper
  foreign keys are lower_Upper
  primary and foreign keys are declared after creation of attribute
  constraint names are lower_Upper_Upper etc

  attributes are declared in the above order*/

create table if not exists Bill (
    ID         integer,
    billDate   date,
    total      float,
    amountPaid float,
    c_ID       integer,
    primary key (ID)
);

create table if not exists Customer (
    ID integer,
    customerName varchar(50),
    email varchar(50),
    postCode integer,
    phoneNumber varchar(20),
    b_ID integer,
    primary key (ID),
    constraint bill_Customer foreign key (b_ID)
        references Bill (ID)
);

create table if not exists Car (
    ID integer,
    make varchar(20),
    model varchar(20),
    carYear integer,
    mileage integer,
    primary key(ID)
);

create table if not exists Ticket (
    ID integer,
    ticketDate date,
    serviceReq varchar(100),
    ticketDesc varchar(255),
    c_ID integer,
    primary key(ID),
    constraint ticket_Car foreign key (c_ID)
        references Car (ID)
);

create table if not exists Service (
    ID integer,
    partService float,
    laborCost float,
    serviceDate date,
    primary key(ID)
);

create table if not exists Part (
    ID integer,
    priceName varchar(50),
    price float,
    amount integer, -- amount in inventory
    primary key(ID)
);

create table if not exists Vendor (
    ID integer,
    vendorName varchar(50),
    address varchar(50),
    primary key(ID)
);

create table if not exists Mechanic (
    ID integer,
    mechanicName varchar(20),
    hourlyRate float,
    primary key(ID)
);

create table if not exists Customer_Car( -- Associative Entity b/c M:N
   c_ID integer references Customer (ID),
   VIN integer references Car (ID)
);

create table if not exists ServiceRecord ( -- this will probably break everything
    partID integer, -- partUsed too I think cause I'm dumb
    serviceID integer,
    sr_Name varchar(20),
    amountUsed integer,
    primary key (partID, serviceID),
    constraint part_ID_Service_Record foreign key (partID)
        references Part (ID),
    constraint  service_ID_Service_Record foreign key (serviceID)
        references Service (ID)
);


create table if not exists Part_Vendor (
    p_ID integer references Part (ID),
    v_ID integer references Vendor (ID)
    );

create table if not exists Mechanic_Service (
    m_ID integer references Mechanic (ID),
    s_ID integer references Service (ID)
);