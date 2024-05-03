require('mini.indentscope').setup({
    -- Draw options
    draw = {
        delay = 0,
        animation = function()
            return 0
        end
    },
    -- Which character to use for drawing scope indicator
    symbol = '|',
    options = {
        try_as_border = true
    }
})
