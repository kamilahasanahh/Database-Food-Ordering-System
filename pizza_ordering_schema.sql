CREATE TABLE customer (
	customer_id INTEGER NOT NULL, 
	name VARCHAR(100), 
	gender VARCHAR(10), 
	birthdate DATE, 
	phone_no VARCHAR(20), 
	address VARCHAR(255), 
	postal_code VARCHAR(10), 
	password VARCHAR(100), 
	pizzas_ordered INTEGER, 
	last_order_date DATE, 
	PRIMARY KEY (customer_id)
);

CREATE TABLE delivery_area (
	area_id INTEGER NOT NULL, 
	postal_code VARCHAR(10), 
	PRIMARY KEY (area_id)
);

CREATE TABLE delivery_person (
	delivery_person_id INTEGER NOT NULL, 
	name VARCHAR(100), 
	phone_no VARCHAR(20), 
	available_after DATETIME, 
	PRIMARY KEY (delivery_person_id)
);

CREATE TABLE discount_code (
	code VARCHAR(20) NOT NULL, 
	discount_amount DECIMAL(10, 2), 
	is_used BOOLEAN, 
	expiry_date DATE, 
	PRIMARY KEY (code)
);

CREATE TABLE ingredient (
	ingredient_id INTEGER NOT NULL, 
	name VARCHAR(100), 
	cost DECIMAL(5, 2), 
	is_vegetarian TINYINT, 
	is_vegan TINYINT, 
	PRIMARY KEY (ingredient_id)
);

CREATE TABLE ingredients (
	id INTEGER NOT NULL, 
	name VARCHAR(100) NOT NULL, 
	cost FLOAT, 
	is_vegetarian BOOLEAN, 
	is_vegan BOOLEAN, 
	PRIMARY KEY (id)
);

CREATE TABLE menu_item (
	menu_item_id INTEGER NOT NULL, 
	name VARCHAR(100), 
	type VARCHAR(7), 
	base_price FLOAT, 
	is_vegetarian BOOLEAN, 
	is_vegan BOOLEAN, 
	spiciness INTEGER, 
	PRIMARY KEY (menu_item_id)
);

CREATE TABLE staff (
	staff_id INTEGER NOT NULL, 
	name VARCHAR(100), 
	username VARCHAR(50) NOT NULL, 
	password VARCHAR(100) NOT NULL, 
	role VARCHAR(50), 
	PRIMARY KEY (staff_id)
);

CREATE TABLE delivery_assignment (
	delivery_person_id INTEGER NOT NULL, 
	area_id INTEGER NOT NULL, 
	PRIMARY KEY (delivery_person_id, area_id), 
	FOREIGN KEY(delivery_person_id) REFERENCES delivery_person (delivery_person_id), 
	FOREIGN KEY(area_id) REFERENCES delivery_area (area_id)
);

CREATE TABLE "order" (
	order_id INTEGER NOT NULL, 
	customer_id INTEGER, 
	order_date DATETIME, 
	status VARCHAR(16), 
	total_price DECIMAL(10, 2), 
	discount_applied DECIMAL(10, 2), 
	estimated_delivery_time DATETIME, 
	delivery_person_id INTEGER, 
	is_birthday_order BOOLEAN, 
	has_pizza BOOLEAN, 
	PRIMARY KEY (order_id), 
	FOREIGN KEY(customer_id) REFERENCES customer (customer_id), 
	FOREIGN KEY(delivery_person_id) REFERENCES delivery_person (delivery_person_id)
);

CREATE TABLE pizza_ingredient (
	menu_item_id INTEGER, 
	ingredient_id INTEGER, 
	FOREIGN KEY(menu_item_id) REFERENCES menu_item (menu_item_id), 
	FOREIGN KEY(ingredient_id) REFERENCES ingredients (id)
);

CREATE TABLE order_item (
	order_item_id INTEGER NOT NULL, 
	order_id INTEGER, 
	menu_item_id INTEGER, 
	quantity INTEGER, 
	price DECIMAL(8, 2), 
	PRIMARY KEY (order_item_id), 
	FOREIGN KEY(order_id) REFERENCES "order" (order_id), 
	FOREIGN KEY(menu_item_id) REFERENCES menu_item (menu_item_id)
);

