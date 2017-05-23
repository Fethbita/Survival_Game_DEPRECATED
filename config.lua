--calculate the aspect ratio of the device:
local aspect_ratio = display.pixelHeight / display.pixelWidth

application = {
  content = {
    width = aspect_ratio > 1.5 and 320 or math.floor(480 / aspect_ratio),
    height = aspect_ratio < 1.5 and 480 or math.floor(320 * aspect_ratio),
    scale = "letterBox",
    fps = 60,
    imageSuffix = {
      ["@2x"] = 1.5,
      ["@4x"] = 3.0,
      },
    },
}
