# Ex do meu primeiro plugin para Nvim e Lazy

https://github.com/segodimor2d2/explugin-nvim

## Instalação

"segodimor2d2/explugin-nvim"

### Crie um arquivo .lua em .config/nvim/lua/plugins/qualquerNome.lua qualquer 

#### -- Adicione o seguinte código para instalar via Lazy


```lua
return {
  "segodimor2d2/explugin-nvim",
  config = true,
}
```

para executar Lazy:

leader-l

para instalar o plugin:

leader-i

### Rodando o plugin:

:lua require("qualquerNome").test()

ou pode usar o keymap:

leader-pk

o resultado vai ser "test my first plugin !!" uma Notification que vai aparecer na tela como um popup ou pode ver executando:

:Notification

se tiver erros vc pode ver eles com:

:messages


### Detalhes do código para desenvolver:

Eu fiz uma estrutura bem simples assim (a pasta pode ficar em qualquer path que vc preferir):

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
	print("meu primeiro plugin !!")
end

M.setup = function()
	vim.keymap.set("n", "<leader>pk", function()
		M.fntest()
	end, { desc = "EX-Plugin-Nvim" })
end

return M

```

