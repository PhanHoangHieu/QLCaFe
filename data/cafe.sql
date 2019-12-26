CREATE DATABASE QuanLyQuanCafe
go
USE QuanLyQuanCafe
go
--	Food
--	Table
--	FoodCategory
--	Account
--	Bill
--	BillInfo

Create table TableFood
(
	id int identity primary key,
	name nvarchar(100) not null default N'Bàn Chưa có tên',
	status nvarchar(100) not null default N'Trống' --Trống  || Có người--
)
go

Create table Account(
    UserName varchar(100) primary key,
	DisplayName varchar(50) not null default N'HieuPeo',
	PassWord nvarchar(200) not null default 0,
	Type int not null default 0 --1 là admin || 0 là staff --
)
go

Create table FoodCategory(
	id int identity primary key,
	name nvarchar(100) not null default N'Chưa đặt tên'
)
go

Create table Food(
	id int identity primary key,
	name nvarchar(100) default N'Chưa đặt tên',
	idCategory int not null ,
	price float not null default 0
	foreign key (idCategory) references FoodCategory(id)
)
go

create table Bill(
	id int identity primary key,
	DateCheckIn date not null default getdate(),
	DateCheckOut date,
	idTable int not null,
	status int default  0 --1 là đã thanh toán || 0 là chưa thanh toán--
	foreign key (idTable) references TableFood(id)

)
go

create table BillInfo(
	id int identity primary key,
	idBill int not null,
	idFood int not null,
	count int not null default 0,
	foreign key (idBill) references Bill(id),
	foreign key (idFood) references Food(id)

)
go