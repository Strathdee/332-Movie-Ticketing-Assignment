Complex(
	name varchar(50) not null, 
	streetNum integer, 
	streetName varchar(50),
	city varchar(50),
	province varchar(50),
	postalCode char(6),
	numTheatres integer,
	primary key(name)
)

Theatre(
	complexName varchar(50) not null,
	theatreNum integer not null,
	maxSeats integer,
	screenSize varchar(6),
	foreign key (complexName) references (Complex),
	primary key (complexName, theatreNum)
)

Movie(
	title varchar(100) not null,
	runningTime integer,
	rating varchar(4)
	synopsis varchar(500),
	director varchar(100),
	prodComp varchar(100),
	supplierName varchar(100),
	startDate date,
	endDate date,
	foreign key (supplierName) references (Supplier),
	primary key (title),
)

Actor(
	fName varchar(50) not null,
	lName varchar(50) not null,
	starsIn varchar(100) not null,
	foreign key (starsIn) references (Movie),
	primary key (fName,lName, starsIn)
)

Account(
	accountNum integer not null,
	password varchar(50) not null,
	fName varchar(50),
	lName varchar(50),
	phone char(10),
	email varchar(50),
	creditCard varchar(15),
	cardExpiry date,
	primary key (accountNum)
)

Showing(
	complexName varchar(50) not null,
	theatreNum integer not null,
	movieTitle varchar not null,
	startTime time not null,
	seatsAvailable integer,
	foreign key (complexName) references (Theatre),
	foreign key (theatreNum) references (Theatre),
	foreign key (movieTitle) references (Movie),
	primary key (complexName, theatreNum, movieTitle, startTime)
)

Supplier(
	compName varchar(50) not null,
	streetName varchar(50),
	streetNum varchar(50),
	city varchar(50),
	province varchar(50),
	postalCode char(6),
	phone char(10),
	contactFName varchar(10),
	contactLName varchar(10),
	primary key (compName)
)

Review(
	ID integer not null,
	score integer,
	primary key (ID)
)

Reserved(
	accountNum integer not null,
	complexName varchar(50) not null,
	theatreNum integer not null,
	movieTitle varchar(50) not null,
	startTime time not null,
	ticketsNum integer,
	foreign key (accountNum) references (Account),
	foreign key (complexName) references (Showing),
	foreign key (theatreNum) references (Showing),
	foreign key (movieTitle) references (Showing),
	foreign key (startTime) references (Showing),
	primary key (accountNum, complexName, theatreNum, movieTitle, startTime)
)
