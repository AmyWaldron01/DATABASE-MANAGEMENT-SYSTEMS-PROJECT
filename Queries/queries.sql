

--1 Query
select a.name ,a.animalName,a.breed, a.gender ,p.staffID, p.dateOfApp,p.timeOfApp, p.location
from AnimalDetails a
Inner join AppointmentDetails p
On a.id = p.animalID;

--2 Query
select m.NameOfMeds, m.price , m.cause,b.firstName as PetOwnerName,b.lastName as PetOwnerLastName,b.billingDate,b.paymentType,b.FullOrHalf
from MedicationDetails m
Inner join BillingDetails b
on m.id =b.MedicationID;

--3 Query 
select b.firstName, b.lastName, b.paymentType,b.FullOrHalf,m.NameOfMeds,m.price, f.AnimalType,f.price,f.QuantityinStock
from BillingDetails b
Inner join MedicationDetails m on m.id = b.MedicationID
Inner join FoodDetails f on f.id = b.foodID;

--4 Query




------NULL 

--------------------------------



