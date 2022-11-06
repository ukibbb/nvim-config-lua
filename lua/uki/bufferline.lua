local status_ok, bufferline = pcall(require, "bufferline")
if (not status_ok) then return end


bufferline.setup({
    options = {
	indicator = {
	    icon = "▎", -- this should be omitted if indicator style is not 'icon'
	    style = "icon",
	},
	buffer_close_icon = "",
	modified_icon = "●",
	close_icon = "",
	left_trunc_marker = "",
	right_trunc_marker = "",
	separator_style = "bar",
    }
})
