-- teach.nvim - a poor man's companion shell-like-program that can be used as a teaching tool
--
-- Copyright 2022, Ishaan Arora (ishaanarora1000@gmail.com)
--
-- This file is part of the software teach.nvim.
--
-- teach.nvim is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- teach.nvim is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with teach.nvim.  If not, see <http://www.gnu.org/licenses/>.
--


local M = {}
M.activeWindows = {}

-- Split input text by newlines akin to Python's splitlines()
local splitlines = function(text) 
    lines = {} 
    for line in text:gmatch("[^\r\n]+") do 
        table.insert(lines, line)
    end
    return lines
end

local calculateWindowDimensions = function(lines)
    local lineLengths = {}
    for _, line in pairs(lines) do 
        table.insert(lineLengths, #line)
    end
    local maxWidth = math.max(unpack(lineLengths))
    local numLines = #lines

    return {maxWidth, numLines}
end

M.openTeachWindow = function()
    -- Get the cursor position
    local lineNo, colNo = unpack(vim.api.nvim_win_get_cursor(0))
    colNo = colNo + 1

    local filePath = vim.api.nvim_buf_get_name(0)
    
    -- Get the text to display
    local output = vim.fn.system({'python3', filePath})
    local lines = splitlines(output)

    -- Create a buffer for holding the output
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    -- Draw a floating window and attach the buffer
    width, height = unpack(calculateWindowDimensions(lines))
    local win = vim.api.nvim_open_win(
        buf, false, {relative='cursor', row=1, col=0, width=width, height=height,  style='minimal'})
    -- TODO: add a check for QuickFixLine highlight group existence and create one if there is none
    vim.api.nvim_win_set_option(win, 'winhl', "Normal:QuickFixLine,FloatBorder:Error")

    -- We want to be able to close the windows, so some bookkeeping
    table.insert(M.activeWindows, win)
end

-- Close the last num teach windows
M.closeTeachWindows = function(num)
    for i = 1, (num or 1) do
        lastWindowIndex = #M.activeWindows

        if lastWindowIndex > 0 then
            lastWindow = M.activeWindows[lastWindowIndex]
            vim.api.nvim_win_close(lastWindow, true)
            M.activeWindows[lastWindowIndex] = nil
        end
        -- Don't bother if all windows are already closed
    end
end

M.closeAllTeachWindows = function() 
    M.closeTeachWindows(#M.activeWindows)
end

return M
