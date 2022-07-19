-- teach.nvim - a poor man's companion shell-like-program that can be used as a teaching tool

local M = {}
local activeWindows = {}

-- Split input text by newlines akin to Python's splitlines()
local splitlines = function(text) 
    lines = {} 
    for line in text:gmatch("[^\r\n]+") do 
        table.insert(lines, line)
    end
    return lines
end

-- Return maximum from a table of integers
local max = function(t)
    local max = 0
    for  _, value in pairs(t) do 
        if value > max then 
            max = value
        end
    end
    return max
end

local calculateWindowDimensions = function(lines)
    local lineLengths = {}
    for _, line in pairs(lines) do 
        table.insert(lineLengths, #line)
    end
    local maxWidth = max(lineLengths)
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
        buf, false, {relative='cursor', row=0, col=0, width=width, height=height,  style='minimal'})

    -- It'd be nice if the window could be closed
    vim.keymap.set({'n', 'v'}, '<leader>e',
        function()
            vim.api.nvim_win_close(win, true)
            activeWindows[win] = nil
        end 
    )

    -- We want to be able to close all the windows, so some bookkeeping
    activeWindows[win] = true
end

M.closeAllTeachWindows = function() 
    for win, _ in pairs(activeWindows) do
        vim.api.nvim_win_close(win, true)
    end
end

return M
