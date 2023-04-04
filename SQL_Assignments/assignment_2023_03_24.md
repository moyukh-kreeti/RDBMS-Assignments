# Using PostgreSQL

```
1. Determine the highest normal form of this relation scheme. 

The relation scheme student Performance (StudentName, CourseNo, EnrollmentNo, Grade) has
the following functional dependencies:
StudentName, courseNo → grade
RollNo, courseNo → grade
StudentName →EnrollmentNo
EnrollmentNo →StudentName
```

### Ans :

Let's assume

* CourseNo → Cn

* StudentName → Sn

* EnrollmentNo → En

* RollNo → Rn

* grade → G

So the functional dependency becomes,

Sn, Cn → G

Rn,Cn → G

Sn → En

En → Sn

Now , Lets find the candidate key first and for this we need to find the attribute closure for the whole attribute set.

(CnSnEnRnG)<sup>+</sup>  => { Cn, Sn, En, Rn ,G }

Now, Sn → En and Sn,Cn → G so we can eleminate En and G

(CnSnRn)<sup>+</sup>  => { Cn, Sn, En, Rn ,G }

Now proper subset of (CnSnRn) is not a super key that's why it is a candidate key.

Also En → Sn 

So, (EnCnRn) is also a candidate key because no proper subset of this is a super key

So Prime Attributes are {Sn,Cn,Rn,En}

```

|          | Sn, Cn → G  | Rn,Cn → G  | Sn → En  | En → Sn  |
|----------|-------------|------------|----------|----------|
|BCNF      |     No      |     No     |    No    |    No    |
|3rd Normal|     Yes     |     Yes    |    Yes   |    Yes   |

```
Here Any of the functional dependency is not  a super key that's why it is not in BCNF

But Here there is no any transitive dependency in any functional dependency depedency so it is in 3NF from.



```
2. Suppose you are given a relation R= (A, B, C, D, E ) with the following functional

dependencies:{CE →D, D→B, C → A}

a. Find all candidate keys.

b. Identify the best normal form that R satisfies (1NF, 2NF, 3NF, or BCNF).

c. If the relation is not in BCNF, decompose it until it becomes BCNF. At each step, identify a new relation, decompose and re-compute the keys and the normal forms they satisfy.

```

Ans : 

a.

Let's take the attribute closure for  all the attribute

(ABCDE)<sup>+</sup> => {A,B,C,D,E}

Now, from the functional dependency CE → D , D → B and C →A 

So, we can generate them from CE only

(CE)<sup>+</sup> => {D,B,C,E,A}

and no proper subset of CE is a super key that's why it is a **Candidate key (CE)**

b.

Here the candidate key is CE 

So, prime attributes are  {C,E}

```
|          | CE → D      |    D → B   |   C → A  |
|----------|-------------|------------|----------|
|BCNF      |     Yes     |     No     |    No    |
|3rd Normal|     Yes     |     No     |    No    |
|2nd Normal|     Yes     |     Yes    |    No    |
```

From the above table we can see that 

The relation is not in BCNF as D is not a super key and C is not also a super key.

The relation is not in 3NF as D -> B is a transitive dependency

The relation is not in 2NF as C-> A is a pertial dependency

So, the relation is in 1NF

c.

Firstly as C → A creates a pertial dependency so we will decompose the table from there 

So, the table will be R1(A,C) and R2(C,B,D,E) , A is common between R1 and R2 because the decomposition will be loseless.

Now, R1 will be in BCNF as C-> A and C will be candidate key.

For, R2 there will be functional dependency  

CE → D

D → B

Now here D → B is a transitive dependency so we will decompose the table from there

So, the table R2 will be R21(D,B) and R22(C,E,D)

Here , R21 will be in BCNF as D → B and D will be  acandidate key 

And, The functional dependency of R22 will be 

CE → D 

So, It will be also in BCNF as CE is a candidate key.

**SO, finally the table will be R21(D,B) , R22(C,E,D), R1(A,C).**

```
3. You are given the following set F of functional dependencies for relation R(A, B, C, D, E, F):

F ={ABC → D, ABD→E,CD→F,CDF →B,BF →D}

a. Find all keys of R based on these functional dependencies.

b. Is this relation in Boyce-Codd Normal Form? Is it 3NF? Explain your answers

```

Ans :

a.

Here the functional dependencies are ,

ABC → D

ABD → E

CD → F

CDF → B

BF → D

So, now getting the attribute closure for the wholre attribute

(ABCDEF)<sup>+</sup> => {A, B, C, D, E, F}

Now , ABC → D ,ABD → E and CD → F so we can eleminate D,E,F 

(ABC)<sup>+</sup>=> {A, B, C, D, E, F}

also no proper subset of abc is a super key .

so, we can say ABC is a candidate key for the relation.

Now, CDF → B so we can replace B in the ABC

(ACDF)<sup>+</sup>=> {A, B, C, D, E, F}

But CD → F

So, (ACD)<sup>+</sup>=> {A, B, C, D, E, F}

also no proper subset of ACD is a super key

So, ACD is also a candidate key for the relation.


**The Candidate keys in this relation are ABC and ACD**


b.


```
|          |   ABC → D   |   ABD → E  |   CD → F | CDF → B | BF → D |
|----------|-------------|------------|----------|---------|--------|
|BCNF      |     Yes     |     No     |    No    |    No   |   No   |
|3rd Normal|     Yes     |     No     |    No    |    Yes  |   Yes  |
|2nd Normal|     Yes     |     No     |    No    |    Yes  |   Yes  |

```

The relation is not in BCNF as ABD -> E in this dependency ABD is not a super key.

The relation is not in 3NF as ABD -> E in this dependency ABD is not a superkey or E is not a prime attribute.


```
4. Write the advantages and disadvantages of normalization.

```

Ans : 

# Advantages of Normalization :
Here we can perceive any reason why Normalization is an alluring possibility in RDBMS ideas.

* A more modest information base can be kept up as standardization disposes of the copy information. Generally speaking size of the information base is diminished thus.
* Better execution is guaranteed which can be connected to the above point. As information bases become lesser in size, the goes through the information turns out to be quicker and more limited in this way improving reaction time and speed.
* Narrower tables are conceivable as standardized tables will be tweaked and will have lesser segments which considers more information records per page.
* Fewer files per table guarantees quicker support assignments (file modifies).
* Also understands the choice of joining just the tables that are required.


# Disadvantages of Normalization :

* More tables to join as by spreading out information into more tables, the need to join table’s increments and the undertaking turns out to be more dreary. The information base gets more enthusiastically to acknowledge too.
* Tables will contain codes as opposed to genuine information as the rehashed information will be put away as lines of codes instead of the genuine information. Thusly, there is consistently a need to go to the query table.
* As the typical structure type advances, the exhibition turns out to be increasingly slow.


```

5. Determine the decomposition.
Consider the schema R = (S T U V) and the dependencies 
S → T, T → U, U → V, and V → S.
Let R = (R1 and R2) be a decomposition such that R1 ∩ R2 ≠ ∅ .

```
Ans : 

Here the dependencies are 

S → T

T → U

U → V

V → S

Here we can see all the elements can generate all the other elements so all the elements are candidate keys .

The prime attributes are  S,T,U,V 

Let decompose the relation as follows:

**R1(S,T,U) and R2(U,V)**

as per the question we can see R1 ∩ R2 ≠ ∅  as R1 ∩ R2={U}

And R1 and R2 both are in BCNF normal form.






