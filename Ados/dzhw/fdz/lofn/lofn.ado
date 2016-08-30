program lfon, rclass
	version 8

	if `"`0'"' == "" {
		di as err "nothing to look for"
		exit 198
	}

	foreach W of local 0 {
		local w = lower(`"`W'"')
		local looklist `"`looklist' `"`w'"'"'
	}

	local 0 "_all"
	syntax varlist

	foreach v of local varlist {
		local lbl : char `v'[dzhwnameneu] 
		local lbl : subinstr local lbl "'" "", all
		local lbl : subinstr local lbl "`" "", all
		foreach w of local looklist {
			if index(lower(`"`v'"'),`"`w'"') | index(lower(`"`lbl'"'),`"`w'"') {
				local list "`list'`v' "
				continue, break
			}
		}
	}

	if "`list'" != "" {
		describe `list'
		return local varlist `list'
	}
end
exit
