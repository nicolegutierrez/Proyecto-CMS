CREATE OR REPLACE FUNCTION autenticar   (
    
 p_username IN VARCHAR2, 
 p_password IN VARCHAR2   
)
 RETURN BOOLEAN
AS
 lc_pwd_exit VARCHAR2 (1);
BEGIN
 -- Valida si el usuario existe o no 
 SELECT 'A'
 INTO lc_pwd_exit
 FROM CMS_USUARIOS
 WHERE upper(NOM_USUARIO) = UPPER (p_username) AND CLAVE = p_password and ESTADO ='A' 
;
RETURN TRUE;
EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
 RETURN FALSE;
END autenticar;
