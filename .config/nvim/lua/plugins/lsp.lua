return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "stylua",
      "selene",
      "luacheck",
      "shellcheck",
      "shfmt",

      "tailwindcss-language-server",
      "css-lsp",

      "typescript-language-server",
      "json-lsp",

      "csharp-language-server",
      "omnisharp",
      "csharpier",

      "docker-compose-language-service",
      "dockerfile-language-server",

      "gofumpt",
      "goimports",
      "gopls",

      "rust-analyzer",
    })
  end,
}

-- eslint-lsp
-- eslint
-- hadolint
-- helm-ls helm_ls
-- jdtls

-- lua-language-server lua_ls
-- markdownlint
-- marksman
-- netcoredbg
-- prettier
-- pyright
-- ruff-lsp ruff_lsp

-- taplo
-- terraform-ls terraformls
-- tflint
-- yaml-language-server yamlls
-- lable
-- actionlint
-- ada-language-server als
