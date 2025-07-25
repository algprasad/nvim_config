return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      stages = "fade_in_slide_out",
      background_colour = "#000000",
      timeout = 3000,
      max_width = 50,
      max_height = 10,
      render = "default",
      top_down = true,
    })
  end,
} 