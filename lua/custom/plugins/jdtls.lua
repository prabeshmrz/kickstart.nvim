return {
  {
    "mfussenegger/nvim-jdtls",

    dependencies = {
      'mfussenegger/nvim-dap',
    },

    ft = { "java" },

    config = function()
      local mason = vim.fn.stdpath("data") .. "/mason"
      local jdtls_path = mason .. "/packages/jdtls"
      local lombok_jar = mason .. "/packages/jdtls/lombok.jar"

      -- Workspace per project
      local workspace = vim.fn.expand("~/.local/share/eclipse/")
          .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

      -- Load Java debug + test
      local bundles = {}

      -- Java Debug Adapter
      local java_debug = mason .. "/packages/java-debug-adapter"
      vim.list_extend(bundles, vim.split(
        vim.fn.glob(java_debug .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"),
        "\n"
      ))

      -- Java Test
      local java_test = mason .. "/packages/java-test"
      vim.list_extend(bundles, vim.split(
        vim.fn.glob(java_test .. "/extension/server/*.jar"),
        "\n"
      ))

      local config = {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.level=ALL",
          "-Xms1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens", "java.base/java.util=ALL-UNNAMED",
          "--add-opens", "java.base/java.lang=ALL-UNNAMED",

          -- ✅ Lombok support
          "-javaagent:" .. lombok_jar,

          -- JDTLS launcher
          "-jar", vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
          "-configuration", jdtls_path .. "/config_linux",
          "-data", workspace,
        },

        init_options = {
          bundles = bundles,
        },

        on_attach = function(client, bufnr)
          -- DAP Setup
          local dap = require("dap")
          -- Enable Hot Reload
          require("jdtls").setup_dap({ hotcodereplace = "auto" })

          -- Ensure dap.configurations.java exists
          dap.configurations.java = dap.configurations.java or {}

          -- Inject Java main-class debug configs
          require("jdtls.dap").setup_dap_main_class_configs()
        end
      }

      require("jdtls").start_or_attach(config)
    end
  },

}
