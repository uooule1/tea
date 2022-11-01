create database if not exists tea;

create table if not exists member(
	m_id varchar(10) not null,
	m_passwd varchar(30) not null,
	m_name varchar(30) not null,
	m_birth varchar(10),
	m_zipcode char(5),
	m_addr1 varchar(30),
	m_addr2 varchar(20),
	m_email varchar(30),
	m_tel char(13),
	m_createdate date,
	primary key(m_id)
);

create table if not exists notice(
	n_num int not null auto_increment,
	n_passwd varchar(10) not null,
	n_title varchar(20) not null,
	n_contents text not null,
	n_image varchar(20),
	n_readnum int,
	n_createdate date not null,
	primary key(n_num)
);

create table if not exists board(
	b_num int not null auto_increment,
	m_id varchar(10) not null,
	b_password varchar(10) not null,
	b_date date not null,
	b_title varchar(20) not null,
	b_contents text,
	b_star double,
	b_image varchar(20),
	b_readnum int,
	p_code varchar(10) not null ,
	primary key(b_num),
	foreign key(m_id) references member(m_id),
	foreign key(p_code) references product(p_code)
);
create table if not exists product(
	p_code varchar(10) not null ,
	p_name varchar(20) not null unique,
	p_price int not null,
	p_createdate date not null, 
	p_editdate date,
	p_info text not null,
	p_image varchar(20) not null,
	p_stock int not null,
	p_category varchar(10) not null,
	p_brand varchar(20) not null,
	p_state varchar(10),
	p_rate int,
	p_star double,
	primary key(p_code)
);

create table if not exists cart(
	c_num int not null auto_increment,
	c_quantity int not null,
	m_id varchar(10) not null,
	p_code varchar(10) not null,
	primary key(c_num),
	foreign key(m_id) references member(m_id),
	foreign key(p_code) references product(p_code)
);

create table orders(
	o_ordernum int auto_increment not null,
	o_name varchar(30) not null,
	o_email varchar(30),
	o_tel varchar(15),
	o_recivername varchar(30) not null,
	o_recivertel varchar(15),
	o_zipcode char(5) not null,
	o_addr1 varchar(30) not null,
	o_addr2 varchar(20) not null,
	o_option varchar(30) not null,
	o_bank varchar(20) not null,
	o_accountname varchar(30) not null,
	o_orderdate date,
	o_cancelstate char(1),
	o_canceldate date,
	m_id varchar(10) not null,
	PRIMARY KEY(o_ordernum),
	FOREIGN KEY (m_id) REFERENCES member(m_id)
);
create table orderItem(
	o_itemnum int auto_increment not null,
	o_quantity  int not null,
	o_ordernum int not null,
	p_code varchar(10) not null,
	PRIMARY KEY(o_itemnum),
	FOREIGN KEY (o_ordernum) REFERENCES orders(o_ordernum),
	foreign key(p_code) references product(p_code)
);