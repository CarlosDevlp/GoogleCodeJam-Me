--importando librerias
with Text_IO, Ada.Strings.Fixed,Ada.Strings.Bounded, Ada.Strings.Unbounded;
use Text_IO, Ada.Strings.Fixed, Ada.Strings.Unbounded; 
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;--entrada y salida de enteros
with Ada.Float_Text_IO; use Ada.Float_Text_IO;--entrada y salida de decimales
with PancakesOrganizer; use PancakesOrganizer;--packete nuestro
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

		--excepciones --
		exception 	
			--capturar excepción pre-definida por el sistema
			when Constraint_error => put_line("El primer valor,"&
							 " para definir el número de casos,"&
							 				 " debe ser entero.");			
			--capturar excepción definida por mí
			when Error : others => put_line(Exception_Information (Error));
end Main;