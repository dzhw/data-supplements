capture program drop dzhwanonym
program define dzhwanonym
	version 12.1
	syntax varlist
	foreach variable of varlist `varlist'  {
		local datattype: type `variable'
		local datattype = substr("`datattype'",1,3) 
		if "`datattype'" == "str" { 
			destring `variable', replace  force 
			replace `variable' = -967
			label define anonymisiert -967 "anonymisiert", modify
			label value `variable' anonymisiert
			local variableLabel: variable label `variable'
			label variable `variable' "`variableLabel' (anonymisiert)"
			label define anonymisiert -967 "anonymisiert", modify
			label value `variable' anonymisiert
		}
		else {	
			local valueLable: value label `variable'
			if "`valueLable'" != "" {
				replace `variable' = -967
				local variableLabel: variable label `variable'
				label variable `variable' "`variableLabel' (anonymisiert)"
				local valueLable: value label `variable'
				label define `valueLable' -967 "anonymisiert", modify	
			}
			else {				
				replace `variable' = -967
				local variableLabel: variable label `variable'
				label variable `variable' "`variableLabel' (anonymisiert)"
				label define anonymisiert -967 "anonymisiert", modify
				label value `variable' anonymisiert
			}
		}
	}
end
