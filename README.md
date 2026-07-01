# RestfulApi — Product Catalog

Spring Boot 4.1.0 REST API for managing a product catalog with pagination, sorting, and filtering.

---

## Prerequisites

- Java 17+
- MySQL running on `localhost:3306`

Create the database:

```sql
CREATE DATABASE product_db;
```

---

## Configuration

Edit `src/main/resources/application.properties` with your MySQL credentials if needed:

```properties
spring.datasource.username=
spring.datasource.password=root
```

---

## Run

```bash
./mvnw spring-boot:run
```

App starts at **`http://localhost:8080`**. Hibernate auto-creates the `products` table.

---

## API Endpoints

### Base URL: `http://localhost:8080/api/products`

---

### Create Product

```
POST /api/products
```

**Body (JSON):**
```json
{
  "name": "Wireless Mouse",
  "description": "Ergonomic wireless mouse",
  "price": 29.99,
  "category": "Electronics",
  "stock": 100
}
```

**Response:** `201 Created`

---

### Get All Products

```
GET /api/products
```

**Optional query parameters:**

| Param     | Type   | Description                     |
|-----------|--------|---------------------------------|
| name      | String | Search by name (partial match)  |
| category  | String | Filter by exact category        |
| minPrice  | Number | Minimum price                   |
| maxPrice  | Number | Maximum price                   |
| page      | int    | Page number (default: 0)        |
| size      | int    | Page size (default: 10)         |
| sort      | String | Sort field (default: createdAt) |

**Examples:**

```
GET /api/products?category=Electronics
GET /api/products?minPrice=10&maxPrice=100&sort=price,asc
GET /api/products?name=mouse&page=0&size=5
GET /api/products?sort=createdAt,desc
```

**Response:** `200 OK` with paginated result:
```json
{
  "content": [ ... ],
  "totalElements": 15,
  "totalPages": 2,
  "number": 0,
  "size": 10,
  ...
}
```

---

### Get Product by ID

```
GET /api/products/{id}
```

**Example:** `GET /api/products/1`

**Response:** `200 OK` — single product object.  
**Error:** `404 Not Found`

---

### Update Product

```
PUT /api/products/{id}
```

**Body (JSON):**
```json
{
  "name": "Wireless Mouse Pro",
  "description": "Updated ergonomic mouse",
  "price": 39.99,
  "category": "Electronics",
  "stock": 80
}
```

**Response:** `200 OK`  
**Error:** `404 Not Found` if ID doesn't exist, `400 Bad Request` for validation errors.

---

### Delete Product

```
DELETE /api/products/{id}
```

**Example:** `DELETE /api/products/1`

**Response:** `204 No Content`  
**Error:** `404 Not Found`

---

### Validation Error Response

```
POST /api/products
{ "name": "", "price": -5 }
```

**Response:** `400 Bad Request`
```json
{
  "name": "Name is required",
  "price": "Price must be greater than 0"
}
```
