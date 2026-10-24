 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = 'NONE',
    base01 = '#261d1f',
    base02 = '#312829',
    base03 = '#a18b8f',
    base04 = '#d9c1c4',
    base05 = '#efdfe0',
    base06 = '#efdfe0',
    base07 = '#efdfe0',
    base08 = '#ffb4ab',
    base09 = '#ffb95d',
    base0A = '#efb9c2',
    base0B = '#ffb1c1',
    base0C = '#ffb95d',
    base0D = '#ffb1c1',
    base0E = '#efb9c2',
    base0F = '#ffd9df',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#efdfe0',          bg = 'NONE' })
  hi('TelescopeBorder',         { fg = '#a18b8f',             bg = 'NONE' })
  hi('TelescopePromptNormal',   { fg = '#efdfe0',          bg = 'NONE' })
  hi('TelescopePromptBorder',   { fg = '#a18b8f',             bg = 'NONE' })
  hi('TelescopePromptPrefix',   { fg = '#ffb1c1',             bg = 'NONE' })
  hi('TelescopePromptCounter',  { fg = '#d9c1c4',  bg = 'NONE' })
  hi('TelescopePromptTitle',    { fg = '#191113',             bg = '#ffb1c1' })
  hi('TelescopePreviewTitle',   { fg = '#191113',             bg = '#efb9c2' })
  hi('TelescopeResultsTitle',   { fg = '#191113',             bg = '#ffb95d' })
  hi('TelescopeSelection',      { fg = '#efdfe0',          bg = '#312829' })
  hi('TelescopeSelectionCaret', { fg = '#ffb1c1',             bg = '#312829' })
  hi('TelescopeMatching',       { fg = '#ffb1c1',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
