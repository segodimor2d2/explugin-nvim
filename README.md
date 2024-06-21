# Example my first plugin for Nvim and Lazy

https://github.com/segodimor2d2/explugin-nvim

## Instalação

"segodimor2d2/explugin-nvim"

### Adicione um arquivo .lua em .config/nvim/lua/plugins/qualquerNome.lua qualquer 

leader-l para executar Lazy
leader-i para instalar o plugin

'''
return {
  "segodimor2d2/explugin-nvim",
  config = true,
}
'''

### rodando o plugin:

:lua require("qualquerNome").test()

ou use o keymap

leader-pk


### detalhes do codigo:

Eu fiz uma estrutura bem simples assim:

├── lua
│   └── explugin-nvim
│       └── init.lua
└── README.md

o código do init.lua é o seguinte:

'''
local M = {}

M.fntest = function()
	print("test my first plugin !!")
end

M.setup = function()
	vim.keymap.set("n", "<leader>pk", function()
		M.fntest()
	end, { desc = "EX-Plugin-Nvim" })
end

return M

'''

