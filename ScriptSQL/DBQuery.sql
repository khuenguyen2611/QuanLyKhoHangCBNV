create database QuanLyKhoHang
go

use QuanLyKhoHang
go

create table Measure
(
	Id int identity(1,1) primary key,
	DisplayName varchar(max)
)
go

create table Supplier
(
	Id int identity(1,1) primary key,
	DisplayName varchar(max),
	Address varchar(max),
	Phone varchar(20),
	Email varchar(20),
	MoreInfo varchar(max),
	ContractDate DateTime
)
go

create table Customer
(
	Id int identity(1,1) primary key,
	DisplayName varchar(max),
	Address varchar(max),
	Phone varchar(20),
	Email varchar(20),
	MoreInfo varchar(max),
	ContractDate DateTime
)
go

create table Supply
(
	Id varchar(128) primary key,
	DisplayName varchar(max),
	IdMeasure int not null,
	IdSupplier int not null,
	QRCode varchar(max),
	BarCode varchar(max)

	foreign key(IdMeasure) references Measure(Id),
	foreign key(IdSupplier) references Supplier(Id)
)
go

create table UserRole
(
	Id int identity(1,1) primary key,
	DisplayName varchar(max)
)
go

create table Users
(
	Id int identity(1,1) primary key,
	DisplayName varchar(max),
	UserName varchar(50),
	Password varchar(max),
	IdRole int not null

	foreign key (IdRole) references UserRole(Id)
)
go

create table Import
(
	Id varchar(128) primary key,
	DateImport DateTime
)
go

create table ImportInfo
(
	Id varchar(128) primary key,
	IdSupply varchar(128) not null,
	IdImport varchar(128) not null,
	Quantity int,
	ImportPrice float default 0,
	ExportPrice float default 0,
	Status varchar(max)

	foreign key(IdSupply) references Supply(Id),
	foreign key(IdImport) references Import(Id)
)
go

create table Export
(
	Id varchar(128) primary key,
	DateExport DateTime
)
go

create table ExportInfo
(
	Id varchar(128) primary key,
	IdSupply varchar(128) not null,
	IdImportInfo varchar(128) not null,
	IdCustomer int not null,
	Quantity int,
	Status varchar(max)

	foreign key (IdSupply) references Supply(Id),
	foreign key (IdImportInfo) references ImportInfo(Id),
	foreign key (IdCustomer) references Customer(Id)
)
go

