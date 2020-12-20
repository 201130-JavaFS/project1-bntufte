drop schema if exists ers cascade;

create schema ers;

create table ers.reimbursement_status(
	 reimb_status_id SERIAL primary key,
	 reimb_status VARCHAR(10) not null unique
);

create table ers.reimbursement_type(
	 reimb_type_id SERIAL primary key,
	 reimb_type VARCHAR(10) not null unique
);

create table ers.user_roles(
	user_role_id SERIAL primary key,
	user_role VARCHAR(10) not null unique
);

create table ers.users(
	ers_users_id SERIAL primary key,
	ers_username VARCHAR(50) not null unique,
	ers_password VARCHAR(50) not null,
	user_first_name VARCHAR(100) not null,
	user_last_name VARCHAR(100) not null,
	user_email VARCHAR(150) not null,
	user_role_id INTEGER references ers.user_roles(user_role_id)
);

create table ers.reimbursement(
	reimb_id SERIAL primary key,
	reimb_amount NUMERIC(6,2) check (reimb_amount > 0) not null,
	reimb_submitted DATE not null,
	reimb_resolved DATE,
	reimb_description VARCHAR(250),
	reimb_receipt BYTEA,
	reimb_author INTEGER references ers.users(ers_users_id) not null,
	reimb_resolver INTEGER references ers.users(ers_users_id),
	reimb_status_id INTEGER references ers.reimbursement_status(reimb_status_id) not null,
	reimb_type_id INTEGER references ers.reimbursement_type(reimb_type_id) not null
);

insert into ers.reimbursement_status (reimb_status) values ('PENDING');
insert into ers.reimbursement_status (reimb_status) values ('APPROVED');
insert into ers.reimbursement_status (reimb_status) values ('DENIED');

insert into ers.reimbursement_type (reimb_type) values ('LODGING');
insert into ers.reimbursement_type (reimb_type) values ('TRAVEL');
insert into ers.reimbursement_type (reimb_type) values ('FOOD');
insert into ers.reimbursement_type (reimb_type) values ('OTHER');

insert into ers.user_roles (user_role) values ('FINANCE M');
insert into ers.user_roles (user_role) values ('EMPLOYEE');

insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('bntufte', 'password', 'Brandon', 'Tufte', 'btufte@economist.com', 1);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('mbernardet1', 'Nn2UdRKfCYn', 'Moyna', 'Bernardet', 'mbernardet1@google.it', 1);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('tosirin2', 'o7FOs2tZyi6I', 'Terrance', 'O''Sirin', 'tosirin2@intel.com', 1);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('salbion3', 'TVUhEuU5lJz', 'Sibylla', 'Albion', 'salbion3@webnode.com', 1);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('farp4', 'oJsN3CJsU', 'Fidelia', 'Arp', 'farp4@vkontakte.ru', 1);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('aftufte', 'password', 'Astrid', 'Tufte', 'atufte@opera.com', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('hruzicka6', 'KkwxuzN2r', 'Hillier', 'Ruzicka', 'hruzicka6@example.com', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('wflew7', 'HHU0VTqt', 'Washington', 'Flew', 'wflew7@house.gov', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('cminot8', 'Q9BkbPyDCm', 'Codi', 'Minot', 'cminot8@msn.com', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('sabbet9', 'pIgRwI', 'Sonnie', 'Abbet', 'sabbet9@123-reg.co.uk', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('lstapforda', 'qaTKH5E', 'Lindy', 'Stapford', 'lstapforda@rakuten.co.jp', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('ccornwellb', 'KoDmY10OQ', 'Cort', 'Cornwell', 'ccornwellb@oaic.gov.au', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('cbignallc', 'b6jJtEzoz', 'Christine', 'Bignall', 'cbignallc@trellian.com', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('pmouled', 'L5dQvL3V94sp', 'Phillipp', 'Moule', 'pmouled@drupal.org', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('pchesee', 'Wm3KTwPCBH', 'Parsifal', 'Chese', 'pchesee@state.tx.us', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('ckingdomf', 'VC9MmoiFjX', 'Clemente', 'Kingdom', 'ckingdomf@furl.net', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('charling', 'DTpz0FRs', 'Cyrille', 'Harlin', 'charling@hostgator.com', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('ispridgeonh', 'VudM82w', 'Ingamar', 'Spridgeon', 'ispridgeonh@virginia.edu', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('jhiscokei', 'VUrPcXhSyc', 'Janna', 'Hiscoke', 'jhiscokei@yolasite.com', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('wwhyliej', 'QPCPQuIDh5', 'Wandis', 'Whylie', 'wwhyliej@ucla.edu', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('acampionek', '5kPGH05J', 'Adelaida', 'Campione', 'acampionek@joomla.org', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('dterbeckl', 'p35TiOaTbnh', 'Damita', 'Terbeck', 'dterbeckl@instagram.com', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('nbernardellim', 'WfIT3f1vAB', 'Nanine', 'Bernardelli', 'nbernardellim@yelp.com', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('vnicholn', '191UOv', 'Veradis', 'Nichol', 'vnicholn@walmart.com', 2);
insert into ers.users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id) values ('rmoulino', '8wkbIccgL8', 'Roddy', 'Moulin', 'rmoulino@sfgate.com', 2);

insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (187.54, '03/04/2019', '03/28/2020', 'Baby', null, 23, 4, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (42.07, '02/01/2019', '06/18/2020', 'Tools', null, 12, 1, 1, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (84.65, '09/15/2019', '05/21/2020', 'Music', null, 6, 2, 3, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (140.9, '10/25/2019', '03/25/2020', 'Sports', null, 15, 3, 1, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (126.11, '11/07/2019', '07/07/2020', 'Sports', null, 22, 2, 2, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (187.66, '06/10/2019', '01/09/2020', 'Games', null, 16, 5, 1, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (96.96, '01/05/2019', '01/19/2020', 'Baby', null, 5, 5, 1, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (92.11, '10/04/2019', '03/08/2020', 'Kids', null, 8, 2, 1, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (167.61, '05/11/2019', '01/19/2020', 'Clothing', null, 4, 4, 3, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (224.05, '10/16/2019', '10/15/2020', 'Baby', null, 22, 4, 1, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (140.86, '06/08/2019', '02/06/2020', 'Industrial', null, 4, 4, 1, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (122.08, '05/03/2019', '10/21/2020', 'Shoes', null, 10, 4, 3, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (55.41, '08/24/2019', '04/24/2020', 'Automotive', null, 18, 5, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (187.97, '05/02/2019', '03/25/2020', 'Toys', null, 6, 5, 1, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (48.15, '11/06/2019', '12/06/2020', 'Garden', null, 24, 1, 3, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (41.7, '02/15/2019', '11/22/2020', 'Grocery', null, 15, 1, 3, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (100.27, '08/24/2019', '10/28/2020', 'Grocery', null, 21, 5, 3, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (27.21, '09/08/2019', '02/16/2020', 'Music', null, 22, 1, 2, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (222.09, '03/11/2019', '12/12/2020', 'Health', null, 8, 1, 3, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (90.33, '05/01/2019', '01/12/2020', 'Computers', null, 12, 2, 3, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (100.83, '03/25/2019', '05/04/2020', 'Movies', null, 6, 4, 3, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (282.42, '07/24/2019', '12/15/2019', 'Movies', null, 1, 4, 2, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (72.56, '06/12/2019', '09/10/2020', 'Outdoors', null, 3, 4, 1, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (76.29, '03/15/2019', '10/31/2020', 'Jewelery', null, 14, 4, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (49.51, '09/07/2019', '04/09/2020', 'Jewelery', null, 5, 2, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (196.09, '05/15/2019', '08/19/2020', 'Industrial', null, 1, 4, 1, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (299.18, '06/23/2019', '03/11/2020', 'Toys', null, 19, 1, 2, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (150.58, '06/02/2019', '11/27/2020', 'Toys', null, 19, 5, 1, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (185.37, '01/14/2019', '05/29/2020', 'Toys', null, 18, 4, 2, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (245.18, '07/26/2019', '06/19/2020', 'Toys', null, 20, 5, 3, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (143.77, '06/24/2019', '01/14/2020', 'Beauty', null, 21, 4, 3, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (97.89, '08/29/2019', '09/29/2020', 'Beauty', null, 3, 2, 3, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (150.04, '05/05/2019', '01/13/2020', 'Industrial', null, 10, 3, 1, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (173.59, '04/02/2019', '12/14/2019', 'Grocery', null, 4, 3, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (154.81, '08/18/2019', '02/19/2020', 'Tools', null, 14, 1, 2, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (168.62, '04/22/2019', '03/03/2020', 'Games', null, 2, 1, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (213.69, '06/02/2019', '12/05/2020', 'Baby', null, 3, 3, 1, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (165.48, '12/29/2018', '03/11/2020', 'Movies', null, 20, 2, 3, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (229.85, '11/05/2019', '07/11/2020', 'Garden', null, 5, 3, 3, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (209.76, '09/30/2019', '09/24/2020', 'Computers', null, 2, 3, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (282.31, '05/10/2019', '09/09/2020', 'Industrial', null, 2, 2, 2, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (72.64, '08/30/2019', '02/11/2020', 'Home', null, 9, 5, 3, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (70.02, '11/15/2019', '11/13/2020', 'Books', null, 19, 2, 1, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (174.5, '09/16/2019', '09/12/2020', 'Electronics', null, 3, 2, 1, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (186.42, '10/24/2019', '01/16/2020', 'Computers', null, 11, 3, 1, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (269.26, '01/07/2019', '01/27/2020', 'Books', null, 5, 1, 3, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (71.86, '08/18/2019', '11/08/2020', 'Sports', null, 15, 5, 2, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (116.54, '10/11/2019', '03/11/2020', 'Tools', null, 6, 4, 2, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (152.71, '01/13/2019', '05/09/2020', 'Home', null, 1, 4, 2, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (52.73, '10/10/2019', '03/11/2020', 'Jewelery', null, 5, 2, 2, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (211.72, '07/02/2019', '01/17/2020', 'Industrial', null, 25, 3, 1, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (220.55, '06/16/2019', '03/04/2020', 'Automotive', null, 18, 2, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (286.12, '05/31/2019', '01/20/2020', 'Garden', null, 8, 1, 3, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (200.9, '02/23/2019', '05/09/2020', 'Sports', null, 11, 2, 1, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (66.25, '10/07/2019', '06/04/2020', 'Automotive', null, 17, 3, 2, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (126.5, '01/21/2019', '10/02/2020', 'Clothing', null, 19, 1, 1, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (100.81, '07/17/2019', '07/13/2020', 'Grocery', null, 6, 3, 1, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (35.18, '03/08/2019', '11/07/2020', 'Books', null, 11, 5, 2, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (95.58, '10/01/2019', '01/23/2020', 'Home', null, 19, 5, 1, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (120.61, '03/03/2019', '12/22/2019', 'Garden', null, 5, 4, 3, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (281.31, '12/02/2019', '04/30/2020', 'Home', null, 21, 2, 2, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (178.84, '01/15/2019', '09/19/2020', 'Books', null, 3, 1, 1, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (183.32, '01/17/2019', '09/21/2020', 'Books', null, 20, 2, 1, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (183.24, '06/15/2019', '08/20/2020', 'Clothing', null, 20, 1, 1, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (192.25, '05/20/2019', '08/30/2020', 'Clothing', null, 19, 2, 2, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (87.22, '01/14/2019', '05/06/2020', 'Movies', null, 20, 4, 3, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (31.77, '11/26/2019', '07/05/2020', 'Games', null, 21, 1, 1, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (201.46, '09/07/2019', '03/17/2020', 'Books', null, 12, 2, 2, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (113.32, '07/16/2019', '01/16/2020', 'Jewelery', null, 19, 1, 2, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (228.07, '04/12/2019', '09/06/2020', 'Industrial', null, 17, 1, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (192.89, '11/16/2019', '08/19/2020', 'Music', null, 4, 4, 3, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (141.9, '08/07/2019', '09/08/2020', 'Garden', null, 3, 5, 2, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (119.96, '01/19/2019', '11/25/2020', 'Games', null, 17, 4, 1, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (233.39, '01/20/2019', '08/08/2020', 'Outdoors', null, 8, 4, 2, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (71.52, '01/19/2019', '01/05/2020', 'Kids', null, 9, 1, 2, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (263.65, '09/13/2019', '10/08/2020', 'Health', null, 1, 1, 1, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (251.0, '10/30/2019', '01/28/2020', 'Outdoors', null, 11, 1, 3, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (225.27, '05/25/2019', '03/05/2020', 'Toys', null, 3, 2, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (94.71, '06/28/2019', '11/08/2020', 'Books', null, 4, 4, 3, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (202.45, '04/27/2019', '01/03/2020', 'Books', null, 15, 2, 1, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (220.0, '05/28/2019', '05/25/2020', 'Outdoors', null, 22, 3, 2, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (148.57, '06/08/2019', '08/07/2020', 'Games', null, 22, 1, 3, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (280.85, '04/06/2019', '09/02/2020', 'Movies', null, 16, 4, 1, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (156.96, '09/23/2019', '03/13/2020', 'Tools', null, 17, 2, 3, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (186.32, '11/08/2019', '01/03/2020', 'Movies', null, 22, 3, 3, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (232.1, '05/23/2019', '07/05/2020', 'Health', null, 16, 2, 1, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (108.29, '12/07/2019', '07/29/2020', 'Tools', null, 1, 4, 2, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (91.0, '04/15/2019', '09/16/2020', 'Kids', null, 9, 1, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (39.31, '09/27/2019', '11/17/2020', 'Music', null, 6, 3, 3, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (39.83, '08/23/2019', '01/18/2020', 'Beauty', null, 17, 5, 1, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (272.17, '12/27/2018', '04/14/2020', 'Kids', null, 18, 3, 1, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (138.89, '12/18/2018', '11/16/2020', 'Beauty', null, 12, 5, 1, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (146.33, '04/03/2019', '01/20/2020', 'Games', null, 22, 4, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (59.58, '09/02/2019', '11/11/2020', 'Kids', null, 24, 5, 3, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (178.57, '10/03/2019', '10/28/2020', 'Toys', null, 6, 4, 1, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (185.64, '03/28/2019', '07/03/2020', 'Garden', null, 3, 1, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (165.19, '03/02/2019', '06/15/2020', 'Tools', null, 2, 5, 2, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (166.17, '09/14/2019', '04/27/2020', 'Music', null, 4, 3, 2, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (34.16, '01/03/2019', '03/21/2020', 'Outdoors', null, 12, 3, 2, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (218.58, '05/17/2019', '02/11/2020', 'Books', null, 3, 1, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (60.71, '09/24/2019', '03/05/2020', 'Beauty', null, 3, 2, 2, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (220.5, '09/27/2019', '03/27/2020', 'Shoes', null, 25, 3, 1, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (286.5, '01/13/2019', '07/20/2020', 'Books', null, 3, 5, 1, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (85.37, '07/04/2019', '07/22/2020', 'Baby', null, 19, 4, 3, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (245.33, '05/16/2019', '12/17/2019', 'Electronics', null, 24, 3, 2, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (293.79, '02/18/2019', '01/02/2020', 'Outdoors', null, 18, 5, 2, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (158.96, '01/20/2019', '06/04/2020', 'Clothing', null, 24, 5, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (108.57, '02/19/2019', '11/14/2020', 'Movies', null, 10, 2, 2, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (217.89, '04/19/2019', '08/04/2020', 'Electronics', null, 20, 3, 1, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (151.37, '03/13/2019', '06/29/2020', 'Home', null, 13, 1, 1, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (222.75, '07/30/2019', '12/11/2020', 'Clothing', null, 21, 4, 1, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (178.5, '11/17/2019', '01/08/2020', 'Clothing', null, 7, 1, 2, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (134.46, '07/11/2019', '05/15/2020', 'Health', null, 5, 2, 1, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (101.55, '09/19/2019', '04/29/2020', 'Computers', null, 2, 2, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (239.08, '04/04/2019', '09/20/2020', 'Jewelery', null, 19, 1, 1, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (110.13, '09/07/2019', '01/21/2020', 'Industrial', null, 17, 4, 1, 1);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (122.12, '08/20/2019', '05/17/2020', 'Garden', null, 2, 3, 3, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (164.22, '04/17/2019', '03/25/2020', 'Health', null, 11, 4, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (127.13, '01/05/2019', '03/25/2020', 'Computers', null, 6, 2, 2, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (270.66, '03/01/2019', '01/26/2020', 'Tools', null, 6, 2, 2, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (279.5, '11/25/2019', '11/15/2020', 'Baby', null, 24, 1, 3, 3);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (31.05, '02/03/2019', '11/04/2020', 'Music', null, 12, 2, 3, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (217.57, '03/03/2019', '03/29/2020', 'Beauty', null, 17, 1, 3, 4);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (233.96, '03/26/2019', '03/18/2020', 'Grocery', null, 13, 1, 1, 2);
insert into ers.reimbursement (reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) values (143.46, '07/23/2019', '10/04/2020', 'Baby', null, 20, 5, 3, 4);
