return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("ibl").setup({
      indent = {
        char = "", -- Empty character to disable indent lines
      },
      scope = {
        enabled = false, -- Disable scope highlighting
      },
    })
  end,
} 