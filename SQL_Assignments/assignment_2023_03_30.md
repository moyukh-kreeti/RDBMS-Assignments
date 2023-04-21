# Assignment(30th March)

```
1. What are the main features of redis?
```

Ans: 

Features mean a distinctive attribute or aspect of something. Redis features mean what are the special aspects or attributes are available with the Redis Datastore. Every technology has many individual features (attributes ). Redis also has some very important and useful features to be used. We may see one by one below.

* 1. **In-memory datastore**

All Redis data is stored in the server’s main memory in contrast to the conventional relational databases such as SQL, Oracle, etc that store most data on disk or SSDs. In-memory data stores such as Redis don’t suffer the same penalty as non-in-memory databases suffer to access disks or SSDs. It gives faster response times. So it gives applications super-fast performance and support for millions of operations per second.

* 2. **High availability and scalability**

Redis offers a primary-replica architecture in a single node primary or a clustered topology. This allows you to build highly available solutions providing consistent performance and reliability. As Redis is Single-Threaded, Only one thread is associate with I/O operations. Redis server uses Master-slave architecture to increase the load that can be handled by the server. Due to Redis's primary-replica architecture improved read performance as requests can be split among the servers and faster recovery when the primary server experiences an outage. You may use this to get more ideas about the Redis availability.

* 3. **Data Persistence**

Data Persistence means that the data survives after the producer process of the particular data has ended. In other terms, Saved data must last even if the server failure occurs. For a data store to be considered persistent, It must write on permanent storage (non Volatile such as a hard disk). For persistence, Redis supports point-in-time backups (copying the Redis data set to disk). Redis Support RDB, AOF persistence mechanism to persist the data to the non-volatile memory

* 4. **Rich Data Structures**

Redis is more than just a usual key-value datastore technology. It offers a vast variety of data structures to meet our application needs. It enables users to implement applications according to the client’s requirements not associated with the technology limitations.


```
2. Write down the limitations of redis?

```

Ans:

Main limitations of redis are following:

* Redis is an in-memory store: all your data must fit in memory. RDBMS usually stores the data on disks, and cache part of the data in memory. With a RDBMS, you can manage more data than you have memory. With Redis, you cannot.
* Redis is a data structure server. There is no query language (only commands) and no support for a relational algebra. You cannot submit ad-hoc queries (like you can using SQL on a RDBMS). All data accesses should be anticipated by the developer, and proper data access paths must be designed. A lot of flexibility is lost.
* Redis offers 2 options for persistency: regular snapshotting and append-only files. None of them is as secure as a real transactional server providing redo/undo logging, block checksuming, point-in-time recovery, flashback capabilities, etc
* Redis only offers basic security (in term of access rights) at the instance level. RDBMS all provide fine grained per-object access control lists (or role management).

```
3.Perform a basic CRUD operation using redis.

```
Ans:

### Create:

```redis
SET job Engineer
```
### READ:

```redis
GET job Engineer
```
### Update:

```redis
SET job 'Softwere Engineer' 
```
### Delete:

```redis
DEL job 
```

```
4. Explain TTL command with an example.
```
Ans:

In Redis, the TTL (Time To Live) command is used to set an expiration time for a key, after which the key will be automatically deleted by Redis. The TTL value represents the number of seconds until the key expires.

```redis

SET job 'Softwere Engineer'
EXPIRE job 60
```

Thus we can set Time to live or expiry time to any variable. We can also see the remaining time of living the variable by the comand
```
TTL job
```

After 60s this `job` variable will be deleted by Redis automatically.

```
5. Create a transaction in redis to perform the following operations.
  ● Create two keys in a single line and one key differently. (one value should be number)
  ● Read any two value in a single line
  ● Increment the number value
  ● Expire any two keys after some time
```

Ans:

```
MULTI
MSET job1 "Engineer" job2 "softwere Engineer"
SET job_count 40
MGET job1 job2
INCR job_count
EXPIRE job1 60
EXPIRE job2 120
EXEC
```