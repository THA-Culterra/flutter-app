# **Software System Document for Culterra - The Intercultural Explorer**

## **1. Introduction**

### **1.1 Purpose**

The purpose of this document is to provide a detailed overview of the *Culterra - The Intercultural Explorer* software system, including its architecture, components, and functionalities. This document serves as a reference for developers, project stakeholders, and contributors.

### **1.2 Scope**

*Culterra - The Intercultural Explorer* is an interactive mobile application designed to help users explore, learn about, and travel to various cultures worldwide. The system gathers data manually from locals and international students, ensuring authentic and unique cultural insights. It is built using Flutter for cross-platform mobile development and Firebase Firestore for real-time database storage.

### **1.3 Intended Audience**

- Developers
- Designers
- Product Managers
- Project Stakeholders

### **1.4 Definitions and Acronyms**

- **Flutter**: A cross-platform UI toolkit for building natively compiled applications.
- **Firebase Firestore**: A NoSQL cloud database used for real-time data synchronization.
- **MVVM**: Model-View-Controller, the chosen architectural pattern.
- **Erasmus Program**: An EU student exchange program facilitating cultural interactions.

---

## **2. System Overview**

### **2.1 System Objectives**

- Provide an interactive world map for cultural exploration.
- Deliver authentic cultural insights from locals and international students.
- Enable users to explore destinations and learn about cultural practices before traveling.
- Ensure offline access to stored data.
- Prioritize UI/UX for an engaging user experience.

### **2.2 System Features**

- **Interactive World Map**: Users can explore cultures visually through a dynamic map.
- **Cultural Insights**: Curated content from locals and students.
- **Multi-language Support**: Supports multiple languages to cater to diverse users.
- **User Profiles**: Allows users to save favorite cultures and destinations.
- **Offline Mode**: Enables access to previously loaded data without an internet connection.
- **Gamification Elements**: Incentivize users with badges and achievements for exploring new cultures.

---

## **3. System Architecture**

### **3.1 Architectural Design**

The system follows an **MVVM (Model-View-Controller) architecture** for better separation of concerns. The frontend (Flutter) interacts with Firebase Firestore for data storage.

### **3.2 Technology Stack**

- **Frontend**: Flutter (Dart)
- **Backend**: Firebase Firestore (NoSQL Database)
- **Authentication**: Firebase Authentication
- **Deployment**: Google Play Store & Apple App Store

### **3.3 High-Level System Diagram**

```plaintext
User → Flutter Frontend → Firebase Firestore
```

---

## **4. Data Model**

### **4.1 Database Structure (Firestore)**

```plaintext
Collection: Cultures
 - Document: { country_id, country_name, cultural_facts, images, videos }

Collection: Users
 - Document: { user_id, name, email, saved_cultures }
```

---

## **5. System Functionalities**

### **5.1 User Registration & Authentication**

- Users can sign up and log in using Firebase Authentication.
- Supports Google and email-based authentication.

### **5.2 Cultural Data Access**

- Users can browse cultural data organized by country.
- Content includes text, images, and videos.

### **5.3 World Map Interaction**

- Users can click on countries to access cultural details.
- Map data is dynamically updated.

### **5.4 User Preferences & Bookmarks**

- Users can save cultures for later exploration.
- Personalization based on user interests.

### **5.5 Offline Access**

- Recently viewed content is cached for offline usage.

---

## **6. Security Considerations**

### **6.1 Authentication & Authorization**

- Firebase Authentication secures user accounts.
- Role-based access control (RBAC) ensures secure data access.

### **6.2 Data Protection**

- Firestore security rules prevent unauthorized data access.
- Personal user data is encrypted.

---

## **7. Deployment & Maintenance**

### **7.1 Deployment Plan**

- The app will be deployed on Google Play Store and Apple App Store.
- Firebase Hosting will manage web-based access if needed.

### **7.2 Maintenance & Future Enhancements**

- Regular data updates from new local contributors.
- Integration of AI-driven cultural recommendations.
- Enhanced gamification features.

---

## **8. Conclusion**

This document provides a structured overview of the *Culterra* software system, detailing its architecture, functionalities, and security considerations. Further iterations may refine features and enhance performance based on user feedback.