return {
  "mrcjkb/rustaceanvim",
  version = "^6", -- Recommended
  lazy = false, -- This plugin is already lazy
  init = function()
    vim.g.rustaceanvim = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            checkOnSave = true,
            cargo = {
              allTargets = false,
              targetDir = "target/rust-analyzer",
            },
            check = {
              command = "clippy",
              workspace = false,
            },
            rustfmt = {
              extraArgs = { "+nightly" },
            },
            cachePriming = {
              enable = true,
              numThreads = 8
            },
            -- Faster file watching
            files = {
              excludeDirs = {
                ".git",
                "target",
                "node_modules",
                ".direnv",
              },
              watcher = "server", -- or "client" depending on what's faster for you
            },
          },
        },
      },
    }
  end,
}

