local status_ok, nvimtree = pcall(require, "nvim-tree")
if (not status_ok) then return end


nvimtree.setup({
    update_focused_file = {
	enable = true,
	update_cwd = true
    },
    sort_by = "case_sensitive",
    git = {
	enable = true
    },
    renderer = {
	highlight_git = true,
	icons = {
	    show = {
		git = true
	    }
	}
    },
    diagnostics = {
	enable = true,
	show_on_dirs = true
    },
})
