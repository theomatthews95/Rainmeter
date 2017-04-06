--
-- A SIMPLE AUTOSWITCHER FOR SPOTIFY AND NOWPLAYING
-- Made by Redsaph exclusively for Cleartext
--
-- redsaph.altervista.org		redsaph.ml
--
-- If you have read this and have the intention
-- of using this, please do not delete this flower box
-- and just append on it.
--
-- Thank you very much.
--
-- Last modified by Redsaph on December 21, 2016
--
	

loopNP = 0
loopSP = 0
	
function Initialize()
	initPlayer = SKIN:GetVariable('Player')
	SKIN:Bang('!WriteKeyValue Variables CurPlayer ' .. initPlayer .. ' "#@#Variables.inc"')
end -- ends Initialize

function Update()
	nowPlayingStatus = SKIN:GetMeasure('mStatus0')
	spotifyStatus = SKIN:GetMeasure('mStatus1')
	player = SKIN:GetVariable('CurPlayer')
	
	retVal = 'None'	
		
	if nowPlayingStatus:GetValue() == 1 then
		retVal = adaptForNowPlaying()
	elseif spotifyStatus:GetValue() == 1 then
		retVal = adaptForSpotify()
	end
	
	SKIN:Bang('!Update')
	return retVal
end -- ends Update

function adaptForNowPlaying()	
	SKIN:Bang('!SetOption TopText1 Text "[#topText#0]"')
	SKIN:Bang('!SetOption TopText2 Text "[#topText#0]"')
	SKIN:Bang('!SetOption BottomText1 Text "[#bottomText#0]"')
	SKIN:Bang('!SetOption BottomText2 Text "[#bottomText#0]"')
	
	if loopNP < 1 then
		SKIN:Bang('!WriteKeyValue Variables MusicSwitch 0 "#@#Variables.inc"')
		SKIN:Bang('!WriteKeyValue Variables switchedOn 1 "#@#variables.inc"')
		loopNP = loopNP + 1
		
		if player == 'Spotify'  then
			print('In refresh')
			SKIN:Bang('!WriteKeyValue Variables CurPlayer ' .. initPlayer .. ' "#@#Variables.inc"')
			SKIN:Bang('!Refresh')
		end
		
		loopSP = 0
	end
	
	return 'NowPlaying'
end -- ends adaptForNowPlaying

function adaptForSpotify()
	SKIN:Bang('!SetOption TopText1 Text "[#topText#1]"')
	SKIN:Bang('!SetOption TopText2 Text "[#topText#1]"')
	SKIN:Bang('!SetOption BottomText1 Text "[#bottomText#1]"')
	SKIN:Bang('!SetOption BottomText2 Text "[#bottomText#1]"')
	
	if loopSP < 1 then
		SKIN:Bang('!WriteKeyValue Variables MusicSwitch 1 "#@#Variables.inc"')
		SKIN:Bang('!WriteKeyValue Variables switchedOn 1 "#@#variables.inc"')
		SKIN:Bang('!Update')
		loopSP = loopSP + 1
		
		if player ~= 'Spotify' then
			print('In refresh')
			SKIN:Bang('!WriteKeyValue Variables CurPlayer Spotify "#@#Variables.inc"')
			SKIN:Bang('!Refresh')			
		end
		
		loopNP = 0
	end
	
	return 'Spotify'
end -- ends adaptForSpotify