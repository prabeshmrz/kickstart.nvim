return {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup {
      patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', 'mvnw', 'mvnw.cmd', 'pom.xml' },
      outputs = {
        require('projector_dbee').OutputBuilder:new(),
      },
    }
  end,
}
