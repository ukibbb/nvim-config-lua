local status_ok, bufferline = pcall(require, "bufferline")
if (not status_ok) then return end


bufferline.setup({
    options = {
	show_tab_indicators = true,
	indicator = {
	    icon = "▎", -- this should be omitted if indicator style is not 'icon'
	    style = "icon",
	},
	buffer_close_icon = "",
	modified_icon = "●",
	close_icon = "",
	left_trunc_marker = "",
	right_trunc_marker = "",
	diagnostics = true,
	show_buffer_close_icons = true,
	show_buffer_icons = true,
	show_close_icons = true,
	separator_style = "bar",
	always_show_bufferline = true
    }
})
