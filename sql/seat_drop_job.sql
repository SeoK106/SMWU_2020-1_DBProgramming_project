 VARIABLE jobno NUMBER
 BEGIN 
   DBMS_JOB.SUBMIT(:jobno, 
                   'drop_seat;', 
                   SYSDATE, 
                   'SYSDATE + 1/(24*60)',false); 
   COMMIT; 
 END; 
 / 

