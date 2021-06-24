CREATE OR REPLACE PROCEDURE res_delete_seat(
	sId IN VARCHAR2,
	Id IN VARCHAR2,
	result OUT VARCHAR2
)
IS
	not_in_table EXCEPTION;
	
	res VARCHAR2(10);

BEGIN
	res:=null;
	
	SELECT res_id INTO res FROM seats WHERE seat_id=sId and res_id=Id;
	IF (res=Id)
	THEN
		result:='reservation of seat delete successfully';
	ELSE
		RAISE not_in_table;
	END IF;
	
	UPDATE seats SET res_id=null WHERE seat_id=sId;
	COMMIT;
	
	EXCEPTION 
		WHEN not_in_table THEN
			result:='no reserved seat exists';
		WHEN OTHERS THEN
			rollback;
			result:=SQLERRM;
END;
/