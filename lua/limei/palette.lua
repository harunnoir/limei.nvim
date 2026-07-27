local M = {}

local defaults = {
  -- Backgrounds
  bg_deep = "#08090a",
  bg_inactive = "#0c0d0e",
  bg = "#101112",
  bg_alt = "#141516",
  bg_cursorline = "#161719",
  bg_surface = "#18191b",
  bg_elevated = "#1d1e21",
  bg_overlay = "#232428",
  bg_selection = "#2b2c30",
  bg_active = "#303136",
  bg_popup = "#141516",

  -- Soft-light foreground hierarchy
  fg_highest = "#d2cdc4",
  fg_bright = "#c5c0b7",
  pearl = "#c1bbb1",
  ivory = "#bbb5aa",
  silver = "#b4b6b3",

  -- Primary and secondary foregrounds
  fg = "#b2afa9",
  fg_soft = "#9c9993",
  fg_dim = "#85827d",
  fg_muted = "#686560",
  fg_subtle = "#56534f",
  fg_hidden = "#3d3b38",

  -- Warm spectrum
  rose = "#a8797d",
  brick = "#a57b74",
  coral = "#a77f72",
  clay = "#a08472",
  copper = "#a68767",
  amber = "#a28e67",
  sand = "#9d936d",

  -- Green and earth spectrum
  olive = "#8b916c",
  fern = "#849276",
  moss = "#7f9278",
  sage = "#80947f",
  mint = "#7d9386",

  -- Cool spectrum
  teal = "#79918e",
  cyan = "#7e9096",
  sky = "#7e8e9a",
  blue = "#7e899b",
  indigo = "#88859b",

  -- Purple and red-purple spectrum
  lavender = "#91839a",
  violet = "#968196",
  magenta = "#9a8290",
  plum = "#967d87",

  -- UI neutrals
  border = "#36383a",
  border_focus = "#4a4b4e",
  separator = "#27282b",
  whitespace = "#343537",
  indent = "#27282a",
  indent_scope = "#4d4b47",
  scrollbar = "#46474a",
  scrollbar_track = "#252629",
}

function M.get(overrides)
  return vim.tbl_extend("force", vim.deepcopy(defaults), overrides or {})
end

return M
