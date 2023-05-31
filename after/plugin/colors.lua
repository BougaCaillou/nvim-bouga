
-- Set colorscheme and stuff
function ColorMyStuff(color)
	-- Default colorscheme
	color = color or 'sonokai'
	vim.cmd.colorscheme(color)
end

ColorMyStuff()
