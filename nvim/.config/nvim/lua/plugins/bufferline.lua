return {
    {
        'akinsho/bufferline.nvim', 
        version = "*", 
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup{
                options = {
                    -- Aquí puedes personalizar colores, iconos, y comportamiento

                }
            }
        end,
    },
}

