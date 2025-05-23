-- import obisdian lugin safely
local obsidian_status, obsidian = pcall(require, "obsidian")
if not obsidian_status then
  return
end

obsidian.setup({
  dir = "~/sources/my-synchronization-context/valuts/dev",
  completion = {
    nvim_cmp = false, -- if using nvim-cmp, otherwise set to false
  },
})
