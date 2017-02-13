capture program drop notadzhwmissing
program define notadzhwmissing 
	version 12.0

	quietly ds, not(type string)
	foreach variable of varlist `r(varlist)' {
	                quietly count if `variable' < 0 
	                               if r(N) > 0 {
	                                               quietly fre `variable' if `variable' < 0
	                                               forvalues i = 1/ `r(r)' {
	                                                               quietly levelsof `variable' if `variable' < 0
	                                                               local vorhandeNegativeWerte `vorhandeNegativeWerte' `r(levels)'
	                                               }
	                               }
	}
	if "`vorhandeNegativeWerte'" == "" {
		display "Keine negativen Werte vorhanden"
	}
	else {
		local uniqueVorhandeNegativeWerte: list uniq  vorhandeNegativeWerte
		local counter = 0  
		foreach  wert of numlist `uniqueVorhandeNegativeWerte' { 
		                local counter = `counter'+1
		                quietly ds , not(type string) // nur für numerische Variablen
		                foreach variable of varlist `r(varlist)' { 
		                               quietly count if `variable' == `wert'                         
		                               if r(N) > 0 { // Nur wenn variable den Wert enthält
		                                               local vl`counter' `vl`counter'' `variable' 
		                               }
		                }
		                if "`vl`counter''" != "" { 
		                               display "Variablen mit dem Kode: `wert' in Global" " $" "vl`counter' gespeichert"
		                               quietly describe `vl`counter'', varlist 
		                               global vl`counter' `r(varlist)'
		                }
		}
		local uniqueVorhandeNegativeWerte: list uniq  vorhandeNegativeWerte
		local listeAllerMissingcodes ///
		"-999 -998 -997 -996 -995 -994 -989 -988 -987 -986 -985 -969 -968 -967 -966 -965 -929" 
		local uniqueVorhandeNegativeWerteOM : list uniqueVorhandeNegativeWerte - listeAllerMissingcodes
		display "Folgende negative Werte noch in den Daten vorhanden: `uniqueVorhandeNegativeWerte'"
		display "Folgende negative Werte, welche keine nach offiziellen Misisngschema (FDZ-DZHW) vergeben Werte sind, noch in den Daten vorhanden: `uniqueVorhandeNegativeWerteOM'"
	}
end
