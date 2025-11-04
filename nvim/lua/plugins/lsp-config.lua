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
            local lspconfig = require("lspconfig")
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
            -- lua
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
            vim.lsp.enable('lua_ls')

            vim.lsp.config['ts_ls'] = {
                capabilities = capabilities,
            }

            vim.lsp.config['eslint'] = {
                capabilities = capabilities,
            }

            vim.lsp.config['zls'] = {
                capabilities = capabilities,
            }

            vim.lsp.config['yamlls'] = {
                capabilities = capabilities,
            }

            vim.lsp.config['tailwindcss'] = {
                capabilities = capabilities,
            }

            vim.lsp.config['gopls'] = {
                capabilities = capabilities,
            }

            -- nix
            vim.lsp.config['rnix'] = {
                capabilities = capabilities,
            }

            -- protocol buffer
            vim.lsp.config['buf_ls'] = {
                capabilities = capabilities,
            }

            -- docker compose
            vim.lsp.config['docker_compose_language_service'] = {
                capabilities = capabilities,
            }

            -- cobol
            vim.lsp.config['cobol_ls'] = {
                capabilities = capabilities,
            }

            -- svelte
            vim.lsp.config['svelte'] = {
                capabilities = capabilities,
            }
            -- python
            vim.lsp.config['pyright'] = {
                capabilities = capabilities,
            }

            -- csharp
            vim.lsp.config['omnisharp'] = {
                capabilities = capabilities,
            }

            -- solargraph
            vim.lsp.config['ruby_lsp'] = {
                capabilities = capabilities,
            }
            -- bash
            vim.lsp.config['bashls'] = {
                capabilities = capabilities,
            }

            -- protocol buffer (kích hoạt riêng theo filetype)
            vim.lsp.config['buf_language_server'] = {
                capabilities = capabilities,
            }

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "proto",
                callback = function()
                    vim.lsp.enable('buf_language_server')
                end,
            })
            vim.lsp.enable({
                'ts_ls',
                'eslint',
                'zls',
                'yamlls',
                'tailwindcss',
                'gopls',
                'rnix',
                'buf_ls',
                'docker_compose_language_service',
                'cobol_ls',
                'svelte',
                'pyright',
                'bashls',
                "ruby_lsp",
                "omnisharp"
            })
            -- lsp kepmap setting
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
