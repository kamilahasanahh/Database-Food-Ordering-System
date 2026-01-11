# Pizza Ordering System: Databases Project During Student Exhange Semester Maastricht University

This project was developed as part of the Databases course (Maastricht University) to demonstrate technical mastery of relational database design, ORM implementation, and user interface development.

## 📋 Project Requirements Checklist

| Requirement | Implementation Status |
| --- | --- |
| **Simple GUI** | ✅ Implemented via a stylized **Terminal GUI** using the `Rich` python library. |
| **ER Diagram** | ✅ Logical relationships defined via **SQLAlchemy ORM** (available in documentation). |
| **Database Schema** | ✅ Fully automated schema generation and export utility. |
| **Technical Mastery** | ✅ Utilized **Object-Relational Mapping (ORM)** and **ACID-compliant** transactions. |

---

## 🏗️ System Architecture

The project implements a **Pizza Ordering System** using a Python backend and a MySQL database.

## 📋 Entity Relationship Diagram

<img width="1920" height="1505" alt="ERD" src="https://github.com/user-attachments/assets/04b01983-020d-4ef8-a8c4-0d9a745de836" />

### **1. Database & ORM (Technical Mastery)**

Instead of writing raw SQL, this project utilizes **SQLAlchemy** to manage the database lifecycle. This ensures high-level abstraction, security against SQL injection, and maintainable code.

* **Complex Relationships:** Implemented Many-to-Many relationships (e.g., `pizza_ingredient` link table) to manage dynamic menu items.
* **Automatic Labels:** The system programmatically determines if a pizza is `is_vegan` or `is_vegetarian` by inspecting the properties of its linked ingredients.
* **Business Logic:** Integrated constraints to handle "10th pizza free" loyalty logic and birthday discounts.

### **2. Database Schema**

The system manages several key entities:

* **Customer:** Profile management, birthday tracking, and order history.
* **Order & OrderItems:** Transactional data linking customers to their specific food choices.
* **Delivery Logistics:** `DeliveryArea` and `DeliveryPerson` tables allow the system to assign couriers based on postal codes and availability.
* **Promotions:** A `DiscountCode` table with expiration logic for marketing campaigns.

### **3. Terminal User Interface (GUI)**

Following the project constraint for a "simple GUI," I developed a robust **Terminal GUI** using the `Rich` library.

* **Interactive Menus:** User-friendly navigation for both Customers and Staff.
* **Live Data Rendering:** Uses formatted tables and panels to display the menu, order status, and assignment logs.
* **Staff Portal:** Secure access for administrators to update stock, manage delivery personnel, and track store performance.

---

## 🛠️ Key Functionalities Demonstrated

* **Concurrency Handling:** Implementation of `threading` (as seen in the source code) to manage potential background tasks or simulations.
* **Input Validation:** Robust handling of user inputs during registration and ordering.
* **Schema Export Tool:** An automated utility to export the current database state into a `pizza_ordering_schema.sql` file, fulfilling the project's documentation requirement.

---

## 🚀 Installation & Running

1. **Dependencies:** Install the required Python packages:
```bash
pip install sqlalchemy mysql-connector-python pymysql rich

```

2. **Database Connection:** Configure the MySQL connection string in `DBSourceCode.ipynb`.
3. **Run System:** * Execute the initialization cells to build the schema.
* Run the `main()` loop to start the Terminal GUI.


## 👥 Contributors

* Kamila Hasanah
* Martyna Maira
