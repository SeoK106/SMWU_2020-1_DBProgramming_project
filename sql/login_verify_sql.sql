CREATE OR REPLACE PROCEDURE login_verify_func(
	id IN VARCHAR2,
	pw IN VARCHAR2,
	major OUT VARCHAR2,
	msg OUT VARCHAR2
)
IS
	
	CURSOR login_ck(id students.s_id%TYPE) IS SELECT s_pwd,s_major FROM students WHERE s_id=id; 
BEGIN
	major:='major';
	msg:='wrong id';
	FOR verify IN login_ck(id) LOOP
		IF(pw=verify.s_pwd)
		THEN
			msg:='login successfully';
			major:=verify.s_major;
		ELSE
			msg:='wrong password';
		END IF;
	END LOOP;
	
	EXCEPTION 
		WHEN OTHERS THEN
			rollback;
			msg:=SQLERRM;
END;
/