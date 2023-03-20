Drop database if exists VetDB;
Show databases;
create database VetDB CHARACTER SET utf8 COLLATE UTF8_GENERAL_CI ;



Use VetDB;
Show tables;

--AnimalDetails Table
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
  