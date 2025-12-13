# Selfnutri – Cloud Computing Final Project (MSIT-3470)

![Selfnutri Logo](docs/selfnutri.png)

The final, live application is accessible here: **[https://d3tuac21giuzpq.cloudfront.net/](https://d3tuac21giuzpq.cloudfront.net/)**

## Table of Contents

* [1) Project Overview & Features](#1-project-overview--features)
* [2) Architecture & Technical Decisions](#2-architecture--technical-decisions)
* [3) API Details (Write & Read Paths)](#3-api-details-write--read-paths)
* [4) SLO & Monitoring Plan](#4-slo--monitoring-plan)
* [5) Deployment & Run Instructions](#5-deployment--run-instructions)
* [6) Team, Roles, and AI Usage](#6-team-roles-and-ai-usage)

---

## 1) Project Overview & Features

**Selfnutri** is a lightweight personal health and nutrition tracker that lets users quickly log daily meals and water intake, then review their history and progress over time. The goal is to demonstrate a secure, serverless cloud architecture with real write/read paths.

* **Core Feature (Write Path):** Users submit a new entry via the frontend, which calls a `POST /logs` API to write a document into a managed Firestore database.
* **Analytics Feature (Read Path):** Users view history powered by a `GET /logs` API that queries Firestore and returns the results to the UI.

---

## 2) Architecture & Technical Decisions

The application uses a hybrid serverless design: AWS provides static hosting, CDN, and API execution, while Google Cloud Firestore is used as the managed NoSQL database.

### Architecture Diagram

![Selfnutri Architecture Diagram](docs/diagram.PNG) 

### Core Cloud Components

| Layer | Component(s) | Resource Detail |
| :--- | :--- | :--- |
| **Frontend Delivery** | **AWS CloudFront** (CDN) | URL: `https://d3tuac21giuzpq.cloudfront.net/` |
| **Frontend Hosting** | **AWS S3** (Static Hosting) | Static HTML/CSS/JS is stored in an S3 bucket. |
| **Backend API** | **AWS API Gateway + Lambda** | API Gateway calls an AWS Lambda function which executes business logic. |
| **Data Persistence** | **Google Firestore** (Managed NoSQL) | Stores meal and water logs as documents. |
| **Object Storage** | **AWS S3** (Data Bucket) | Provisioned for future use cases like file/image uploads. |

### Security & Operational Focus

* **CloudFront Origin Access Control (OAC):** Enabled to ensure the frontend S3 bucket only allows access from the CloudFront distribution, blocking direct S3 public access.
* **Least-Privilege & Secrets:** Lambda and CI/CD use dedicated IAM roles, and all secrets (Firebase credentials, API keys) are injected via environment variables.

---

## 3) API Details (Write & Read Paths)

The backend exposes a minimal, focused API to prove the cloud stack end-to-end.

| Path | Method | Description | Data Operation |
| :--- | :--- | :--- | :--- |
| `/logs` | `POST` | Accepts JSON payloads for new logs (meal/water entries) and writes a new document to Firestore. | Write to Firestore |
| `/logs` | `GET` | Returns all existing logs by reading from Firestore and sending an aggregated JSON list back to the client. | Query Firestore |

### Example API Requests

```bash
# Create a new log (Write Path)
curl -X POST [https://l38jxggdfh.execute-api.us-west-2.amazonaws.com/logs](https://l38jxggdfh.execute-api.us-west-2.amazonaws.com/logs) ...

# Fetch all logs (Read Path)
curl [https://l38jxggdfh.execute-api.us-west-2.amazonaws.com/logs](https://l38jxggdfh.execute-api.us-west-2.amazonaws.com/logs)
