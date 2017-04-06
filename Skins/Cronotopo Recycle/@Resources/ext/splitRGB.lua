function Initialize()
	sLine1 = SELF:GetOption('Line1') -- parses Line1 as string from ini file
	sDelimiter = SELF:GetOption('Delimiter') -- parses Delimiter as string from ini file
	nCoordinate = tonumber(SELF:GetOption('Coordinate')) -- parses Coordinate as number from ini file
end

function Update()
	return Delim(sLine1,sDelimiter)[nCoordinate]
end

function Delim(line, delimiter) -- Separate String by single character delimiter
	assert(delimiter:len() == 1, 'Delim: Delimiter may only be a single character')
	local tbl = {}
	for word in line:gmatch('[^%' .. delimiter .. ']+') do
		table.insert(tbl, word)
	end
	return tbl
end
	
	