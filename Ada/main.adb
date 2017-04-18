with Text_IO, Ada.Strings.Fixed,Ada.Strings.Bounded, Ada.Strings.Unbounded;
use Text_IO, Ada.Strings.Fixed, Ada.Strings.Unbounded;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with PancakesOrganizer; use PancakesOrganizer;
with Ada.Exceptions;  use Ada.Exceptions;


procedure Main is		
	c:integer:=1;
	T:integer;	
begin -- Procedure		
	--Número de casos
		T:=Integer'Value(get_line);	
		--resolver T pedidos (casos) sobre pancakes
		while (c<=T)  loop
			readRow(c);	
			c:=c+1;
		end loop;

		exception 	
			--capturar excepción
			when Constraint_error => put_line("El primer valor,"&
							 " para definir el número de casos,"&
							 				 " debe ser entero.");			
			when Error : others => put_line(Exception_Information (Error));
end Main;