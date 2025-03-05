function ToggleCopilot()
    -- Verifica se o Copilot está ativo
    if vim.g.copilot_enabled == 1 then
        -- Desativa o Copilot
        vim.cmd('Copilot disable')
        print("Copilot desativado")
    else
        -- Ativa o Copilot
        vim.cmd('Copilot enable')
        print("Copilot ativado")
    end
end
