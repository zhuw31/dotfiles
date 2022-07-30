local ok, comment = pcall(require, 'Comment')
local ok_ts = pcall(require, 'ts_context_commentstring')
if not ok or not ok_ts then
  return
end

local ts_utils = require 'ts_context_commentstring.utils'
local ts_internals = require 'ts_context_commentstring.internal'
local comment_utils = require 'Comment.utils'

comment.setup {
  pre_hook = function(ctx)
    local location = nil
    if ctx.ctype == comment_utils.ctype.block then
      location = ts_utils.get_cursor_location()
    elseif ctx.cmotion == comment_utils.cmotion.v or ctx.cmotion == comment_utils.cmotion.V then
      location = ts_utils.get_visual_start_location()
    end

    return ts_internals.calculate_commentstring {
      key = ctx.ctype == comment_utils.ctype.line and '__default' or '__multiline',
      location = location,
    }
  end,
}
