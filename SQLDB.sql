create table Account(
	[username] varchar(100) primary key,
	[password] nvarchar(100) not null,
	account_type tinyint not null /* 0 = admin, 1 = author, 2 = guest*/
)

create table Book_Info(
	book_id int identity(1, 1) Primary key,
	book_name nvarchar(max) not null,
	author_username varchar(100) not null foreign key references Account([username]),
	book_type nvarchar(max),
	review nvarchar(max),
	img image,
	[status] tinyint default 0 /* 0 = normal, 1 = reported, 2 = banned*/
)

create table Book_Content(
	book_id int foreign key references Book_Info(book_id),
	chapter_id int not null,
	chapter_name nvarchar(max),
	chapter_content nvarchar(max)
	primary key (book_id, chapter_id)
)

create table User_Library(
	[username] varchar(100) foreign key references Account([username]),
	book_id int foreign key references Book_Info(book_id),
	primary key (username, book_id)
)