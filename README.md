# Example my first plugin for Nvim and Lazy

https://github.com/segodimor2d2/explugin-nvim

## Instalação

"segodimor2d2/explugin-nvim"

### Adicione um arquivo .lua em .config/nvim/lua/plugins/qualquerNome.lua qualquer 

leader-l para executar Lazy

leader-i para instalar o plugin

return {
```lua
  "segodimor2d2/explugin-nvim",
  config = true,
}
```

### Rodando o plugin:

:lua require("qualquerNome").test()

ou use o keymap

leader-pk

o resultado vai ser "test my first plugin !!" uma Notification que vai aparecer na tela como um popup ou pode ver executando:

:Notification


### Detalhes do codigo:

Eu fiz uma estrutura bem simples assim e a pasta pode ficar em qualquer path que vc preferir:

```lua
explugin-nvim
├── lua
│   └── explugin-nvim
│       └── init.lua
└── README.md
```

o código do init.lua é o seguinte:

```lua
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
}
```

