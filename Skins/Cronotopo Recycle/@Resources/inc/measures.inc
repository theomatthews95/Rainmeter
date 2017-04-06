
;measures.inc

[LangEnum]
Measure=String
String=#LANG#
Substitute="en":"0","it":"1"

[SetRingColour]
Measure=Calc
Formula=MeasureRecycle
IfAboveValue=0
IfAboveAction=[!SetVariable RINGCOL #COLOR-B#][!EnableMeasure PhaseChange][!Redraw]
IfBelowValue=1
IfBelowAction=[!SetVariable RINGCOL #COLOR-A#][!DisableMeasure PhaseChange][!Redraw]

[MeasureRecycle]
Measure=Plugin
Plugin=RecycleManager
RecycleType=Count

[SetBarLimit]
Measure=Plugin
Plugin=RecycleManager
RecycleType=Count
IfAboveValue=89
IfAboveAction=[!SetVariable BARMAX 1][!Redraw]
IfBelowValue=90
IfBelowAction=[!SetVariable BARMAX 0][!Redraw]

[MeasureRecycleSize]
Measure=Plugin
Plugin=RecycleManager
RecycleType=Size

[PhaseChange]
Measure=Calc
Formula=((0.1*0.13*Counter)%2 * #ANIMATION#)
Disabled=(#ANIMATION#+1)%2
Group=Animation

[BarLength0]
Measure=Calc
Formula=0.01*MeasureRecycle

[BarLength1]
Measure=Calc
Formula=0.9

[SetRingColour]
Measure=Calc
Formula=MeasureRecycle
IfAboveValue=0
IfAboveAction=[!SetVariable RINGCOL #COLOR-B#][!EnableMeasure AnimationEngine][!Redraw]
IfBelowValue=1
IfBelowAction=[!SetVariable RINGCOL #COLOR-A#][!DisableMeasure AnimationEngine][!Redraw]