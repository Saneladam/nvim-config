return {


  {
    "jupyter-vim/jupyter-vim",
    config = function()
      vim.g.jupyter_mapkeys = 0  -- Evita conflictos de mapeo de teclas
    end
  },


  -- Tema Dracula
  { "Mofiqul/dracula.nvim" },

  -- Treesitter para mejor sintaxis e indentación
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Explorador de archivos Neo-tree
  { 
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- Íconos para Neo-tree
      "MunifTanjim/nui.nvim"
    }
  },

  -- Barra de estado atractiva (Airline)
  { "vim-airline/vim-airline" },

  -- Buscador rápido con Telescope
  { 
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- Configuración de LSP para autocompletado
  { "neovim/nvim-lspconfig" },

  -- Autocompletado con nvim-cmp
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Snippets para autocompletado
  { "L3MON4D3/LuaSnip" },

  -- GitHub Copilot
  { "github/copilot.vim" }
}
