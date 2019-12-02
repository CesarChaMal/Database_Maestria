/*

Client

ClientNo fName Iname 

1	Peter	Doe
2	John	Doe
3	Jane	Doe


Viewing

clientNo propertyNo Comment

1	P1	propiedad1
1	P2	propiedad2
2	P3	propiedad3
	p4	propiedad4

*/

 ----------------------- join implicito --------------------
 ----------------------- producto cartesiano y condicion --------------------

select
	TempClient.clientNO,TempClient.fname,TempClient.lname, TempViewing.comment

from
	(select ClientNO,fname,lname from client) as TempClient
	,

	(select ClientNO,propertyNo,comment from viewing) as TempViewing
where
	TempClient.clientNo = TempViewing.clientNo


;


 ----------------------- join explicito --------------------
 ----------------------- natural join --------------------
 ----------------------- inner join --------------------

select
	TempClient.clientNO,TempClient.fname,TempClient.lname, TempViewing.comment

from
	(select ClientNO,fname,lname from client) as TempClient

inner join

	(select ClientNO,propertyNo,comment from viewing) as TempViewing
on
	TempClient.clientNo = TempViewing.clientNo

;

 ----------------------- outer join --------------------
 ----------------------- left join --------------------

select
	TempClient.clientNO,TempClient.fname,TempClient.lname, TempViewing.comment

from
	(select ClientNO,fname,lname from client) as TempClient

left outer join

	(select ClientNO,propertyNo,comment from viewing) as TempViewing
on
	TempClient.clientNo = TempViewing.clientNo

;

 ----------------------- right join --------------------

select
	TempClient.clientNO,TempClient.fname,TempClient.lname, TempViewing.comment

from
	(select ClientNO,fname,lname from client) as TempClient

right outer join

	(select ClientNO,propertyNo,comment from viewing) as TempViewing
on
	TempClient.clientNo = TempViewing.clientNo

;


