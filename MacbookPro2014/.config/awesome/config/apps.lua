local _M = {
   terminal = os.getenv('TERMINAL') or 'xterm',
   editor   = os.getenv('EDITOR')   or 'vim',
}

_M.editor_cmd = _M.terminal .. ' -e ' .. _M.editor
_M.manual_cmd = _M.terminal .. ' -e man awesome'

return _M
