return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        ansible = { 'ansible_lint' },
        lua = { 'codespell' },
        python = { 'flake8' },
        javascript = { 'eslint_d' },
        typescript = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        go = { 'golangcilint' },
        json = { 'jsonlint' },
        sh = { 'shellcheck' },
        yaml = { 'yamllint' },
        tf = { 'codespell' },
        html = { 'htmlhint' },
        markdown = { 'markdownlint' },
        php = { 'phpcs' },
        css = { 'stylelint' },
        sql = { 'sqlfluff' },
        terrafform = { 'tflint' },
      }

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}
