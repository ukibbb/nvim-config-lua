local status_ok, telescope = pcall(require, "telescope")
if (not status_ok) then return end

telescope.setup({
    defaults = {
	layout_config = {
	    vertical = { width = 0.5 }
	}
    },
    pickers = {
	find_files = {
	    theme = "dropdown"
	}
    },
    
})
