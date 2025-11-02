return {
  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim", "ahmedkhalf/project.nvim" },
    opts = function()
      local logo = [[
██████╗ ██╗   ██╗ ██████╗██████╗ ████████╗
██╔══██╗██║   ██║██╔════╝██╔══██╗╚══██╔══╝
██║  ██║██║   ██║██║     ██║  ██║   ██║   
██║  ██║██║   ██║██║     ██║  ██║   ██║   
██████╔╝╚██████╔╝╚██████╗██████╔╝   ██║   
╚═════╝  ╚═════╝  ╚═════╝╚═════╝    ╚═╝   
]]
      logo = string.rep("\n", 6) .. logo .. "\n\n"

     local opts = {
  theme = "doom",
  hide = { statusline = false },
  config = {
    header = vim.split(logo, "\n"),
    center = {
      {
        icon = " ",
        desc = " Find File",
        key = "f",
        action = "Telescope find_files",
      },
      {
        icon = " ",
        desc = " New File",
        key = "n",
        action = "ene | startinsert",
      },
      {
        icon = " ",
        desc = " Recent Files",
        key = "r",
        action = "Telescope oldfiles",
      },
      {
        icon = " ",
        desc = " Find Text",
        key = "g",
        action = "Telescope live_grep",
      },
      {
        icon = " ",
        desc = " Config",
        key = "c",
        action = "Telescope find_files cwd=~/.config/nvim",
      },
      {
        icon = " ",
        desc = " Restore Session",
        key = "s",
        action = "lua require('persistence').load()",
      },
      {
        icon = "󰒲 ",
        desc = " Lazy",
        key = "l",
        action = "Lazy",
      },
      {
        icon = " ",
        desc = " Quit",
        key = "q",
        action = "qa",
      },
    },
    footer = function()
      local stats = require("lazy").stats()
      local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
      return {
        "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
      }
    end,
  },
      }

      -- reopen dashboard when closing Lazy
      if vim.o.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end)
          end,
        })
      end

      return opts
    end,
  },

  -- Project.nvim để lưu danh sách project gần đây
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern" },
        patterns = { ".git", "Makefile", "package.json", "pyproject.toml", "README.md" },
      })
      require("telescope").load_extension("projects")
    end,
  },
}

