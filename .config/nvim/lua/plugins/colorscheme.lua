-- lua/plugins/colorscheme.lua
return {
    {
        'navarasu/onedark.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('onedark').setup {
                style = 'darker',
                code_style = {
                    comments = 'italic',
                    keywords = 'none',
                    functions = 'none',
                    strings = 'none',
                    variables = 'none'
                },
            }
            vim.cmd.colorscheme 'onedark'
        end
    }
}