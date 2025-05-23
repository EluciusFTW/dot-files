-- import comment plugin safely
local setup, comment = pcall(require, "Comment")
if not setup then
  return
end

-- enable comment
comment.setup()

-- gcc: comment line
-- gcb: comment block
-- gcA: commment at end of line
-- gcO: add comment line above
-- gco: add comment line below
