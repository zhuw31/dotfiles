local comment_status_ok, comment = pcall(require, 'Comment')
if not comment_status_ok then
  return
end

local comment_utils_status_ok, comment_utils = pcall(require, 'Comment.utils')
if not comment_utils_status_ok then
  return
end

comment.setup {
  pre_hook = function(ctx)
    local location = nil
    if ctx.ctype == comment_utils.ctype.block then
      location = require('ts_context_commentstring.utils').get_cursor_location()
    elseif ctx.cmotion == comment_utils.cmotion.v or ctx.cmotion == comment_utils.cmotion.V then
      location = require('ts_context_commentstring.utils').get_visual_start_location()
    end

    return require('ts_context_commentstring.internal').calculate_commentstring {
      key = ctx.ctype == comment_utils.ctype.line and '__default' or '__multiline',
      location = location,
    }
  end,
}
