return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  keys = {
    {
      "<leader><space>",
      function()
        Snacks.picker.smart({
          win = {
            input = {
              keys = {
                ["I"] = "toggle_ignored",
                ["H"] = "toggle_hidden",
              },
            },
            list = {
              keys = {
                ["I"] = "toggle_ignored",
                ["H"] = "toggle_hidden",
              },
            },
          },
        })
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>ge",
      function()
        local root = Snacks.git.get_root()
        if not root then
          Snacks.notify("Not in a git repository", "warn")
          return
        end
        Snacks.explorer({
          cwd = root,
          finder = "git_status",
          format = "git_status",
          preview = "git_status",
          tree = true,
          git_status = true,
          git_status_open = true,
          diagnostics = false,
          follow_file = false,
          focus = "list",
          auto_close = false,
          jump = { close = false },
          layout = { preset = "sidebar", preview = "main" },
          matcher = { sort_empty = false, fuzzy = false },
          win = {
            list = {
              keys = {
                ["<BS>"] = "explorer_up",
                ["l"] = "confirm",
                ["h"] = "explorer_close",
                ["a"] = "explorer_add",
                ["d"] = "explorer_del",
                ["r"] = "explorer_rename",
                ["c"] = "explorer_copy",
                ["m"] = "explorer_move",
                ["o"] = "explorer_open",
                ["P"] = "toggle_preview",
                ["y"] = { "explorer_yank", mode = { "n", "x" } },
                ["p"] = "explorer_paste",
                ["u"] = "explorer_update",
                ["<c-c>"] = "tcd",
                ["<leader>/"] = "picker_grep",
                ["<c-t>"] = "terminal",
                ["."] = "explorer_focus",
                ["I"] = "toggle_ignored",
                ["H"] = "toggle_hidden",
                ["Z"] = "explorer_close_all",
                ["]g"] = "explorer_git_next",
                ["[g"] = "explorer_git_prev",
              },
            },
          },
        })
      end,
      desc = "Git Explorer (Changed Files Only)",
    },
    {
      "<leader>>",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
    {
      "<leader>;",
      function()
        Snacks.picker.resume()
      end,
      { desc = "Resume" },
    },
    {
      "<leader>v",
      function()
        Snacks.picker.cliphist()
      end,
      { desc = "Clipboard History" },
    },
    {
      "<leader>gc",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Git Branches",
    },
  },

  ---@type snacks.Config
  opts = {
    dashboard = {
      sections = {
        {
          icon = " ",
          desc = "Browse Repo",
          padding = 1,
          key = "B",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              title = "Open Issues",
              cmd = "gh issue list -L 3 | cat",
              key = "i",
              action = function()
                vim.fn.jobstart("gh issue list --web", { detach = true })
              end,
              icon = " ",
              height = 4,
            },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "gh pr list -L 3 | cat",
              key = "p",
              action = function()
                vim.fn.jobstart("gh pr list --web", { detach = true })
              end,
              height = 4,
            },
            {
              icon = " ",
              title = "Git Branches",
              cmd = "echo 'Local Branch' && git branch  --color=always --format='%(color:yellow)%(refname:short)%(color:reset) %(upstream:short)%(color:green) %(committerdate:relative)%(color:reset)' && echo '\nRemote Branches' && git branch -a -r --abbrev=7 --color=always --format='%(color:yellow)%(refname:short)%(color:reset) %(upstream:short)%(color:green) %(committerdate:relative)%(color:reset)'",
              key = "b",
              action = function()
                Snacks.lazygit({ cwd = LazyVim.root.git(), args = { "branch" } })
              end,
              height = 10,
            },
            {
              icon = " ",
              title = "Git Status",
              cmd = "git --no-pager diff --stat -B -M -C",
              key = "s",
              action = function()
                Snacks.lazygit({ cwd = LazyVim.root.git() })
              end,
              height = 10,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        { section = "startup" },
      },
    },
    scroll = { enabled = true },
    scratch = {
      ft = function()
        return "markdown"
      end,
    },
    filekey = {
      branch = false,
      count = false,
      ft = false,
      cwd = false,
    },
    styles = {
      scratch = {
        position = "right",
        relative = "editor",
        height = 0.4,
        width = 0.4,
      },
    },
  },
}
