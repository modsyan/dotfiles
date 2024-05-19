return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "cmake",
        "cpp",
        "fish",
        "css",
        "gitignore",
        "go",
        "graphql",
        "http",
        "java",
        "php",
        "sql",
        "c_sharp",
        "rust",
        "scss",
        "svelte",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- MDX
      vim.filetype.add({ extension = { mdx = "mdx" } })
    end,
  },
}
