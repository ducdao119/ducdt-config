return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = { "lua_ls", "ruby_lsp" },
            }
        end,
    },

    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            -- Function để lấy Ruby LSP command với bundle support
            local function get_ruby_lsp_cmd()
                if vim.fn.filereadable("Gemfile") == 1 then
                    return { "bundle", "exec", "ruby-lsp" }
                else
                    return { "ruby-lsp" }
                end
            end

            -- Function an toàn để goto definition (tránh lỗi no write)
            local function safe_goto_definition()
                if vim.bo.modified then
                    vim.cmd('write')
                end
                vim.lsp.buf.definition()
            end

            -- Lua LS
            vim.lsp.config['lua_ls'] = {
                cmd = { "lua-language-server" },
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            }

            -- Ruby LSP
            vim.lsp.config['ruby_lsp'] = {
                cmd = get_ruby_lsp_cmd(),
                capabilities = capabilities,
                init_options = {
                    formatter = "none"
                },
            }

            -- Các LSP servers khác
            local servers = {
                'eslint',
                'yamlls',
                'bashls',
                'svelte',
                'omnisharp',
                'solargraph',
                'docker_compose_language_service'
            }

            for _, server in ipairs(servers) do
                vim.lsp.config[server] = {
                    capabilities = capabilities,
                }
            end

            -- Protocol buffer
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "proto",
                callback = function()
                    vim.lsp.config['buf_language_server'] = {
                        capabilities = capabilities,
                    }
                    vim.lsp.enable('buf_language_server')
                end,
            })

            -- Kích hoạt tất cả LSP servers
            vim.lsp.enable({
                'lua_ls',
                'eslint',
                'yamlls',
                'bashls',
                "ruby_lsp",
                "svelte",
                "omnisharp",
                "solargraph",
                "docker_compose_language_service"
            })

            -- LSP keymap setting
            -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
            -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
            -- vim.keymap.set("n", "gd", safe_goto_definition, { desc = "Go to definition" })
            -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
            -- vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
            -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
            -- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
        end,
    },
}
