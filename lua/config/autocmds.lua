-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- local cmp = require("cmp")
--
-- -- Turn off paste mode when leaving insert
-- vim.api.nvim_create_autocmd("InsertLeave", {
--   pattern = "*",
--   command = "set nopaste",
-- })

-- `/` cmdline setup.
-- cmp.setup.cmdline("/", {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = "buffer" },
--   },
-- })
--
-- `:` cmdline setup.
-- cmp.setup.cmdline(":", {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = "path" },
--   }, {
--     {
--       name = "cmdline",
--       option = {
--         ignore_cmds = { "Man", "!" },
--       },
--     },
--   }),
-- })
