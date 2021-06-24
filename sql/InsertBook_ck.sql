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
	
	/*���� ó��1: �ִ� ���� �� �ִ� �Ǽ� �ʰ� ���� -> �����Ϸ��� ��쿡�� ó��*/
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