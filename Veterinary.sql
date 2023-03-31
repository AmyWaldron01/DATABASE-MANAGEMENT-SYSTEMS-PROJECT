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
  picture_path varchar(69) DEFAULT NULL,
  address varchar(100)  NOT NULL,
  weight float  NOT NULL ,
  
  PRIMARY KEY (id)
  ); 

  describe AnimalDetails;

  Insert into AnimalDetails (animalName, name,breed, gender,picture,picture_path,address,weight) values
  ('Dog', 'Luke','Golden Retriever', 'Male', load_file('C:/AnimalPictures/animal1.jpg'),'/animal1.jpg','123 WoodFord',250),
  ('cat', 'joe','Huskey', 'Female', load_file('C:/AnimalPictures/animal2.jpg'),'/animal2.jpg','123 ballybane',250),
  ('parrot', 'Lilly','lovebirds', 'female', load_file('C:/AnimalPictures/animal3.jpg'),'/animal3.jpg','knock co mayo',20),
  ('frog', 'lilly','tree frog', 'male', load_file('C:/AnimalPictures/animal4.jpg'),'/animal4.jpg','123 dublin',5),
  ('Dog', 'Buddy','ShihPoo', 'Male', load_file('C:/AnimalPictures/animal5.jpg'),'/animal5.jpg','Drum Knock Co Mayo',30);

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
  ('Amy', 'Waldron','Co Mayo', load_file('C:/StaffPictures/staff1.jpg'),'/staff1.jpg','Hi, My name is Amy, My favourite breed of dog is a pug !',100000,'AIB6467539563895'),
  ('Luke', 'Dunne','Co Galway', load_file('C:/StaffPictures/staff2.jpg'),'/staff2.jpg','Hi, My name is Luke, My favourite breed of dog is a Huskey !',30000,'AIB932490204'),
  ('Brian', 'Smith','Co Dublin', load_file('C:/StaffPictures/staff3.jpg'),'/staff4.jpg','Hi, My name is Brian, My favourite breed of dog is a Shih Tzu !',20000,'AIB394i93224'),
  ('Conor', 'Waldron','Co Mayo', load_file('C:/StaffPictures/staff4.jpg'),'/staff4.jpg','Hi, My name is Conor, My favourite breed of dog is a pug !',40000,'AIB499043534'),
  ('John', 'OBoyle','Co Limerick', load_file('C:/StaffPictures/staff5.jpg'),'/staff5.jpg','Hi, My name is john, My favourite breed of dog is a king Charles !',50000,'AIB4983945892');

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
    symptoms varchar(500) NOT NULL,
    diagnosis varchar(500) NOT NULL,
    medication varchar(500) NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (staffID)REFERENCES StaffDetails(id) ,
    FOREIGN KEY (animalID) REFERENCES AnimalDetails(id)
);

describe AppointmentDetails;

  Insert into AppointmentDetails (staffID,animalID,dateOfApp,timeOfApp,location,symptoms,diagnosis,medication) values
  (1,1,'2022-6-20','16:20:00','Castlebar','Vomiting','Posined','Antibotics'),
  (2,2,'2022-5-25','12:20:00','Castlebar','netuired','netuired','Onsior'),
  (2,3,'2023-3-10','15:00:00','Castlebar','stop eating, have laboured breathing, head swelling, discharge form their eyes or nose and diarrhoea','Avian Flu','oseltamivir'),
  (4,4,'2023-1-12','19:00:00','Castlebar','Drowsiness,Abnormal wasting ','Ranavirus','Since there is no treatment for Ranavirus, management is focused on biosecurity, quarantine, and decontamination to prevent the spread of the virus to other animals and new environments. Any infected animals should be quarantined to prevent infection of other animals.'),
  (5,5,'2023-2-25','12:20:00','Castlebar','Panic Attacks','Anexity','Zesty Paws Stress and Anxiety Calming Bites.');

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
  ('Antbotics','In dogs: treatment or adjunctive treatment of periodontal infections caused by bacteria susceptible to amoxicillin in combination with clavulanic acid i.e. Pasteurella spp,Streptococcus spp and Escherichia coli.',20.50,'Posioned'),
  ('netuired + Onsior ','For the treatment of pain and inflammation associated with acute or chronic musculoskeletal disordersin cats.For the reduction of moderate pain and inflammation associated with orthopaedic surgery in cats',300,'netuired'),
  ('oseltamivir','The antiviral you have been advised to take is calledOseltamivir (Tamiflu). It comes as a tablet. It is a wellknown antiviral medicine used to prevent or treatinfluenza (“the flu”). It has been used successfully inmany countries for several years.',50.0,'Avian Flu'),
  ('NO MEDS','Quarantine',100,'Ranavirus'),
  ('Zesty Paws Stress and Anxiety Calming Bites.','Soft chews with premium Sensoril® Ashwagandha and Suntheanine® to help support relaxation, calmness, and composure for dogs with normal stress. ',50.0,'Panic Attacks');

  SELECT * from MedicationDetails;

-- FoodDetails Table
create table FoodDetails (
    id tinyint NOT NULL auto_increment,
    AnimalType ENUM ('Dog', 'Cat','frog','Rabbits','parrot') NOT NULL,
    supplier varchar(50) NOT NULL,
    size ENUM ('Small','Medium','Large')NOT NULL,
    price float NOT NULL,
    QuantityinStock  float NOT NULL,

    PRIMARY KEY (id)

);

describe FoodDetails;

  Insert into FoodDetails (AnimalType,supplier,size,price,QuantityinStock) values
  ('Dog','PetCo','large',20.50,50),
  ('cat','CatsAndMats','Small',30,20),
  ('parrot','BirdsCoOp','Small',50,30),
  ('frog','FrogsCoOp','Small',15,5),
  ('Dog','PetCo','medium',100,50);

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
  (1,1,'Bob','Ross','2023-6-25','Cash','Full'),
  (2,2,'Frank','Justin','2023-1-12','revoult','Full'),
  (3,3,'Justin','Barker','2023-2-04','cheque','partial'),
  (4,4,'carter','reece','2023-3-25','Credit Card','Full'),
  (5,5,'lucy','Willson','2023-2-15','Cash','Full');

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
  (1,1,'Bob','Ross','Co Dublin 123',load_file('C:/PetOwnerPictures/Owners1.jpg'),'/Owners1.jpg','AIB213123432'),
  (2,2,'Frank','Justin','Co Mayo  3242',load_file('C:/PetOwnerPictures/Owners2.jpg'),'/Owners2.jpg','AIB34839853'),
  (3,3,'Justin','Barker','Co Limerick',load_file('C:/PetOwnerPictures/Owners3.jpg'),'/Owners3.jpg','AIB89328492'),
  (4,4,'Carter','Reece','Co Cork',load_file('C:/PetOwnerPictures/Owners4.jpg'),'/Owners4.jpg','AIB48378734'),
  (5,5,'Lucy','Willson','Co Meath',load_file('C:/PetOwnerPictures/Owners5.jpg'),'/Owners5.jpg','AIB384934753');

  SELECT * from PetOwnersDetails;

