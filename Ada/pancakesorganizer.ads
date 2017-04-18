package PancakesOrganizer is	
	Invalid_Value: exception; --excepción
	function flip(pancakes:String;flipCounter:integer:=0) return integer;
	procedure readRow(caseIndex:integer);
	function verify(pancakes:String) return boolean;
	private function checkIfStringContains(str:String) return boolean;
end PancakesOrganizer;