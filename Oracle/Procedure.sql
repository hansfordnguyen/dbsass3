-- Lay thong tin doi tuyen cho truoc id (TeamManager)
create or replace PROCEDURE getDoiTuyen(ID_INPUT VARCHAR2, 
OUT_CURSOR OUT SYS_REFCURSOR)
IS 
BEGIN
  OPEN out_cursor FOR
  SELECT * FROM DOI_TUYEN
  WHERE ID = ID_INPUT;
END;
/

-- Cap nhat loai tai khoan (Admin)
create or replace PROCEDURE updateTaiKhoan(USERNAME_INPUT VARCHAR2, NEW_LOAI_TAI_KHOAN VARCHAR2)
AS
BEGIN
  UPDATE TAI_KHOAN
  SET LOAI_TAI_KHOAN = NEW_LOAI_TAI_KHOAN
  WHERE UPPER(USERNAME) = UPPER(USERNAME_INPUT);
  COMMIT;
END;
/
-- Xem thong tin bang tai khoang (Admin)
create or replace PROCEDURE viewTaiKhoan(OUT_CURSOR OUT SYS_REFCURSOR)
AS
BEGIN
  OPEN OUT_CURSOR FOR
  SELECT *
  FROM TAI_KHOAN;
END;
/
-- Do trong bang TAI_KHOAN, kiem tra tai khoan hop le
create or replace
PROCEDURE isValidAccount(IN_USERNAME IN VARCHAR2, IN_PASSWORD IN VARCHAR2, IN_LOAI IN VARCHAR2, FLAG OUT NUMBER)
AS
  USER VARCHAR2(30);
  CURSOR CUR IS
    SELECT USERNAME 
    FROM TAI_KHOAN
    WHERE UPPER(USERNAME) = UPPER(IN_USERNAME) AND PASSWORD = IN_PASSWORD AND LOAI_TAI_KHOAN = IN_LOAI;
BEGIN
  FLAG := -1;
  OPEN CUR;
  FETCH CUR INTO USER;
  IF CUR%NOTFOUND THEN
    FLAG := 2;
  ELSE
    FLAG := 1;
  END IF;
  CLOSE CUR;
END;
/
-- Xem thong tin mot bang
create or replace
PROCEDURE viewTable(IN_TABLE_NAME IN VARCHAR2, OUT_CURSOR OUT SYS_REFCURSOR)
IS
BEGIN
  OPEN OUT_CURSOR FOR
  'SELECT *
  FROM '|| IN_TABLE_NAME;
END;
/

create or replace procedure quan_ly(uname in varchar2, ten in varchar2, flag out int)
as
val int;
cursor cur is
select count(*) 
from quan_ly_doi_bong,DOI_TUYEN 
where DOI_TUYEN.ID=quan_ly_doi_bong.ID_DOI_TUYEN 
and quan_ly_doi_bong.USERNAME=uname 
and DOI_TUYEN.TEN=ten;

begin
open cur;
fetch cur into val;
if (cur%notfound)
then
flag:=0;
else
flag:=1;
end if;
end;
/