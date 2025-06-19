-- SQl a programming language used to store and processing information in a relational database. 
-- A relational database stores data in tabular form with rows(records) and columns(fields) with the latter representing
-- different attirbutes about an entity.
-- An entity is a real world object or concept that can be distictly identified and stored in database. 

 -- ---- characteristics of an entity ---
 -- Entities must have a unique identifier known as PRIMARY KEY
 -- Entities can have relationship with other entities linked together with help of FOREIGN KEY.
 
 
 -- Entity Set: is aa collection of instances of entity. E.g all students.
 -- Entity Relationship(ER): Describes how entities relate to each other.  
 
 -- Types (DDL,DML,DCL,TCL)
 -- Data Definition Language (DDL): Defines and manages the structure of database objects(schemas, tables, indexes, views). 
 
 -- Key DDL commands:
 -- CREATE: Creates new database objects e.t.c (CREATE DATABASE)
 -- ALTER: Modifies the structure of existing objects. 
 -- DROP: Deletes database objects. 
 -- TRUNCATE: Deletes all data from existing table. 
 -- RENAME: Changes the name of existing objects. 
 
 -- Data Manipulation Language(DML): Deals with data access and data manipulation (insert, update, retrieve, delete)
 
 -- Key DML  commands
 -- SELECT: Retrives data from one or more tables;
 -- INSERT:  Adds new records to a table. 
 -- UPDATE: Modifies existing records. 
 -- DELETE: Removes data from an existing table. 
 
 -- Data Control Language(DCL): Manages access to rights and permissions in objects of a database. 
 
 -- Key DCL commands:
 -- GRANT: Provides previledges to users. 
 -- REVOKE: Revokes previously granted privileges. Code Example
 GRANT SELECT, INSERT ON Employee TO user123;

REVOKE INSERT ON Employee FROM user123;


-- Transaction Control Language (TCL): Manges transactions in a database, ensuring data integrity during multiple DML operations. 

-- Key TCL commands: 
-- BEGIN: Starts a new conversation.
-- COMMIT: Saves all transactions made in current transaction.
-- ROLLBACK: Undoes changes since the last commit. 
-- SAVEPOINT: Creates a save marker in a transaction. 
-- RELEASE SAVEPOINT: Removess a savepoint. 
-- SET TRANSACTION: Configures isolation level.

-- TCL enables atomicity, consistency, isolation, and durability (ACID properties) for reliable database systems.
 