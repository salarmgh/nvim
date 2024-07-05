return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        ansible = { 'ansible_lint', 'codespell' },
        lua = { 'codespell' },
        python = { 'flake8', 'pylint', 'codespell' },
        javascript = { 'eslint_d', 'codespell' },
        typescript = { 'eslint_d', 'codespell' },
        typescriptreact = { 'eslint_d', 'codespell' },
        javascriptreact = { 'eslint_d', 'codespell' },
        go = { 'golangcilint', 'codespell' },
        json = { 'jsonlint', 'codespell' },
        sh = { 'shellcheck', 'codespell' },
        yaml = { 'yamllint', 'codespell' },
        tf = { 'codespell' },
        html = { 'htmlhint', 'codespell' },
        markdown = { 'markdownlint', 'codespell' },
        php = { 'phpcs', 'codespell' },
        css = { 'stylelint', 'codespell' },
        sql = { 'sqlfluff', 'codespell' },
        terrafform = { 'tflint', 'codespell' },
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
