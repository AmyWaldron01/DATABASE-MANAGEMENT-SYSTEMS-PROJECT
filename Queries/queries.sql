

--Query 1 retrieves a list of appointments with the corresponding animal details (name, animal name, breed, and gender) for each appointment.
select a.name ,a.animalName,a.breed, a.gender ,p.staffID, p.dateOfApp,p.timeOfApp, p.location
from AnimalDetails a
Inner join AppointmentDetails p
On a.id = p.animalID;

--Query 2 retrieve information on medications and their correspondind details
select m.NameOfMeds, m.price , m.cause,b.firstName as PetOwnerName,b.lastName as PetOwnerLastName,b.billingDate,b.paymentType,b.FullOrHalf
from MedicationDetails m
Inner join BillingDetails b
on m.id =b.MedicationID;

--Query 3 Retrives information from three tables, BillingDetails, MedicationDetails, and FoodDetails, by performing two inner joins.
select b.firstName, b.lastName, b.paymentType,b.FullOrHalf,m.NameOfMeds,m.price, f.AnimalType,f.price,f.QuantityinStock
from BillingDetails b
Inner join MedicationDetails m on m.id = b.MedicationID
Inner join FoodDetails f on f.id = b.foodID;

--Query 4 Retrieve and list all appointments involving female animals and their Name and assigned staff
SELECT ad.*, sd.FirstName AS staffFirstName, sd.SecondName AS staffSecondName,
adt.animalName as Animal, adt.gender AS animalGender, adt.name AS PetName
FROM AppointmentDetails ad
JOIN AnimalDetails adt ON ad.animalID = adt.id
JOIN StaffDetails sd ON ad.staffID = sd.id
WHERE adt.gender = 'Female';

--Query 5  retrieve all the transactions in February by cash
SELECT *
FROM AppointmentDetails a
INNER JOIN BillingDetails b ON a.id = b.id
WHERE b.paymentType = 'cash'
AND MONTH(a.dateOfApp) = 2;


--Query 6 Retrieve the staff members who have treated animals that have a weight greater than 50 kg, along with the count of appointments they had.
SELECT s.*, COUNT(ad.id) AS appointmentCount FROM StaffDetails s 
INNER JOIN AppointmentDetails ad ON s.id = ad.staffID 
INNER JOIN AnimalDetails a ON ad.animalID = a.id 
WHERE a.weight > 50 
GROUP BY s.id;

--Query 7 Retrieve the appointments that have been scheduled for staff member with the ID of 2, along with the details of the animal that has the appointment, sorted by date and time.
SELECT ad.*, a.* FROM AppointmentDetails ad 
INNER JOIN AnimalDetails a ON ad.animalID = a.id 
WHERE ad.staffID = 2 
ORDER BY ad.dateOfApp ASC, ad.timeOfApp ASC;


--Query 8 Retrieve the staff members who have treated more than one animal, along with the count of animals they treated
SELECT s.*, COUNT(DISTINCT ad.animalID) AS animalCount FROM StaffDetails s 
INNER JOIN AppointmentDetails ad ON s.id = ad.staffID 
GROUP BY s.id 
HAVING COUNT(DISTINCT ad.animalID) > 1;

--Query 9  Retrieve the staff members who have a salary greater than 30,000 euros, and sort them in descending order of salary
SELECT * FROM StaffDetails 
WHERE salary > 30000 
ORDER BY salary DESC;

--Query 10 Retrieve the animals that have been seen by staff member with the ID of 3, along with the details of the appointments, sorted by date.
SELECT a.* , ad.* FROM AnimalDetails a
INNER JOIN AppointmentDetails ad ON a.id = ad.animalID
WHERE ad.staffID = 5
ORDER BY ad.dateOfApp ASC;




--------------------------------
--Trial and error with queries

SELECT p.FirstName, a.animalName, a.gender, s.FirstName, s.SecondName, ad.dateOfApp, ad.timeOfApp
FROM AnimalDetails a
JOIN PetOwnersDetails p ON a.id = p.animalID
JOIN AppointmentDetails ad ON a.id = ad.animalID
JOIN StaffDetails s ON ad.staffID = s.id
WHERE a.gender = 'Female'
ORDER BY ad.dateOfApp, ad.timeOfApp;



---------------------------------
SELECT ccDetails, dateOfApp, timeOfApp
FROM AppointmentDetails
WHERE MONTH(dateOfApp) = 2
AND ccDetails = 'cash';

SELECT *
FROM AppointmentDetails a
INNER JOIN BillingDetails b ON a.id = b.id
WHERE b.paymentType = 'cash'
AND MONTH(a.dateOfApp) = 2;

---