function Initialize()
	sLine1 = SELF:GetOption('Line1') -- parses Line1 as string from ini file
	sDelimiter = SELF:GetOption('Delimiter') -- parses Delimiter as string from ini file
end

function Update()
	R = Delim(sLine1,sDelimiter)[1] -- gets first RGB coordinate
	G = Delim(sLine1,sDelimiter)[2] -- gets second RGB coordinate
	B = Delim(sLine1,sDelimiter)[3] -- gets third RGB coordinate
	return Lightness(R,G,B)
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

function Lightness(R,G,B) -- Calculates Lightness (HSL) coordinate from RGB values
	local Cmax = math.max(R,G,B)
	local Cmin = math.min(R,G,B)
	return math.ceil(Avg(Cmax,Cmin))
end
	
	