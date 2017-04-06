function Initialize()
	sLine1 = SELF:GetOption('Line1') -- parses Line1 as string from ini file
	sLine2 = SELF:GetOption('Line2') -- parses Line2 as string from ini file
	sDelimiter = SELF:GetOption('Delimiter') -- parses Delimiter as string from ini file
	iCoordinate = tonumber(SELF:GetOption('Coordinate')) -- parses Coordinate as a number from ini file
end

function Update()
	
	AvgCol = {}
	
	R1 = Delim(sLine1,sDelimiter)[1] -- gets first RGB coordinate from Line1
	G1 = Delim(sLine1,sDelimiter)[2] -- gets second RGB coordinate from Line1
	B1 = Delim(sLine1,sDelimiter)[3] -- gets third RGB coordinate from Line1
	
	R2 = Delim(sLine2,sDelimiter)[1] -- gets first RGB coordinate from Line2
	G2 = Delim(sLine2,sDelimiter)[2] -- gets second RGB coordinate from Line2
	B2 = Delim(sLine2,sDelimiter)[3] -- gets third RGB coordinate from Line2
	
	AvgCol[1] = math.ceil(Avg(R1,R2))
	AvgCol[2] = math.ceil(Avg(G1,G2))
	AvgCol[3] = math.ceil(Avg(B1,B2))
	
	return AvgCol[iCoordinate]
end

function Delim(line, delimiter) -- Separate String by single character delimiter
	assert(delimiter:len() == 1, 'Delim: Delimiter may only be a single character')
	local tbl = {}
	for word in line:gmatch('[^%' .. delimiter .. ']+') do
		table.insert(tbl, word)
	end
	return tbl
end

function Avg(x,y) -- Calculate the average value between two numbers
	return ((x + y)/2)
end

