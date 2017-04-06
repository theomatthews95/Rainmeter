
;Rounded Shapes Styles

[CIRCLE]
AntiAlias=1
Solid=1
LineLength=([#CURRENTSECTION#:W]/2)
H=[#CURRENTSECTION#:W]
LineColor=255,255,255,255
W=128

;Drawable shapes from CIRCLE style (Roundline meter only)
;CIRCLE - definition variables: "W" (diameter),  "LineColor" (color and alpha blending)
;CLOVE - definition variables: "W" (diameter), "RotationAngle" (spread angle), "StartAngle" (starting angle)
;Rainmeter draws arcs clockwise, in radians by default

[RING]
AntiAlias=1
Solid=1
LineStart=(0.77*[#CURRENTSECTION#:W]/2)
LineLength=([#CURRENTSECTION#:W]/2)
H=[#CURRENTSECTION#:W]
LineColor=255,255,255,255
W=128

;Drawable shapes from RING style (Roundline meter only)
;RING - definition variables: "W" (diameter), "LineStart" (inner radius), "LineColor" (color and alpha blending)
;ARC - definition variables: "W" (diameter), "LineStart" (inner radius), "RotationAngle" (spread angle), "StartAngle" (starting angle)
;Rainmeter draws arcs clockwise, in radians by default

