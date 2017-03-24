# Summary

**Under Construction**

An employee management web-app for Human Resources department using Java, the Spring MVC framework, and MySQL databse technologies with CRUD functionality. This web-app implements session control, and has a MySQL database deployed to an Apache Tomcat 8 Server. This is also the first time where we attempted to constrain the project to pass the command object rather than fields between the .jsp-controller-DAO. The web-app is also mobile responsive and data can be viewed/manipulated with most popular mobile devices. The database was created with MySQL Workbench.

This web-app is a collaborative project. The goal, milestone, and separation of roles/responsibilities are illustrated in the structure/flow chart image embedded in the README but can also be found in slideshow format in the root folder. (Acoustic Liquidators is a randomly selected team name which does not have any relation to the project itself.)

Issues the team ran into:

If more time were available...

<p align="center">
<img src="" height="245">
<img src="" height="245"></p>
<p align="center">
<img src="" height="245">
<img src="" height="245"></p>


## In This Document
1. [How to Execute](#how-to-execute)
2. [Class Structure Overview](#class-structure-overview)

## How to Execute
- The web-app is hosted on my AWS server: <a href="http://www.chiangs.ninja:8080/AcousticLiquidatorsHRMVCSQLCRUD/">**here**</a>
- Download the entire program as a .war file <a href="AcousticLiquidatorsHRMVCSQLCRUD.war">**here**</a>

## Instructions
1. User arrives on landing page, with query fields???
2. User menu:
    - View All Employees
    - Add Employee
    - Edit Employee
    - Delete Employee
3. Each employee manipulation option can also be executed directly from the inventory overview.???

## Class Structure Overview
- The **alController** class is the controller and interacts with the **HRDAOImpl** class which implements methods declared in the **HRDAO** interface. The product and list objects are constructed using information from the **Employee** class and accompanying database.
- The **alController** provides information back through **.jsp** files for the user to view and manipulate.

<p align="center">
<img src="" height="350">
</p>

## Code Examples
**example of code**

## Technologies Used

- Java
- Spring MVC and Spring STS
- Gradle Managed Dependencies
- MySQL and MySQL Workbench
- Java Server Pages and JSTL/EL
- HTML
- CSS and Bootstrap
- JavaScript / JQuery???
