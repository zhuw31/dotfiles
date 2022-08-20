local ok, comment = pcall(require, 'Comment')
local ok_ts = pcall(require, 'ts_context_commentstring')
if not ok or not ok_ts then
  return
end

local comment_nvim = require 'ts_context_commentstring.integrations.comment_nvim'

comment.setup {
  pre_hook = comment_nvim.create_pre_hook(),
}
