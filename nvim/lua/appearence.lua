require('onedark').setup{
  colors = {
		bg0 = "#263238",
		bg_d = "#263238",
		fg = "#eeffff",
		purple = "#c792ea",
		green = "#c3e88d",
		orange = "#f07178",
		blue = "#82aaff",
		yellow = "#ffcb6b",
		cyan = "#89ddf3",
		red = "#ff5370",
		grey = "#4f6875",
  },
  highlights = {
    ["@constructor"] = { fg = '$purple', fmt = 'none' },
    ["@type"] = { fg = '$blue' },
    ["@type.builtin"] = { fg = '$yellow' },
	["@type.builtin.go"] = { fg = '$purple' },
    ["@type.qualifier.typescript"] = { fg = '$purple' },
    ["@operator"] = { fg = '$cyan' },
    ["@string.escape"] = { fg = '$fg' },
    ["@variable"] = { fg = '$fg'},
    ["@variable.builtin"] = { fg = '$red' },
    ["@variable.parameter"] = { fg = '$fg' },
    ["@variable.member"] = { fg = '$fg' },
    ["@keyword.operator"] = { fg = '$cyan' },
    -- disabled globally in lsp on_attach cuz this shit is cursed, maybe one day it will not override other highlights
 --    ["@lsp.type.parameter"] = { fg = '$fg' },
	-- ["@lsp.type.namespace"] = { fg = '$green' },
    -- ["@lsp.typemod.variable.defaultLibrary"] = { fg = '$fg' },
    -- ["@lsp.type.enum"] = { fg = '$blue' },
    -- ["@lsp.type.interface"] = { fg = '$blue' },
    -- ["@lsp.type.typeParameter"] = { fg = '$blue' },
    -- ["@lsp.type.enumMember"] = { fg = '$fg' },
    -- ["@lsp.type.property"] = { fg = '$fg'},
    -- ["@lsp.type.class.typescript"] = { fg = '$blue' },

    ["@punctuation.delimiter"] = { fg = '$cyan' },
    ["@punctuation.bracket"] = { fg = '$cyan' },
    ["@punctuation.special"] = { fg = '$cyan' },

    ["@class.name"] = { fg = '$yellow' },
    ["@constructor.call"] = { fg = '$blue' },
    ["@decorator.args"] = { fg = '$fg' },
    ["@import"] = { fg = '$fg' },
    ["@property.source"] = { fg = '$fg' },
    ["@property.value"] = { fg = '$blue' }
  },
  diagnostics = {
    background = true,
  },
}
vim.cmd("colorscheme onedark")
