Drop database if exists VetDB;
Show databases;
create database VetDB CHARACTER SET utf8 COLLATE UTF8_GENERAL_CI ;



Use VetDB;
Show tables;

-- AnimalDetails Table
Drop table if exists AnimalDetails;

create table AnimalDetails (
  id tinyint NOT NULL auto_increment, 
  animalName varchar(21) NOT NULL,
  name varchar(21) NOT NULL, 
  breed varchar(21) NOT NULL,
  gender ENUM ('Male', 'Female','Other')NOT NULL,
  picture LONGBLOB, -- Since not Null - Wont cause error if its Null
  picture_Path varchar(69) DEFAULT NULL,
  address varchar(100)  NOT NULL,
  weight float  NOT NULL ,
  
  PRIMARY KEY (id)
  ); 

  describe AnimalDetails;

  Insert into AnimalDetails (animalName, name,breed, gender,picture,picture_Path,address,weight) values
  ('Dog', 'Luke','Golden Retriever', 'Other', load_file('C:/AnimalPictures/animal1.jpg'),'/animal1.jpg','123 WoodQuay',250);

  SELECT * from AnimalDetails;


-- StaffDetails Table
Drop table if exists StaffDetails;

create table StaffDetails (
    id tinyint NOT NULL auto_increment,
    FirstName varchar(21) NOT NULL,
    SecondName varchar(21) NOT NULL,
    address varchar(100)  NOT NULL,
    picture LONGBLOB, -- Since not Null - Wont cause error if its Null
    picture_Path varchar(69) DEFAULT NULL,
    bio varchar(100) NOT NULL,
    salary float  NOT NULL,
    IBAN varchar(100) NOT NULL,

    PRIMARY KEY (id)
);

describe StaffDetails;

  Insert into StaffDetails (FirstName, SecondName ,address,picture,picture_Path,bio,salary,IBAN) values
  ('Amy', 'Waldron','Co Mayo', load_file('C:/StaffPictures/staff.jpg'),'/staff1.jpg','Hi, My name is Amy, My favourite breed of dog is a pug !',100000,'AIB6467539563895');

  SELECT * from StaffDetails;

  -- AppointmentDetails Table
Drop table if exists AppointmentDetails;
Create table AppointmentDetails (
    id tinyint NOT NULL auto_increment,
    staffID tinyint NOT NULL,
    animalID tinyint NOT NULL,
    dateOfApp date NOT NULL,
    timeOfApp time NOT NULL,
    location varchar(50) NOT NULL,
    symptoms varchar(50) NOT NULL,
    diagnosis varchar(50) NOT NULL,
    medication varchar(50) NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (staffID)REFERENCES StaffDetails(id) ,
    FOREIGN KEY (animalID) REFERENCES AnimalDetails(id)
);

describe AppointmentDetails;

  Insert into AppointmentDetails (staffID,animalID,dateOfApp,timeOfApp,location,symptoms,diagnosis,medication) values
  (1,1,'2023-6-20','15:20:00','Castlebar','Vomiting','Posined','Antibotics');

  SELECT * from AppointmentDetails;

  -- MedicationDetails Table
Drop table if exists MedicationDetails;
Create table MedicationDetails (
    id tinyint NOT NULL auto_increment,
    NameOfMeds varchar(100) NOT NULL,
    datasheet varchar(600) NOT NULL,
    price float NOT NULL,
    cause varchar(100) NOT NULL,

    PRIMARY KEY (id)
    
);

describe MedicationDetails;

  Insert into MedicationDetails (NameOfMeds,datasheet,price,cause) values
  ('Antbotics','In dogs: treatment or adjunctive treatment of periodontal infections caused by bacteria susceptible to amoxicillin in combination with clavulanic acid i.e. Pasteurella spp,Streptococcus spp and Escherichia coli.',20.50,'Posioned');

  SELECT * from MedicationDetails;

-- FoodDetails Table
create table FoodDetails (
    id tinyint NOT NULL auto_increment,
    AnimalType ENUM ('Dog', 'Cat','Rabbit','Horse','Bird') NOT NULL,
    supplier varchar(50) NOT NULL,
    size ENUM ('Small','Medium','Large')NOT NULL,
    price float NOT NULL,
    QuantityinStock  float NOT NULL,

    PRIMARY KEY (id)

);

describe FoodDetails;

  Insert into FoodDetails (AnimalType,supplier,size,price,QuantityinStock) values
  ('Dog','PetCo','Small',20.50,50);

  SELECT * from FoodDetails;



  -- BillingDetails Table
Drop table if exists BillingDetails;
Create table BillingDetails (
    id tinyint NOT NULL auto_increment,
    foodID tinyint NOT NULL,
    MedicationID tinyint NOT NULL,
    FirstName varchar(21) NOT NULL,
    LastName varchar(21) NOT NULL,
    billingDate date NOT NULL,
    paymentType ENUM ('Credit Card', 'Cash','Revoult','Cheque') NOT NULL,
    FullOrHalf ENUM ('Full','Partial'),

    PRIMARY KEY (id),
    FOREIGN KEY (foodID)REFERENCES FoodDetails(id),
    FOREIGN KEY (MedicationID)REFERENCES MedicationDetails(id)
);

describe BillingDetails;

  Insert into BillingDetails (foodID, MedicationID,FirstName,LastName,billingDate,paymentType,FullOrHalf) values
  (1,1,'Amy','Waldron','2023-6-25','Cash','Full');

  SELECT * from BillingDetails;


-- PetOwnersDetails Table
Drop table if exists PetOwnersDetails;
Create table PetOwnersDetails (
    id tinyint NOT NULL auto_increment,
    appointmentID tinyint NOT NULL,
    billingID tinyint NOT NULL,
    FirstName varchar(21) NOT NULL,
    LastName varchar(21) NOT NULL,
    address varchar(100)  NOT NULL,
    picture LONGBLOB, -- Since not Null - Wont cause error if its Null
    picture_Path varchar(69) DEFAULT NULL,
    ccDetails varchar(100)  NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (appointmentID)REFERENCES AppointmentDetails(id),
    FOREIGN KEY (billingID)REFERENCES BillingDetails(id)
);

describe PetOwnersDetails;

  Insert into PetOwnersDetails (appointmentID,billingID,FirstName,LastName,address,picture,picture_Path,ccDetails) values
  (1,1,'Bob','Ross','Dublin 123',load_file('C:/PetOwnerPictures/Owners1.jpg'),'/Owner1.jpg','AIB213123432');

  SELECT * from PetOwnersDetails;

