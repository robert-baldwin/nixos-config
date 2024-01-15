{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withRuby = true;
    extraPackages = with pkgs; [
      unzip
      cargo
      rustc
      elixir
      gcc
      gnumake
    ];
    plugins = with pkgs.vimPlugins; [
      alpha-nvim
      barbecue-nvim
      lualine-nvim
      rose-pine
      harpoon
      undotree
      neogit
      telescope-nvim
      lsp-zero-nvim
      mason-nvim
      mason-lspconfig-nvim
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      luasnip
      (nvim-treesitter.withPlugins (p: with p; [
        nix
        vim
        vimdoc
        lua
        javascript
        typescript
        ruby
        python
        elixir
        rust
        html
        css
        json
        dockerfile
        bash
        erlang
        markdown
        sql
        yuck
      ]))
    ];
    extraLuaConfig = ''
      -- set.lua
      vim.opt.nu = true
      vim.opt.relativenumber = true

      vim.opt.tabstop = 4
      vim.opt.softtabstop = 4
      vim.opt.shiftwidth = 4
      vim.opt.expandtab = true

      vim.opt.smartindent = true

      vim.opt.wrap = false

      vim.opt.swapfile = false
      vim.opt.backup = false
      vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
      vim.opt.undofile = true

      vim.opt.hlsearch = false
      vim.opt.incsearch = true

      vim.opt.termguicolors = true

      vim.opt.scrolloff = 8
      vim.opt.signcolumn = "yes"
      vim.opt.isfname:append("@-@")

      vim.opt.updatetime = 50
      vim.opt.colorcolumn = "80"

      -- remap.lua
      vim.g.mapleader = " "
      vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeShow)

      -- move highlighted block up/down
      vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
      vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

      vim.keymap.set("n", "J", "mzJ`z")
      vim.keymap.set("n", "<C-d>", "<C-d>zz")
      vim.keymap.set("n", "<C-u>", "<C-u>zz")
      vim.keymap.set("n", "n", "nzzzv")
      vim.keymap.set("n", "N", "Nzzzv")

      -- paste over w/o replacing buffer text
      vim.keymap.set("x", "<leader>p", "\"_dP")

      -- asbjornHaland
      vim.keymap.set("n", "<leader>y", "\"+y")
      vim.keymap.set("v", "<leader>y", "\"+y")
      vim.keymap.set("v", "<leader>y", "\"+Y")

      vim.keymap.set("n", "<leader>d", "\"_d")
      vim.keymap.set("v", "<leader>d", "\"_d")

      vim.keymap.set("n", "Q", "<nop>")

      vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
      vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
      vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
      vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

      vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
      vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

      -- neogit.lua
      local neogit = require('neogit')
      neogit.setup {}
      vim.keymap.set("n", "<leader>gs", "<cmd>Neogit kind=floating<CR>");

      -- colors.lua
   	  color = color or "rose-pine"
	  vim.cmd.colorscheme(color)

	  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

      -- harpoon.lua
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      
      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
      
      vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

      -- lsp.lua
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}
      
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      end)
      
      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {
          'nil_ls',
          'vimls',
          'lua_ls',
          'tsserver',
          'rust_analyzer',
          'elixirls',
          'pyright',
          'html',
          'cssls',
          'jsonls',
          'dockerls',
          'bashls',
          'elp',
          'marksman',
          'ruby_ls',
          'sqlls'
        },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })
      
      local cmp = require('cmp')
      local cmp_select = {behavior = cmp.SelectBehavior.Select}
      
      cmp.setup({
        sources = {
          {name = 'path'},
          {name = 'nvim_lsp'},
          {name = 'nvim_lua'},
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
      })

      -- telescope.lua
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>ps', function()
      	builtin.grep_string({ search = vim.fn.input("grep > ") });
      end)

      -- treesitter.lua
      require'nvim-treesitter.configs'.setup {
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }

      -- undotree.lua
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

      -- alpha.lua
      require'alpha'.setup(require'alpha.themes.startify'.config)

      -- barbecue.lua
      require("barbecue").setup()

      -- lualine.lua
      require('lualine').setup()
    '';
  };
}
