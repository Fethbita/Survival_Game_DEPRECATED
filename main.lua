display.setStatusBar( display.HiddenStatusBar )

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