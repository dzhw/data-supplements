capture program drop dzhwchana
program define dzhwchana 
	version 12.0
	syntax [varlist], [newname oldname]	
	
	***Fehler überprüfen
	*Anzahl der Optionen
	if "`newname'" == "" & "`oldname'" == "" {
		di as error "Mindestens eine Option angeben"
		exit
	} 
	if "`newname'" != "" & "`oldname'" != "" {
		di as error "Maximal eine Option angeben"
		exit
	} 

	*Checken ob es ein DZHWgetagter Datensatz ist
	local check1 : char _dta[dzhwdataset]
	if `"`check1'"' != "true" {
		di as error "Dies ist kein DZHW-Datensatz"
		exit
	}

	***Variablenbennenung
	foreach var of varlist `varlist' {
		*Für Option newname
		if `"`newname'"' == "newname" {
			local newvarname: char `var'[dzhwnewvarname]
			if `"`newvarname'"' == "" {
				di as  result "Variable `var' besitzt keinen neuen DZHW-Variablennamen"
			}
			else {
				rename `var' `newvarname'
			}
				
		}
		*Für Option oldname
		if `"`oldname'"' == "oldname" {
			local oldvarname: char `var'[dzhwoldvarname]
			if `"`oldvarname'"' == "" {
				di as  result "Variable `var' besitzt keinen alten DZHW-Variablennamen"
			}
			else {
				rename `var' `oldvarname'
			}
		}
	}
end



