# 🛫 AIRportNOVA — PostgreSQL Airport Database System

**AirPortNova** is a comprehensive PostgreSQL-based database system that models the backend of a real-world airport. It captures essential components like flights, airfares, routes, employees, passengers, and booking transactions. Ideal for academic projects, enterprise database modeling, or API/database integration practice.

---

## 📦 About the Project

AirPortNova simulates a scalable and normalized airport management system. It mirrors the complex relationships and data structures seen in real-world aviation databases, emphasizing clarity, referential integrity, and normalization.

---

## 🔧 Key Features

- 🚀 **Normalized and Modular Schema**
- 🔁 **Realistic Entity Relationships**
  - Airline ↔ Fleet ↔ Flight  
  - Passenger ↔ Ticket ↔ Transaction
- 🧠 **Bridge Tables** for Join Efficiency
- 📌 **Foreign Key Constraints** to Ensure Data Integrity
- 📊 **Designed for Scalability & Maintainability**

---

## 🗂️ Entity Overview

| Entity         | Description                                           |
|----------------|-------------------------------------------------------|
| `Country`      | Stores country codes and names                        |
| `City`         | City names, states, and related country               |
| `Airport`      | Airport code, name, location, and country info        |
| `Airline`      | Airline ID and name                                   |
| `Employee`     | Staff details including role, name, and contact       |
| `Flight`       | Flight schedule, source, destination, and timing      |
| `Passenger`    | Flyer information indexed by passport ID              |
| `Ticket`       | Travel details: type, price, origin & destination     |
| `Airfare`      | Price breakdown per flight                            |
| `Route`        | Defined flight path with takeoff and landing points   |
| `AirplaneType` | Aircraft specs such as seating capacity and weight    |
| `Transaction`  | Booking & payment data linked to passengers & staff   |

---

## 🚀 Getting Started

> Requirements:
- PostgreSQL 13+
- pgAdmin or psql CLI
- Optional: Docker for containerized deployment

### 🔧 Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/AIRportNOVA.git
