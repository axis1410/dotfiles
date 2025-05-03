return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local frappe_data = {
			doctypes = {},
			fields = {},
			methods = {},
		}

		local frappe_file_patterns = {
			"*.py",
			"*.js",
			"*.html",
			"*.json",
		}

		local frappe_extensions = { "py", "js", "html", "json" }

		local function scan_frappe_project()
			local root_dir = vim.fn.getcwd()

			local is_frappe_project = vim.fn.filereadable(root_dir .. "/apps/frappe") == 1
			if not is_frappe_project then
				is_frappe_project = vim.fn.glob(root_dir .. "/**/doctype") ~= ""
			end

			if not is_frappe_project then
				return
			end

			vim.notify("Scanning Frappe project for doctypes...", vim.log.levels.INFO)

			frappe_data.doctypes = {
				"DocType",
				"DocField",
				"DocPerms",
				"User",
				"Role",
				"Report",
				"Custom Field",
				"Property Setter",
				"Custom Script",
				"Client Script",
				"Server Script",
				"Web Page",
				"Web Form",
				"Web Template",
			}

			frappe_data.fields = {

				"Data",
				"Link",
				"Select",
				"Table",
				"Text",
				"Text Editor",
				"Code",
				"Int",
				"Float",
				"Currency",
				"Percent",
				"Check",
				"Date",
				"Time",
				"Datetime",
				"Image",
				"Attach",
				"Attach Image",
				"Signature",
				"Color",
				"Geolocation",
				"Barcode",
				"Button",
				"HTML",
				"Markdown",
				"Password",
				"Rating",
				"Read Only",
				"Heading",
				"Column Break",
				"Section Break",
				"Tab Break",
				"Table MultiSelect",
				"Small Text",
				"Long Text",
				"JSON",
				"Duration",
			}

			frappe_data.methods = {

				"validate",
				"before_save",
				"after_save",
				"before_submit",
				"on_submit",
				"on_cancel",
				"on_update",
				"before_update_after_submit",
				"on_update_after_submit",
				"before_insert",
				"after_insert",
				"before_rename",
				"after_rename",
				"on_trash",
				"after_delete",
				"before_print",
				"before_import",
				"after_import",

				"get_list",
				"get_value",
				"get_single_value",
				"get_cached_value",
				"exists",
				"get_doc",
				"new_doc",
				"delete_doc",
				"rename_doc",
				"set_value",
				"get_meta",
				"get_doc_before_save",
				"throw",
				"msgprint",
			}

			vim.notify(
				"Loaded "
					.. #frappe_data.doctypes
					.. " doctypes, "
					.. #frappe_data.fields
					.. " field types, and "
					.. #frappe_data.methods
					.. " common methods.",
				vim.log.levels.INFO
			)
		end

		local function on_new_config(config, root_dir)
			config.on_attach = function(client, bufnr)
				if
					client.name == "pyright"
					or client.name == "pylsp"
					or client.name == "tsserver"
					or client.name == "html"
				then
					local buf_name = vim.api.nvim_buf_get_name(bufnr)
					local ext = buf_name:match("%.([^%.]+)$")

					if vim.tbl_contains(frappe_extensions, ext) then
						vim.api.nvim_create_autocmd("CompleteDone", {
							buffer = bufnr,
							callback = function(args)
								local completed_item = vim.v.completed_item
								if not completed_item or not completed_item.word then
									return
								end
							end,
						})
					end
				end
			end

			return config
		end

		local function frappeLspCompletionHandler(err, result, ctx, config)
			if err or not result then
				return vim.lsp.handlers.completion(err, result, ctx, config)
			end

			local bufnr = ctx.bufnr
			local cursor_pos = vim.api.nvim_win_get_cursor(0)
			local line = vim.api.nvim_buf_get_lines(bufnr, cursor_pos[1] - 1, cursor_pos[1], false)[1]
			local line_to_cursor = line:sub(1, cursor_pos[2])

			local is_doctype_context = line_to_cursor:match("doctype%s*=%s*['\"]?([%w_]*)$")
			local is_field_context = line_to_cursor:match("fieldtype%s*=%s*['\"]?([%w_]*)$")
			local is_method_context = line_to_cursor:match("def%s+([%w_]*)$") or line_to_cursor:match("self%.([%w_]*)$")

			if is_doctype_context then
				for _, doctype in ipairs(frappe_data.doctypes) do
					table.insert(result.items, {
						label = doctype,
						kind = vim.lsp.protocol.CompletionItemKind.Class,
						detail = "Frappe DocType",
						documentation = { kind = "markdown", value = "Frappe DocType: " .. doctype },
					})
				end
			elseif is_field_context then
				for _, field in ipairs(frappe_data.fields) do
					table.insert(result.items, {
						label = field,
						kind = vim.lsp.protocol.CompletionItemKind.Field,
						detail = "Frappe Field Type",
						documentation = { kind = "markdown", value = "Frappe Field Type: " .. field },
					})
				end
			elseif is_method_context then
				for _, method in ipairs(frappe_data.methods) do
					table.insert(result.items, {
						label = method,
						kind = vim.lsp.protocol.CompletionItemKind.Method,
						detail = "Frappe Method",
						documentation = { kind = "markdown", value = "Frappe Method: " .. method },
					})
				end
			end

			return vim.lsp.handlers.completion(err, result, ctx, config)
		end

		vim.api.nvim_create_autocmd("BufReadPost", {
			pattern = frappe_file_patterns,
			callback = function(args)
				local buf_name = vim.api.nvim_buf_get_name(args.buf)
				scan_frappe_project()
			end,
		})

		vim.lsp.handlers["textDocument/completion"] = frappeLspCompletionHandler

		require("lspconfig").util.on_setup = on_new_config

		vim.notify("Frappe LSP enhancer ready", vim.log.levels.INFO)
	end,
}
