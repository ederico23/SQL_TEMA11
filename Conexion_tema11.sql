--CLASE

/*1. Crear una vista DEP30 que contiene el APELLIDO, el OFICIO, y el SALARIO de los
empleados de la tabla EMPLE del departamento 30. Después comprobar
descripción y contenido.*/




/*3. Crear la vista VDEP a partir de la tabla DEPART con las columnas dept_no y
dnombre. A partir de la vista anterior ambiar el nombre del departamento 20 a
‘nuevo20’.*/

CREATE VIEW VDEP
AS SELECT DEPT_NO, DNOMBRE
FROM DEPART;

SELECT *
FROM VDEP;

SELECT *
FROM DEPART;

UPDATE VDEP
SET DNOMBRE = 'nuevo 20'
WHERE DEPT_NO = 20;

INSERT INTO VDEP
VALUES (
    50,
    'INFORMATICA'
    );
    
    
/*4. Crear una vista a partir de las tablas EMPLE y DEPART que contenga las
columnas EMP_NO, APELLIDO, DEPT_NO y DNOMBRE. Probar a insertar, a
modificar y a borrar filas.*/

--ERROR
CREATE VIEW EMPLE_DEPART(EMP_NO_EMPLE, APELLIDO_EMPLE,DEPT_NO_DEPART, DNOMBRE_DEPART)
AS SELECT E.EMP_NO, E.APELLIDO, D.DEPT_NO, D.DNOMBRE
FROM EMPLE E, DEPT D
WHERE E.DEPT_NO = D.DEPT_NO;



/*5. Crear una vista llamada pagos a partir de las filas de la tabla EMPLE, cuyo
departamento sea el 10. Las columnas de la vista se llamarán NOMBRE,
SAL_MES. SAL_AN y DEPT_NO. El NOMBRE es la columna APELLIDO, al que
aplicamos la función INITCAP(), SAL_MES es el SALARIO, SAL_AN es el
salario*12.
Modificar individualmente cada columna y ver qué ocurre. (Hacer rollback después
de cada actualización)
*/

CREATE VIEW PAGOS(NOMBRE, SAL_MES, SAL_AN, DEPT_NO)
AS SELECT INITCAP(APELLIDO), SALARIO, SALARIO*12, DEPT_NO
    FROM EMPLE
    WHERE DEPT_NO = 10;

--SALARIO TE LO PERMITE
--NOMBRE, SAL_AN NO PQ ES UNA FUNCION

SELECT * 
FROM EMPLE;

UPDATE PAGOS
SET DEP_NO = 10
WHERE NOMBRE = 'Negro';



/*6. Crear la vista VMEDIA a partir de las tablas EMPLE y DEPART. La vista contendrá
por cada departamento el número de departamento, el nombre, la media de
salario y el máximo salario.
Visualizar su contenido y tratar de borrar filas, insertar y modificar.*/

CREATE VIEW VMEDIA(NUM_DEPT, NOMBRE_DEPT, MEDIA_SALARIO, MAX_SALARIO)
AS SELECT D.DEPT_NO, D.DNOMBRE, AVG(E.SALARIO), MAX(E.SALARIO)
    FROM EMPLE E, DEPART D
    WHERE E.DEPT_NO = D.DEPT_NO
    GROUP BY D.DEPT_NO, D.DNOMBRE;

SELECT * 
FROM VMEDIA;
--NO DEJA BORRAR ACTUALIZAR O INSERTAR FILES

/*SINÓNIMOS:
7. Crear el sinónimo DEPARTAMENTOS asociado a la tabla DEPART*/
CREATE SYNONYM DEPARTAMENTOS FOR DEPART;

/*8. Crear un sinónimo llamado Conser asociado a la vista creada antes (vmedia).
Hacer consultas utilizando este sinónimo.*/

CREATE SYNONYM CONSER FOR VMEDIA;

SELECT * 
FROM CONSER;















