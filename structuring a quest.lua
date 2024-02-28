-- Definindo a estrutura de uma quest
local Quest = {
    title = "",
    description = "",
    objectives = {},
    rewards = {}
}

-- Função para criar uma nova quest
function Quest:new(title, description, objectives, rewards)
    local quest = {}
    setmetatable(quest, self)
    self.__index = self
    quest.title = title
    quest.description = description
    quest.objectives = objectives
    quest.rewards = rewards
    return quest
end

-- Função para verificar se uma quest foi concluída
function Quest:isCompleted()
    for _, objective in ipairs(self.objectives) do
        if not objective.completed then
            return false
        end
    end
    return true
end

-- Definindo a estrutura de um objetivo de quest
local Objective = {
    description = "",
    completed = false
}

-- Função para criar um novo objetivo
function Objective:new(description)
    local objective = {}
    setmetatable(objective, self)
    self.__index = self
    objective.description = description
    return objective
end

-- Função para marcar um objetivo como concluído
function Objective:complete()
    self.completed = true
end

-- Exemplo de uso
local quest = Quest:new(
    "Salvar a princesa",
    "A princesa está em perigo! Salve-a do dragão.",
    {
        Objective:new("Encontre o castelo"),
        Objective:new("Derrote o dragão"),
        Objective:new("Resgate a princesa")
    },
    {gold = 100, experience = 200}
)

-- Simulação do progresso do jogador
quest.objectives[1]:complete()
quest.objectives[2]:complete()
quest.objectives[3]:complete()

-- Verificando se a quest foi concluída
if quest:isCompleted() then
    print("Parabéns! Você salvou a princesa e completou a quest.")
    -- Dar as recompensas ao jogador
    -- Aqui você pode adicionar a lógica para dar as recompensas ao jogador
else
    print("Ainda há objetivos a serem completados.")
end
