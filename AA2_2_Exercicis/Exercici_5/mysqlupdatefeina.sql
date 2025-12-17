--a)
DELETE FROM localitats 
    WHERE empleats IS NULL;

SELECT * FROM localitats;


--b)
DELETE FROM empleats 
    WHERE salari>70000;

SELECT * FROM empleats;


--c)
UPDATE empleats SET salari=50000
    WHERE codi_l IN (
        SELECT codi_l FROM localitats WHERE nom='Barcelona'
        );

SELECT * FROM empleats;


--d)
UPDATE empleats SET salari=(salari*1.2)
    WHERE salari<20000;

SELECT * FROM empleats;