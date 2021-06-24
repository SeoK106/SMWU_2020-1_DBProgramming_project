CREATE PROCEDURE InsertBook_ck(
	bId IN books.b_id%type,
	sId IN students.s_id%type,
	result OUT VARCHAR2
)

IS
	too_many_books	EXCEPTION;
	
	ck		checkOut%ROWTYPE;
	nBooks	NUMBER;
	state	VARCHAR2(4);
	cBooks	NUMBER;
	CURSOR checkedBooks IS SELECT b_id,s_id FROM checkOut WHERE s_id=sId;
	
BEGIN
	result:='temp';
	
	/*에러 처리1: 최대 빌릴 수 있는 권수 초과 여부 -> 대출하려는 경우에만 처리*/
	SELECT b_quantity INTO nBooks FROM s_info WHERE s_id=sId;
	
	OPEN checkedBooks;
	LOOP
		FETCH checkedBooks INTO ck.b_id,ck.s_id;
		EXIT WHEN checkedBooks%NOTFOUND;
	END LOOP;
	cBooks:=checkedBooks%ROWCOUNT;
		
	IF(nBooks<=cBooks)
		THEN 
			RAISE too_many_books;
	END IF;
	
	INSERT INTO checkOut(b_id,s_id,ck_date) VALUES(bId,sId,sysdate());
	result:='check out successfully';

	COMMIT;
	
	EXCEPTION 
		WHEN too_many_books THEN
			result:='can not check out\ntoo_many_books error';
		WHEN OTHERS THEN
			rollback;
			result:=SQLERRM;
END;
/