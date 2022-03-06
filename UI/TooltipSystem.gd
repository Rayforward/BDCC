extends Node

onready var tooltip = $CanvasLayer/TooltipDisplay

var tooltipS = 0

func showTooltip(title: String, text: String):
	tooltip.set_is_active(true)
	tooltip.set_text(title, text)
	tooltipS += 1

func hideTooltip():
	tooltipS -= 1
	if(tooltipS <= 0):
		tooltipS = 0
		tooltip.set_is_active(false)
