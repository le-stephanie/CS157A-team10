# CS157A-team10
CS157A Term Group Project
**creating tables**
CREATE DATABASE AniShell;
USE Anishell;

CREATE TABLE Animal(
	pet_id INT PRIMARY KEY,
	name CHAR(30) UNIQUE,
	age INT UNIQUE,
	color CHAR(30) UNIQUE,
	sex CHAR(1) UNIQUE, 
	adoption_status BOOLEAN UNIQUE
);
CREATE TABLE User(
user_id CHAR(30) PRIMARY KEY,
status CHAR(10),
User_name CHAR(30),
contact_info CHAR(30)
);
CREATE TABLE Employee(
	employee_id CHAR(30),
	shelter_id CHAR(30),
	name CHAR(30),
	PRIMARY KEY(employee_id, shelter_id)
);

CREATE TABLE Dog(
	pet_id INT PRIMARY KEY,
	dog_breed CHAR(30),
	leash_trained BOOLEAN
);

CREATE TABLE Cat(
	pet_id INT PRIMARY KEY,
            Cat_breed CHAR(30),
	litter_trained BOOLEAN,
	indoor_outdoor VARCHAR(8)
);
CREATE TABLE Bird(
	pet_id INT PRIMARY KEY,
	bird_species CHAR(10),
	handling CHAR(10)
);
CREATE TABLE Bunny(
	pet_id INT PRIMARY KEY,
            bunny_breed CHAR(30)
);
CREATE TABLE Shelter(
	shelter_id CHAR(30) PRIMARY KEY,
	name CHAR(30),
	address CHAR(50),
	phone_number CHAR(15)
);
CREATE TABLE Adopt_Surrender(
	user_id CHAR(30),
	animal_id CHAR(30),
            status CHAR(30),
	PRIMARY KEY(user_id, animal_id)
);
CREATE TABLE Contacts(
	shelter_id CHAR(30),
	user_id CHAR(30),
	date DATE,
	time TIME,
	PRIMARY KEY(shelter_id, user_id)
);

