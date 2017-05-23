display.setStatusBar(display.HiddenStatusBar)

local widget = require("widget")

_SCREEN = {
	width = display.contentWidth,
	height = display.contentHeight
}

_SCREEN.CENTER = {
	x = display.contentCenterX,
	y = display.contentCenterY
}

local image = display.newImageRect("images/background.png", 1920, 1080)
image.x = _SCREEN.CENTER.x
image.y = _SCREEN.CENTER.y

local exploreButton = widget.newButton{
	left = 150,
	top = 200,
	width = 350,
	height = 150,
	defaultFile = "exploreButton.png",
	overFile = "exploreButtonOver.png",
	label = "Explore Button",
	onEvent = handleButtonEvent
}
