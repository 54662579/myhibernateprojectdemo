# myhibernateprojectdemo

Environment: Apache Tomcat 8.0, jre 1.8.0_73, Oracle 11g, Netbeans 8.2.

This web-based application allows users to create/update/edit/delete/list Student, Course, Teacher and Result. 

-------------------------------------------Authentication Configuration---------------------------------------

1. Oracle Statement:
1.1--create tables for authentication

CREATE TABLE USERS
   ("USER_NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"USER_PASSWORD" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "UNAME_PK" PRIMARY KEY ("USER_NAME"));
 
 CREATE TABLE USER_ROLES 
   ("USER_NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"ROLE_NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("USER_NAME", "ROLE_NAME"));

1.2--add tomcat username and password


insert into USERS values ('tomcat' , '123');

1.3--add tomcat roles

insert into USER_ROLES values ('tomcat', 'admin');

insert into USER_ROLES values ('tomcat', 'manager-script');

1.4--add sample users

insert into USERS values ('admin', '123');

insert into USERS values ('teacher','123');

insert into USERS values ('p-admin', '123');

1.5--add roles to sample users

insert into USER_ROLES values ('admin','admin');

insert into USER_ROLES values ('teacher','teacher');

insert into USER_ROLES values ('p-admin','programAdmin');


2. In tomcat – conf/server.xml file , add your oracle username/password
	 <Realm className="org.apache.catalina.realm.JDBCRealm“ 	driverName="oracle.jdbc.driver.OracleDriver“ 	connectionURL="jdbc:oracle:thin:cgs_spring/123@localhost:1521:xe“ 			userTable="users" userNameCol="user_name" userCredCol="user_password“ 	userRoleTable="user_roles" roleNameCol="role_name"/>