**Animals**
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(1,'Snowflake', 2, 'tan', 'F', false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(2,'Blueberry', 3, 'black','F', false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(3,'Shadow', 1, 'grey', 'M', false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(4,'Lucky', 3, 'brown', 'F',false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(5,'Laika', 2, 'tan', 'M', false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(6,'Frida', 2, 'black', 'F', false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(7,'Vado', 2, 'white', 'M', false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(8,'Patton', 2, 'blue merle', 'F', false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(9,'Zana', 2, 'red merle', 'M', false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(10,'Zeus', 2, 'tan', 'F',false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(11,'Dexter', 7, 'brown', 'M', false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(12,'Loco', 8,  'black', 'F', false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(13,'Callie', 12,'tan', 'M', false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(14,'Coco', 0.5, 'grey', 'F', false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(15,'Bailey', 10, 'brindle', 'M', false);

insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(16, 'Fly', 2, 'Blue', 'M', False);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(17, 'Soar', 1, 'White', 'F', True);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(18, 'Blue', 10, 'Blue', 'M', False);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(19, 'Silvia', 12, 'Blue', 'F', False);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(20, 'Nigel', 20, 'White', 'M', True);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(21, 'Red', 5, 'Red', 'M', False);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(22, 'Triangle', 5, 'Yellow',  'M', False);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(23, 'Falcon', 2, 'Brown', 'M', True);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(24, 'Robin', 75, 'Red', 'M', False);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(25, 'Hawkeye', 65, 'Purple', 'M', False);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(26, 'Ho-Ho', 100, 'Red', 'F', True);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(27, 'Donald', 80, 'White', 'M', False);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(28, 'Daffy', 50, 'Black', 'M', True);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(29, 'Daisy', 40, 'White', 'F', False);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(30, 'Rat', 10, 'Grey', 'F', True);

insert into AniShell.Animal(pet_id, name, age, color, sex,adoption_status)Values(31,'Pong', 2, 'tan', 'F', false);
insert into AniShell.Animal(pet_id, name, age, color,sex, adoption_status)Values(32,'Rasputin', 3, 'black','F', false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(33,'Dart', 1, 'grey', 'M', false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(34,'Lucky', 3, 'brown', 'F',false);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(35,'Dart', 2, 'tan', 'M', false);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(36,'Tusk', 2, 'black', 'F', false);
insert into AniShell.Animal(pet_id, name, age, color, sex, adoption_status)Values(37,'Caesar', 2, 'white', 'M', false);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(38,'Isabella', 2, 'blue', 'F', false);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(39,'Zip', 2, 'red merle', 'M', false);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(40,'Zara', 2, 'tan', 'F',false);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(41,'Dex', 7, 'brown', 'M', false);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(42,'Lola', 8,  'black', 'F', false);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(43,'Winston', 12,'tan', 'M', false);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(44,'Coco', 0.5, 'grey', 'F', false);
insert into AniShell.Animal(pet_id, name, age, color,  sex,adoption_status)Values(45,'Pumpkin', 10, 'brindle', 'M', false);

insert into AniShell.Animal(pet_id, name, age, color, sex,adoption_status)Values(46, 'Pizza', 5, 'Brown', 'M', True,);
insert into AniShell.Animal(pet_id, name, age, color, sex,adoption_status)Values(47, 'Clifford', 2, 'Red', 'M', False,);
insert into AniShell.Animal(pet_id, name, age, color, sex,adoption_status)Values(48, 'Luxray', 6, 'Black', 'F', True);
insert into AniShell.Animal(pet_id, name, age, color, sex,adoption_status)Values(49, 'Goofy', 7, 'Black', 'M', False);
insert into AniShell.Animal(pet_id, name, age, color, sex,adoption_status)Values(50, 'Einstein', 7, 'White', 'M', False);
insert into AniShell.Animal(pet_id, name, age, color, sex,adoption_status)Values(51, 'Scooby-Do', 7, 'Brown', 'M', False);
insert into AniShell.Animal(pet_id, name, age, color, sex,adoption_status)Values(52, 'Bolt', 4, 'White', 'M', True);
insert into AniShell.Animal(pet_id, name, age, color, sex,adoption_status)Values(53, 'Underdog', 4, 'White', 'M', True);
insert into AniShell.Animal(pet_id, name, age, color, sex,adoption_status)Values(54, 'Shadow', 8, 'Black',  'M', True);
insert into AniShell.Animal(pet_id, name, age, color, sex,adoption_status)Values(55, 'Old Yeller', 11, 'White', 'F', False);
insert into AniShell.Animal(pet_id, name, age, color, sex,adoption_status)Values(56, 'Spots', 5, 'White', 'F', False);
insert into AniShell.Animal(pet_id, name, age, color, sex,adoption_status)Values(57, 'Jake', 6, 'Gold', 'M', True);
insert into AniShell.Animal(pet_id, name, age, color, sex,adoption_status)Values(58, 'Lockjaw', 9, 'Brown', 'M', False);
insert into AniShell.Animal(pet_id, name, age, color, sex,adoption_status)Values(59, 'Pluto', 8, 'Brown', 'M', True);
insert into AniShell.Animal(pet_id, name, age, color, sex,adoption_status)Values(60, 'Noodle','Brown', 'M', True);


**BIRD**
insert into AniShell.Bird(pet_id, bird_species, handling)Values(16, 'Parakeet', 'Exotic');
insert into AniShell.Bird(pet_id, bird_species, handling)Values(17,  'Woodpecker', 'Tamed');
insert into AniShell.Bird(pet_id, bird_species, handling)Values(18, 'Mc Awk', 'Friendly');
insert into AniShell.Bird(pet_id, bird_species, handling)Values(19, 'Mc Awk', 'Wild');
insert into AniShell.Bird(pet_id, bird_species, handling)Values(20, 'Parrot', 'Trained');
insert into AniShell.Bird(pet_id, bird_species, handling)Values(21, 'Angry Bird', 'Angry');
insert into AniShell.Bird(pet_id, bird_species, handling)Values(22, 'Angry Bird', 'Angry');
insert into AniShell.Bird(pet_id, bird_species, handling)Values(23, 'British Falcon', 'British');
insert into AniShell.Bird(pet_id, bird_species, handling)Values(24, 'Robin', 'Sidekick');
insert into AniShell.Bird(pet_id, bird_species, handling)Values(25, 'Hawk', 'Avenger');
insert into AniShell.Bird(pet_id, bird_species, handling)Values(26, 'Phoenix', 'Legendary');
insert into AniShell.Bird(pet_id, bird_species, handling)Values(27, 'Duck', 'Loud');
insert into AniShell.Bird(pet_id, bird_species, handling)Values(28, 'Duck', 'Lazy');
insert into AniShell.Bird(pet_id, bird_species, handling)Values(29, 'Duck', 'House Trained');
insert into AniShell.Bird(pet_id, bird_species, handling)Values(30, 'Pigeon', 'Wild');

**DOG**
insert into AniShell.Dog(pet_id,  dog_breed, leash_trained)Values(46, 'Golden Retriever', True);
insert into AniShell.Dog(pet_id, dog_breed, leash_trained)Values(47, 'Giant', False);
insert into AniShell.Dog(pet_id, dog_breed, leash_trained)Values(48, 'Husky', False);
insert into AniShell.Dog(pet_id, dog_breed, leash_trained)Values(49, 'Border Collie', False);
insert into AniShell.Dog(pet_id, dog_breed, leash_trained)Values(50, 'English Sheepdog', True);
insert into AniShell.Dog(pet_id, dog_breed, leash_trained)Values(51,'Marmaduke', True);
insert into AniShell.Dog(pet_id, dog_breed, leash_trained)Values(52, 'Chihuahua', True);
insert into AniShell.Dog(pet_id, dog_breed, leash_trained)Values(53, 'Weiner dog', True);
insert into AniShell.Dog(pet_id, dog_breed, leash_trained)Values(54, 'Bulldog', False);
insert into AniShell.Dog(pet_id, dog_breed, leash_trained)Values(55, 'Bloodhound', True);
insert into AniShell.Dog(pet_id, dog_breed, leash_trained)Values(56, 'Dalmatian', False);
insert into AniShell.Dog(pet_id, dog_breed, leash_trained)Values(57, 'Unknown', True );
insert into AniShell.Dog(pet_id, dog_breed, leash_trained)Values(58, 'Bull dog', False);
insert into AniShell.Dog(pet_id, dog_breed, leash_trained)Values(59, 'Unknown', True );
insert into AniShell.Dog(pet_id, dog_breed, leash_trained)Values(60, 'Unknown', True );

**CAT**
insert into AniShell.Cat(pet_id, litter_trained, indoor_outdoor, Cat_breed)values(31,true, 'indoor', 'American Shorthair');
insert into AniShell.Cat(pet_id, litter_trained, indoor_outdoor, Cat_breed)values(32,true, 'indoor', 'Persian');
insert into AniShell.Cat(pet_id, litter_trained, indoor_outdoor, Cat_breed)values(33,true, 'indoor', 'American Shorthair');
insert into AniShell.Cat(pet_id, litter_trained, indoor_outdoor, Cat_breed)values(34,true, 'indoor', 'Persian');
insert into AniShell.Cat(pet_id, litter_trained, indoor_outdoor, Cat_breed)values(35,true, 'outdoor', 'Bengal');
insert into AniShell.Cat(pet_id, litter_trained, indoor_outdoor, Cat_breed)values(36,true, 'indoor', 'Persian');
insert into AniShell.Cat(pet_id, litter_trained, indoor_outdoor, Cat_breed)values(37,true, 'indoor', 'Rag Doll');
insert into AniShell.Cat(pet_id, litter_trained, indoor_outdoor, Cat_breed)values(38,true, 'indoor', 'Persian');
insert into AniShell.Cat(pet_id, litter_trained, indoor_outdoor, Cat_breed)values(39,true, 'indoor', 'American Shorthair');
insert into AniShell.Cat(pet_id, litter_trained, indoor_outdoor, Cat_breed)values(40,true, 'outdoor', 'Rag Doll');
insert into AniShell.Cat(pet_id, litter_trained, indoor_outdoor, Cat_breed)values(41,false, 'outdoor', 'American Shorthair');
insert into AniShell.Cat(pet_id, litter_trained, indoor_outdoor, Cat_breed)values(42,false, 'outdoor', 'American Shorthair');
insert into AniShell.Cat(pet_id, litter_trained, indoor_outdoor, Cat_breed)values(43,false, 'outdoor', 'American Shorthair');
insert into AniShell.Cat(pet_id, litter_trained, indoor_outdoor, Cat_breed)values(44,false, 'outdoor', 'American Shorthair');
insert into AniShell.Cat(pet_id, litter_trained, indoor_outdoor, Cat_breed)values(45,false, 'outdoor', 'American Shorthair');

**BUNNY**
insert into AniShell.Bunny(pet_id, bunny_breed)Values(1, 'Holland Lop');
insert into AniShell.Bunny(pet_id, bunny_breed)Values(2, 'Holland Lop');
insert into AniShell.Bunny(pet_id, bunny_breed)Values(3, 'Holland Lop');
insert into AniShell.Bunny(pet_id, bunny_breed)Values(4, 'Holland Lop');
insert into AniShell.Bunny(pet_id, bunny_breed)Values(5, 'Holland Lop');
insert into AniShell.Bunny(pet_id, bunny_breed)Values(6, 'Holland Lop');
insert into AniShell.Bunny(pet_id, bunny_breed)Values(7, 'Holland Lop');
insert into AniShell.Bunny(pet_id, bunny_breed)Values(8, 'Holland Lop');
insert into AniShell.Bunny(pet_id, bunny_breed)Values(9, 'Holland Lop');
insert into AniShell.Bunny(pet_id, bunny_breed)Values(10, 'Holland Lop');
insert into AniShell.Bunny(pet_id, bunny_breed)Values(11,'Holland Lop');
insert into AniShell.Bunny(pet_id, bunny_breed)Values(12, 'Holland Lop');
insert into AniShell.Bunny(pet_id, bunny_breed)Values(13, 'Dutch');
insert into AniShell.Bunny(pet_id, bunny_breed)Values(14, 'Dutch');
insert into AniShell.Bunny(pet_id, bunny_breed)Values(15, 'Dutch');

**USER**
insert into AniShell.User(user_id, status, User_name, contact_info)values('100', 'Adopter' , 'asdf', '456-123-4567');
insert into AniShell.User(user_id, status, User_name, contact_info)values('101','Adopter' ,'wert', '456-654-2345');
insert into AniShell.User(user_id, status, User_name, contact_info)values('102','Adopter' ,'fgh6','456-132-3456');
insert into AniShell.User(user_id, status, User_name, contact_info)values('103','Adopter' ,'hjk7','456-678-4567');
insert into AniShell.User(user_id, status, User_name, contact_info)values('104','Adopter' ,'wer4','456-345-5678');
insert into AniShell.User(user_id, status, User_name, contact_info)values('105','Adopter' ,'cvbn6','456-890-6789');
insert into AniShell.User(user_id, status, User_name, contact_info)values('106','Adopter' ,'ghj9','456-765-6799');
insert into AniShell.User(user_id, status, User_name, contact_info)values('107','Adopter' ,'asd0','456-876-6789');
insert into AniShell.User(user_id, status, User_name, contact_info)values('108','Surrender'  ,'xcv4','456-432-2356');
insert into AniShell.User(user_id, status, User_name, contact_info)values('109','Surrender','ghj6','456-654-4456');
insert into AniShell.User(user_id, status, User_name, contact_info)values('110','Surrender','asd5','456-890-2234');
insert into AniShell.User(user_id, status, User_name, contact_info)values('111','Surrender','hjk0','456-322-6676');
insert into AniShell.User(user_id, status, User_name, contact_info)values('112','Adopter','sdf6','456-222-7777');
insert into AniShell.User(user_id, status, User_name, contact_info)values('113','Surrender','qwe7','456-777-4453');
insert into AniShell.User(user_id, status, User_name, contact_info)values('114','Surrender','vbn9','456-555-9987');

**EMPLOYEE**
insert into AniShell.Employee(employee_id, shelter_id, name)Values(1, 1, 'Jon Snow');
insert into AniShell.Employee(employee_id, shelter_id, name)Values(2, 2, 'Peter Parker');
insert into AniShell.Employee(employee_id, shelter_id, name)Values(3, 3, 'Sora');
insert into AniShell.Employee(employee_id, shelter_id, name)Values(4, 4, 'Mario');
insert into AniShell.Employee(employee_id, shelter_id, name)Values(5, 5, 'Marty McFly');
insert into AniShell.Employee(employee_id, shelter_id, name)Values(6, 6, 'Chris Evans');
insert into AniShell.Employee(employee_id, shelter_id, name)Values(7, 7, 'Bruce Wayne');
insert into AniShell.Employee(employee_id, shelter_id, name)Values(8, 8, 'Dick Grayson');
insert into AniShell.Employee(employee_id, shelter_id, name)Values(9, 9, 'Luke SkyWalker');
insert into AniShell.Employee(employee_id, shelter_id, name)Values(10, 10, 'Tom Holland');
insert into AniShell.Employee(employee_id, shelter_id, name)Values(11, 11, 'Scarlet Johansen');
insert into AniShell.Employee(employee_id, shelter_id, name)Values(12, 12, 'Diana');
insert into AniShell.Employee(employee_id, shelter_id, name)Values(13,13, 'Harry Potter');
insert into AniShell.Employee(employee_id, shelter_id, name)Values(14, 14, 'Jill');
insert into AniShell.Employee(employee_id, shelter_id, name)Values(15, 15, 'Dante');

**SHELTER**
insert into AniShell.Shelter(shelter_id, name, address, phone_number)VALUES('001', 'Animal Adoption Center', '643 North Peachtree Lane' , '408-123-4567');
insert into AniShell.Shelter(shelter_id, name, address, phone_number)VALUES('002', 'Animal Haven' , '278 West Galvin St.', '756-123-9786');
insert into AniShell.Shelter(shelter_id, name, address, phone_number)VALUES('003', 'Animal Rescue Centre', '27 Lake Forest Street', '408-321-4567');
insert into AniShell.Shelter(shelter_id, name, address, phone_number)VALUES('004', 'Animal Kindness', '26 Valley Farms Dr.','408-231-4567');
insert into AniShell.Shelter(shelter_id, name, address, phone_number)VALUES('005', 'Pittie Love Rescue', '266 Lilac St.','408-123-7654');
insert into AniShell.Shelter(shelter_id, name, address, phone_number)VALUES('006', 'Homeless Kitty Network', '9010 2nd Rd.','408-123-5647');
insert into AniShell.Shelter(shelter_id, name, address, phone_number)VALUES('007', 'A Birdy Life', '9 Ivy Dr.','408-123-5564');
insert into AniShell.Shelter(shelter_id, name, address, phone_number)VALUES('008', 'Tree House Animal Rescue', '8586 Homewood Street','408-123-6654');
insert into AniShell.Shelter(shelter_id, name, address, phone_number)VALUES('009', 'Feline Rescue Society', '7659 NW. Heritage St.','408-123-4647');
insert into AniShell.Shelter(shelter_id, name, address, phone_number)VALUES('01a', 'Loved Pet Shelter', '551 High Road','408-123-4567');
insert into AniShell.Shelter(shelter_id, name, address, phone_number)VALUES('02a', 'Furever Home', '7711 North Schoolhouse Street','408-123-35754');
insert into AniShell.Shelter(shelter_id, name, address, phone_number)VALUES('03a', 'Whiskers Animal Shelter', '50 53rd Drive','408-123-1464');
insert into AniShell.Shelter(shelter_id, name, address, phone_number)VALUES('04a', 'Small Paws and Feathers', '9135 Lake Forest St.','408-123-0076');
insert into AniShell.Shelter(shelter_id, name, address, phone_number)VALUES('05a', 'Pet Refuge Center', '7105 East Bay St.','408-123-4673');
insert into AniShell.Shelter(shelter_id, name, address, phone_number)VALUES('06a', 'Cuteness Center', '592 East Gulf Drive','408-123-1485');

**ADOPT SURRENDER**
insert into Adopt_Surrender(user_id, animal_id, status)Values(101, 3, 'adopt');
insert into Adopt_Surrender(user_id, animal_id, status)Values(103, 5, 'adopt');
insert into Adopt_Surrender(user_id, animal_id, status)Values(103, 6, 'adopt');
insert into Adopt_Surrender(user_id, animal_id, status)Values(110, 4, 'adopt');
insert into Adopt_Surrender(user_id, animal_id, status)Values(107, 1, 'adopt');
insert into Adopt_Surrender(user_id, animal_id, status)Values(108, 45, 'adopt');
insert into Adopt_Surrender(user_id, animal_id, status)Values(110, 54, 'adopt');
insert into Adopt_Surrender(user_id, animal_id, status)Values(106, 30, 'adopt');
insert into Adopt_Surrender(user_id, animal_id, status)Values(109, 29, 'adopt');
insert into Adopt_Surrender(user_id, animal_id, status)Values(113, 20, 'adopt');
insert into Adopt_Surrender(user_id, animal_id, status)Values(114, 16, 'adopt');
insert into Adopt_Surrender(user_id, animal_id, status)Values(111, 47, 'adopt');
insert into Adopt_Surrender(user_id, animal_id, status)Values(112,23, 'surrender');
insert into Adopt_Surrender(user_id, animal_id, status)Values(112, 15, 'surrender');
insert into Adopt_Surrender(user_id, animal_id, status)Values(107, 38, 'surrender');

**CONTACTS**
insert into Contacts(shelter_id, user_id, date, time)Values('001', 103, '2021-12-03' , '14:30:00');
insert into Contacts(shelter_id, user_id, date, time)Values('001', 105, '2021-12-28' , '14:30:00');
insert into Contacts(shelter_id, user_id, date, time)Values('002', 110, '2021-12-21' , '14:30:00');
insert into Contacts(shelter_id, user_id, date, time)Values('003', 104, '2021-11-28' , '15:30:00');
insert into Contacts(shelter_id, user_id, date, time)Values('006', 101, '2021-12-21' , '15:30:00');
insert into Contacts(shelter_id, user_id, date, time)Values('008', 106, '2021-12-05' , '15:30:00');
insert into Contacts(shelter_id, user_id, date, time)Values('008', 110, '2022-01-05' , '16:30:00');
insert into Contacts(shelter_id, user_id, date, time)Values('009', 102, '2022-01-06' , '16:30:00');
insert into Contacts(shelter_id, user_id, date, time)Values('01a', 108, '2022-01-05' , '16:30:00');
insert into Contacts(shelter_id, user_id, date, time)Values('02a', 109, '2022-01-06' , '16:30:00');
insert into Contacts(shelter_id, user_id, date, time)Values('01a', 107, '2022-01-02' , '17:30:00');
insert into Contacts(shelter_id, user_id, date, time)Values('04a', 114, '2022-02-14' , '17:30:00');
insert into Contacts(shelter_id, user_id, date, time)Values('06a', 114, '2022-02-05' , '17:30:00');
insert into Contacts(shelter_id, user_id, date, time)Values('03a', 111, '2022-02-05' , '17:30:00');
insert into Contacts(shelter_id, user_id, date, time)Values('06a', 113, '2022-02-05' ,'11:30:00');

