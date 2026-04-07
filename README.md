# Retail Pricing Dashboard

## Overview
This is a Flutter Web application that allows users to upload pricing data via CSV, view records, search, sort, and edit product pricing information.

---

## Features
- Upload CSV file containing pricing data
- Parse and display records dynamically
- Search by product name or SKU
- Sort products by price (ascending/descending)
- Edit product price and save changes

---

## Tech Stack
- Flutter Web
- Dart
- file_picker (for CSV upload)
- csv (for parsing CSV data)

---

## Architecture

### Context Diagram
User → Flutter Web App → Data Layer

### Solution Architecture
- Presentation Layer: Flutter UI components
- Business Logic Layer: Filtering, sorting, editing logic
- Data Layer: CSV parsing and in-memory storage

---

## Design Decisions
- Chose Flutter Web for rapid development and cross-platform capability
- Used simple layered architecture for clarity and maintainability
- Used in-memory data storage for MVP simplicity
- Focused on clean and readable code

---

## Non-Functional Requirements

### Performance
- Efficient filtering and sorting logic

### Scalability
- Can be extended to backend/database integration

### Maintainability
- Modular structure with separation of concerns

### Security
- Input validation during CSV parsing

---

## Assumptions
- CSV format is valid and consistent
- Data size is manageable in memory
- No authentication required for MVP

---

## How to Run

```bash
flutter pub get
flutter run -d chrome