-- ==========================
-- CONFIGURACIÓN DE NEOVIM EN TERMUX
-- ==========================

-- ========== APARIENCIA ==========
vim.opt.number = true                -- Mostrar números de línea
vim.opt.relativenumber = true         -- Números relativos para moverte rápido
vim.opt.cursorline = true             -- Resaltar la línea del cursor
vim.opt.termguicolors = true          -- Soporte de colores
vim.opt.background = "dark"           -- Fondo oscuro

-- ========== EDICIÓN ==========
vim.opt.expandtab = true              -- Convertir tabs en espacios
vim.opt.tabstop = 2                   -- Tamaño de las tabs (para espacios)
vim.opt.softtabstop = 2               -- Número de espacios al presionar TAB
vim.opt.shiftwidth = 2                -- Tamaño de indentación
vim.opt.autoindent = true             -- Mantener la indentación previa
vim.opt.smartindent = true            -- Indentar inteligentemente
vim.opt.wrap = true                   -- Ajustar texto en pantalla
vim.opt.clipboard = "unnamedplus"      -- Usar portapapeles del sistema en Termux
vim.opt.mouse = "a"                   -- Habilitar uso del ratón

-- ========== INICIAR Lazy.nvim ==========
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Cargar Plugins
require("plugins")

-- Configurar Lazy.nvim
require("lazy").setup("plugins", {
  install = { colorscheme = { "dracula" } },
  checker = { enabled = true },
})

-- Activar tema Dracula
vim.cmd("colorscheme dracula")

-- ========== ATAJOS ==========
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })   -- Guardar con Ctrl+S
vim.api.nvim_set_keymap("n", "<C-q>", ":q<CR>", { noremap = true, silent = true })   -- Salir con Ctrl+Q
vim.api.nvim_set_keymap("n", "<F5>", ":w<CR>:!python3 %<CR>", { noremap = true, silent = true }) -- Ejecutar script Python con F5

vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })  -- Buscar archivos  
vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope live_grep<CR>", { noremap = true, silent = true })   -- Buscar texto  
vim.api.nvim_set_keymap("n", "<C-b>", ":Telescope buffers<CR>", { noremap = true, silent = true })     -- Ver buffers abiertos  

-- Mapeo para abrir/cerrar Neo-tree con F2
vim.api.nvim_set_keymap("n", "<C-t>", ":Neotree toggle<CR>", { noremap = true, silent = true })

vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
    name = "termux",
    copy = {
        ["+"] = "termux-clipboard-set",
        ["*"] = "termux-clipboard-set",
    },
    paste = {
        ["+"] = "termux-clipboard-get",
        ["*"] = "termux-clipboard-get",
    },
    cache_enabled = 0,
}

