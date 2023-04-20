# Assignment
```
1. What is the main difference between SQL and NoSQL databases?

```
Ans: 

|  SQL    |  NoSQL  |
|---------|---------|
|1. Stands for Structured Query Language|1. Stands for Structured Query Language|
|2. Relational database management system (RDBMS)|2. Non-relational database management system|
|3. Suitable for structured data with predefined schema|3. Suitable for unstructured and semi-structured data|
|4. Data is stored in tables with columns and rows|4. Data is stored in collections or documents|
|5. Follows ACID properties|5. Does not necessarily follow ACID properties|
|Examples: MySQL, PostgreSQL, Oracle, SQL Server, Microsoft SQL Server|Examples: MongoDB, Cassandra, Couchbase, Amazon DynamoDB, Redis|

```
2. What are some of the benefits of using NoSQL databases over traditional SQL databases?

```
Ans:

Some of the benifit of using NoSQL databases over SQL databases are 

* **Flexibility:** 
With SQL databases, data is stored in a much more rigid, predefined structure. But with NoSQL, data can be stored in a more free-form fashion without those rigid schemas. This design enables innovation and rapid application development. Developers can focus on creating systems to better serve their customers without worrying about schemas. NoSQL databases can easily handle any data format, such as structured, semi-structured, and non-structured data in a single data store.

* **Scalability:**
Instead of scaling up by adding more servers, NoSQL databases can scale out by using commodity hardware. This has the ability to support increased traffic in order to meet demand with zero downtime. By scaling out, NoSQL databases can become larger and more powerful, which is why they have become the preferred option for evolving data sets.

* **High performance:**
The scale-out architecture of a NoSQL database can be particularly valuable when data volume or traffic increases. As shown in the graphic below, this architecture ensures fast and predictable single-digit millisecond response times. NoSQL databases can also ingest data and deliver it quickly and reliably, which is why NoSQL databases are used in applications that collect terabytes of data every day, while also requiring a highly interactive user experience. 

```
3.What are some common use cases for NoSQL databases?
```
Ans: 

* Fraud detection and identity authentication.
* Inventory and catalog management.
* Personalization, recommendations and customer experience.
* Internet of things (IoT) and sensor data.
* Financial services and payments.
* Messaging.
* Logistics and asset management.
* Content management systems.

```
4. What are the four main types of NoSQL databases, and what are their key characteristics?
```

Ans: There are four main types of NoSQL databases. They are

* Document databases
* Key-value stores
* Column-oriented databases
* Graph databases

### Document databases : 
A document database stores data in JSON, BSON, or XML documents (not Word documents or Google Docs, of course). In a document database, documents can be nested. Particular elements can be indexed for faster querying.

Documents can be stored and retrieved in a form that is much closer to the data objects used in applications, which means less translation is required to use the data in an application. SQL data must often be assembled and disassembled when moving back and forth between applications and storage.

### Key-value stores

The simplest type of NoSQL database is a key-value store. Every data element in the database is stored as a key value pair consisting of an attribute name (or "key") and a value. In a sense, a key-value store is like a relational database with only two columns: the key or attribute name (such as "state") and the value (such as "Alaska").

### Column-oriented databases

While a relational database stores data in rows and reads data row by row, a column store is organized as a set of columns. This means that when you want to run analytics on a small number of columns, you can read those columns directly without consuming memory with the unwanted data. Columns are often of the same type and benefit from more efficient compression, making reads even faster. Columnar databases can quickly aggregate the value of a given column (adding up the total sales for the year, for example). Use cases include analytics.

### Graph databases

A graph database focuses on the relationship between data elements. Each element is stored as a node (such as a person in a social media graph). The connections between elements are called links or relationships. In a graph database, connections are first-class elements of the database, stored directly. In relational databases, links are implied, using data to express the relationships.

```
5. What is the CAP theorem, and how does it relate to distributed systems?
```
Ans: 

**The CAP theorem**, originally introduced as the CAP principle, can be used to explain some of the competing requirements in a distributed system with replication. It is a tool used to make system designers aware of the trade-offs while designing networked shared-data systems. 

The three letters in CAP refer to three desirable properties of distributed systems with replicated data: consistency (among replicated copies), availability (of the system for read and write operations) and partition tolerance (in the face of the nodes in the system being partitioned by a network fault). 

The CAP theorem states that it is not possible to guarantee all three of the desirable properties – consistency, availability, and partition tolerance at the same time in a distributed system with data replication. 



```It is possible to achieve CAP theorm in a distributed system where data is distributed accross nodes in the distributed system and in such a system any two out of three  in CAP is possible to achieve.```

```
6. What are the three properties of the CAP theorem?
```
Ans:

Three properties of the CAP theorem are: consistency, availability, and partition tolerance.

### Consistency

Consistency means that all clients see the same data at the same time, no matter which node they connect to. For this to happen, whenever data is written to one node, it must be instantly forwarded or replicated to all the other nodes in the system before the write is deemed ‘successful.’

### Availability

Availability means that any client making a request for data gets a response, even if one or more nodes are down. Another way to state this—all working nodes in the distributed system return a valid response for any request, without exception.

### Partition tolerance

A partition is a communications break within a distributed system—a lost or temporarily delayed connection between two nodes. Partition tolerance means that the cluster must continue to work despite any number of communication breakdowns between nodes in the system.


```
7. What are the BASE properties, and how do they relate to the CAP theorem?
```

Ans: 

BASE properties stands for 

* **Basically-Available:** A distributed system should be available to respond with some acknowledgment — even if it’s a failure message, to any incoming request.

* **Soft-state:** The system may keep changing states as and when it receives new information.

* **Eventually-consistent:** The components in the system may not reflect the same value/state of a record at a given point in time. They will settle it with time, eventually, though.

This properties are quite relatable with the CAP properties as it is the simplier form or the application form of CAP theorm. Here also the stages of any transactions are same and which also satisfy the CAP theorm.

