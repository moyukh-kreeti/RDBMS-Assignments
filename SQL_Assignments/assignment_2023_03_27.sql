-- 1. Create a trigger to fill up the full_name column in the dependents table while
-- inserting any new records.

CREATE TABLE dependents_logs (dependent_logs_id INTEGER PRIMARY KEY AUTOINCREMENT, logs_msg TEXT);

CREATE or REPLACE function dependent_trg_logs()
returns trigger
language plpgsql
as $$
begin
  if new.first_name='' or new.last_name='' then
    insert into dependents_logs values(new.dependent_id,'Please fill the name properly');
    return NULL;
  end if;
  return new;
  
end;
$$;

CREATE trigger dependent_trg
before insert 
on dependents
For each row execute procedure dependent_trg_logs();


-- 2. Create a trigger that stores the transaction records of each insert, update and
-- delete operations performed on the locations table into locations_info table.

CREATE TABLE location_info (location_id_old INTEGER,street_address_old VARCHAR(255),
pincode_old VARCHAR(255),city_old VARCHAR(255),state_province_old VARCHAR(255),country_id_old INTEGER);

CREATE OR REPLACE function transaction_audit() 
returns trigger
language plpgsql
as $$
begin

  insert into location_info values(old.location_id,
  old.street_address,
  old.pincode,
  old.city,
  old.state_province,
  old.country_id);

  return new;

end;
$$;

CREATE trigger location_transaction
after insert delete update
on locations
For each row execute procedure transaction_audit();

-- 3. For the following tables create a view named employee_information with
-- employee first name, last name, salary, department name, city, postal code insert
-- only those records whose postal code length is less than 5.

CREATE VIEW employee_information AS
SELECT e.first_name, e.last_name, e.salary, d.department_name, l.city, l.pincode
FROM employees e JOIN departments d 
  ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
  WHERE length(l.pincode) < 5;

--4. Explain ACID properties with an example

ACID property : ACID stands for Atomicity, Consistency, Isolation and Durablity. This the basic and primary property of a database.

1.Atomicity: By this, we mean that either the entire transaction takes place at once or doesn’t happen at all. There is no midway i.e. transactions do not occur partially. Each transaction is considered as one unit and either runs to completion or is not executed at all. It involves the following two operations.

Example: In  Banking system if we withdraw money from our account then the money will be deducted or the money will not be deducted from the account there will not be any mid of this situation.

2.Consistency : This means that integrity constraints must be maintained so that the database is consistent before and after the transaction. It refers to the correctness of a database. Referring to the example above, The total amount before and after the transaction must be maintained. 

Example: Suppose there is 10 rs in 'A's account and there is 20 rs in 'B's account and 'B' has sended 5 rs in 'A's account.Then there must be 15 rs in 'A's account and 15 rs in 'B's account. And the total amount before and after the transaction is maintained(Here 30 rs).

3. Isolation : This property ensures that multiple transactions can occur concurrently without leading to the inconsistency of the database state. Transactions occur independently without interference. Changes occurring in a particular transaction will not be visible to any other transaction until that particular change in that transaction is written to memory or has been committed. 

Example: From one account multiple user debit money at a time but none of the users tranaction get hamper for the other person. All the users transaction will be parallel that is isolation .

4. Durablity : This property ensures that once the transaction has completed execution, the updates and modifications to the database are stored in and written to disk and they persist even if a system failure occurs. These updates now become permanent and are stored in non-volatile memory. The effects of the transaction, thus, are never lost. 

Example : After successfull transaction the value of the account should be stored in a permanent storage that the value consist after this transaction.

-- 5.

The Occupation column has been used to make the index. This is because, after
sorting the table by the Occupation column, the original rows will get placed
in the given sequence: 1, 3, 2, 5 and 4.