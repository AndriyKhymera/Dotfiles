return {
    "tpope/vim-surround",
    event = "BufEnter",
    config = function()
        require("nvim-surround").setup()
    end
}
