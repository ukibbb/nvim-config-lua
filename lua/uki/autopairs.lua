local status_ok, npairs = pcall(require, "nvim-autopairs")
if (not status_ok) then return end


npairs.setup({ 
    check_ts = true
})

local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if (not cmp_autopairs_setup) then return end

local cmp_setup, cmp = pcall(require, "cmp")
if (not cmp_setup) then return end

-- make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
