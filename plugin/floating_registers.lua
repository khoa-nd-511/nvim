--[[
  This script creates a toggleable floating window to display the
  output of the :registers command.
]]

-- A variable to hold the window ID of our floating window.
-- It's scoped to this file and will be nil when the window is closed.
local float_win_id = nil

--[[
  A function to toggle a centered floating window that displays
  the output of the :registers command.
]]
function ToggleRegistersFloat()
	-- Check if the window ID is valid (i.e., the window is currently open).
	if float_win_id and vim.api.nvim_win_is_valid(float_win_id) then
		-- If the window is open, we close it.
		-- The 'true' argument forces the window to close.
		vim.api.nvim_win_close(float_win_id, true)
		-- Reset our state variable to indicate the window is closed.
		float_win_id = nil
	else
		-- If the window is not open, we create it.

		-- Execute the :registers command and capture its output as a string.
		local registers_output = vim.fn.execute(":registers")
		-- Split the output string into a table of lines.
		local lines = vim.split(registers_output, "\n")

		-- Create a new scratch buffer that won't be listed.
		local buf = vim.api.nvim_create_buf(false, true)

		-- Set the content of the buffer to be the captured register output.
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

		-- Make the buffer read-only.
		vim.bo[buf].modifiable = false

		-- Calculate window dimensions and position.
		local width = math.floor(vim.o.columns * 0.8)
		local height = math.floor(vim.o.lines * 0.8)
		local col = math.floor((vim.o.columns - width) / 2)
		local row = math.floor((vim.o.lines - height) / 2)

		-- Define the configuration options for the floating window.
		local opts = {
			relative = "editor",
			width = width,
			height = height,
			col = col,
			row = row,
			style = "minimal",
			border = "rounded",
		}

		-- Open the floating window and, crucially, store its ID in our state variable.
		-- The 'false' argument for `enter` means focus will not switch to the new window.
		float_win_id = vim.api.nvim_open_win(buf, false, opts)
	end
end

-- Map <leader>rr to the toggle function in normal mode.
-- `silent = true` prevents the command from being echoed in the command line.
vim.keymap.set("n", "<leader>rr", ToggleRegistersFloat, {
	noremap = true,
	silent = true,
	desc = "Toggle floating window with registers",
})
