# Animal-shelter-database
This relationsl database was created with a no-kill animal shelter in mind. The project models the day to day processes that would occur in a shelter such as animal care, adoption, intake, and fostering. 
## Table of Contents
- [Overview](#overview)
- [Setup and Usage](#setup-and-usage)
- [ER Diagram](#er-diagram)
- [Schema Overview](#schema-overview)
- [Relationship Summary](#relationship-summary)
- [Implementation](#implementation)
- [Team](#team)
## Overview
This system was developed to manage and optimize data for an animal adoption center, including:

- Animal intake and tracking (cats and dogs)
- Adoptions and reservations
- Volunteer and employee assignments
- Foster home management
- Medical procedure logging and staff training

The goal is to provide a structured, efficient, and scalable database model that reflects real-world shelter operations.

## Setup and Usage
This project includes a full SQL dump file that contains all the database tables, relationships, and sample data
### Requirements
- My SQL 8.0 or later
- a local MySQL server or an online environment
### Steps
1. clone the repo ( or download the dump file) <br>''' bash<br>git clone https://github.com/smcnary2/Animal-shelter-database.git
2. Open MySQL
3. Create a new database<br>CREATE DATABASE Furever_Animal_Shelter;<br>USE Furever_Animal_Shelter;
4. Import the SQL dump file<br>mysql -u your_username -p Furever_Animal_Shelter < Furever_Animal_Shelter_dump.sql
5. Verify setup<br>SHOW TABLES;<br>SELECT*FROM Animal LIMIT 5;

## ER Diagram
<img width="747" height="872" alt="Screenshot from 2025-08-05 19-34-59" src="https://github.com/user-attachments/assets/a46856ed-334c-4606-bd1e-88a3bf193afb" />

## Schema Overview
| Table                      | Description                                                                                                               |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| **Animal**                 | Stores details about each cat or dog, including name, age, sex, type, breed, intake/out dates, and adoption availability. |
| **Breed**                  | Contains all possible animal breeds categorized by type (cat or dog).                                                     |
| **AnimalType**             | Defines available animal categories (e.g., cat, dog).                                                                     |
| **Owner**                  | Stores adopter information including name and address.                                                                    |
| **Volunteer**              | Holds volunteer details, including contact information.                                                                   |
| **Employee**               | Records staff members, their names, and phone numbers.                                                                    |
| **RoomType**               | Defines types of rooms (medical, nursery, standard).                                                                      |
| **Room**                   | Tracks rooms within the shelter, linked to room type, volunteer, and assigned employee.                                   |
| **AnimalLocation**         | Tracks where each animal is housed (room, kennel).                                                                        |
| **MedicalProcedure**       | Lists all available medical procedures performed at the shelter.                                                          |
| **AnimalMedicalProcedure** | Associates animals with medical procedures, including dates and the employee who performed them.                          |
| **EmployeeTraining**       | Logs employee training history by department and completion date.                                                         |
| **Training**               | Catalog of available training programs (e.g., “Vaccinations”, “Surgical”).                                                |
| **MedProcedureEmployee**   | Connects employees to procedures they’re certified to perform.                                                            |
| **Reservation**            | Records adopter reservations for animals not yet ready for adoption.                                                      |
| **Adopt**                  | Logs finalized adoptions, linking animals with their new owners.                                                          |
| **FosterInfo**             | Contains information about registered foster homes.                                                                       |
| **Foster**                 | Links animals to their current foster homes.                                                                              |
## Relationship Summary
All relationships in the schema are either **one-to-one (1:1)** or **one-to-many (1:M)**.

| Relationship | Type | Description |
|---------------|------|--------------|
|Employee to Employee Training| 1:M|An employee can complete multiple training sessions, but each training session is associated with only one employee|
|Employee to MedProcedureEmployee| 1:M |Each employee can perform multiple medical procedures, but each medical procedure record is tied to one employee|
|Employee to AnimalMedicalProcedure| 1:M |An employee can be responcible for preforming multiple medical procedures on animals, but each animal medical procedure is associated with only one employee|
|Animal to Adopt |1:M |Each animal can be adopted multiple times (though typically it will be adopted once in the real world), but each adoption record refers to one animal|
| Animal to Breed | 1:M | Each breed can include multiple animals, but each animal has one breed. |
| Animal to AnimalMedicalProcedure | 1:M | Each animal can have multiple medical procedures performed by employees. |
|Animal to Foster | 1:M |An animal can be fostered by different people, but each fostering event refers to oneanimal.|
|Animal to AnimalLocation | 1:M |An animal can be in different locations (rooms, kennels) over time, but each record in the animal_location table is for a single animal at a single location.|
|Room to AnimalLocation | 1:M |A room can house multiple animals, but each animal_location record corresponds to one animal in one room.|
| RoomType to Room | 1:M | A room type can apply to multiple rooms in the shelter. |
|Owner to Animal | 1:M |An owner can have multiple animals, but each animal is owned by only one owner|
| Owner to Adopt | 1:M | An owner can adopt multiple animals, but each adoption record refers to one owner. |
|Training to EmployeeTraining | 1:M |Each training can be assigned to multiple employees, but each EmployeeTraining record refers to a single training.|
| Volunteer to AnimalLocation | 1:M |A volunteer can be assigned to many animal locations, but each animal location record corresponds to a single volunteer.|
| Volunteer to Animal | 1:M |A volunteer can work with multiple animals, but each animal_location record is linked to one animal and one volunteer.|
| FosterInfo to Foster | 1:1 | Each foster record has a corresponding foster information record. |


## Implementation
the database includes
- table creation scripts
- sample data popluation scripts
- example queries for adopting, retreiving medical history and avaliability tracking
## Team
Developed collaboratively by: Sofia McNary, Alissia Huntzinger, Bishakha Tamrakar
### Time logs

| Date | Team Member | Hours Spent | Description of Work | Additional Comments |
|------|--------------|--------------|----------------------|----------------------|
| 15 July 2025 | Alissia | 3 | Brainstormed project ideas, created conceptual design, and proposal. |  |
| 15 July 2025 | Sofia | 3 | Brainstormed project ideas, created conceptual design, and proposal. |  |
| 15 July 2025 | Bishakha | 3 | Brainstormed project ideas, created conceptual design, and proposal. |  |
| 25 July 2025 | Alissia | 3 | Worked on ERD and table structure. | Consulted with professor and updated design. |
| 25 July 2025 | Sofia | 3 | Worked on ERD and table structure. | Consulted with professor and updated design. |
| 25 July 2025 | Bishakha | 3 | Worked on ERD and table structure. | Consulted with professor and updated design. |
| 27 July 2025 | Alissia | 3 | Created and populated assigned tables with data. |  |
| 27 July 2025 | Sofia | 3 | Created and populated assigned tables with data. |  |
| 27 July 2025 | Bishakha | 2.5 | Created and populated assigned tables with data. |  |
| 30 July 2025 | Alissia | 2 | Tested table relationships and fixed errors. | Consulted with professor for debugging. |
| 30 July 2025 | Sofia | 2 | Tested table relationships and fixed errors. | Consulted with professor for debugging. |
| 30 July 2025 | Bishakha | 2 | Tested table relationships and fixed errors. | Consulted with professor for debugging. |
| 5 August 2025 | Alissia | 6 | Fixed data issues, worked on final report and slideshow. |  |
| 5 August 2025 | Sofia | 6 | Created database, executed scripts, fixed relationship errors, worked on final report. |  |
| 5 August 2025 | Bishakha | 6 | Worked on the final report. |  |
| 6 August 2025 | Alissia | 2 | Completed queries, slideshow, and final report. |  |
| 6 August 2025 | Sofia | 2 | Completed queries, slideshow, and final report. |  |
| 6 August 2025 | Bishakha | 2 | Completed queries, slideshow, and final report. |  |
