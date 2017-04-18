with Text_IO, Ada.Strings.Fixed,Ada.Strings.Bounded, Ada.Strings.Unbounded;
use Text_IO, Ada.Strings.Fixed, Ada.Strings.Unbounded;
with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Exceptions;  use Ada.Exceptions;

package body PancakesOrganizer is	
	-- procedimiento para empezar a leer una fila y luego solucionarla
	procedure readRow(caseIndex:integer) is
		pancakes:String:= get_line;		
	begin

		if( not checkIfStringContains(pancakes) ) then
		  	Raise_Exception (Invalid_Value'Identity, "Solo los valores '+'"&
							 			" y '-' son válidos para cada caso.");	
		end if;
		
		put_line("Case #"&Integer'Image(caseIndex)&": "&Integer'Image(flip(pancakes)) );
		
	end readRow;

	-- procedimiento para voltear los pancakes
	function flip(pancakes:String;flipCounter:integer:=0) return integer is
		pancakesCopy:String :=pancakes;
		cake: Character :=pancakes(1);
		cakeOtherSide: Character;
	begin
		--si es válido todo salir del método
		if (verify(pancakes)) then
			return flipCounter;
		end if;

		
		if(cake='+') then
			cakeOtherSide:='-';
		else
			cakeOtherSide:='+';
		end if;


		for i  in 1..pancakes'length  loop
			exit when (pancakes(i)/=cake);
			pancakesCopy(i):=cakeOtherSide;
		end loop;

		--recursividad
		return flip(pancakesCopy,flipCounter)+1;
	end;

	--verifica que todos los pancakes estén boca arriba
	function verify(pancakes:String) return boolean is
		positiveSideUpCounter:integer:=0;
	begin
				
		for i in 1..pancakes'length loop
			if (pancakes(i)='+') then
				positiveSideUpCounter:=positiveSideUpCounter+1;
			end if;
		end loop;

		return positiveSideUpCounter=pancakes'length;

	end verify;

 --PRIVADAS
 	function checkIfStringContains(str:String) return boolean is 		
 	begin 

 		for i in 1..str'length loop
 			if(str(i)/='+' and str(i)/='-') then
 				return FALSE;
 			end if;
 		end loop;

 		return TRUE;

 	end checkIfStringContains;

end PancakesOrganizer;