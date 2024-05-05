local keys = {
    { "<leader>a", function() require("harpoon.mark").add_file() end },
    { "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end },
    { "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end },
}

for i = 1, 9 do
    table.insert(keys, { "<leader>" .. i, function() require("harpoon.ui").nav_file(i) end })
end

return {
    "theprimeagen/harpoon",
    keys = keys,
}
