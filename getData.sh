#!/bin/bash
# alvessh

TOKEN=""

get_group_ids() {
    local response=$(curl -s "https://api.telegram.org/bot$TOKEN/getUpdates")
    local group_ids=()
    local chat_id

    # Extrai os IDs dos grupos das atualizações
    while IFS= read -r line; do
        chat_id=$(echo "$line" | grep -oP '"id":\s*\K(-?[0-9]+)')
        if [[ $chat_id -lt 0 ]]; then
            group_ids+=("$chat_id")
        fi
    done <<< "$response"

    printf '%s\n' "${group_ids[@]}"
}

bot_info=$(curl -s "https://api.telegram.org/bot$TOKEN/getMe")
bot_username=$(echo "$bot_info" | grep -oP '"username":\s*"\K([^"]+)')
echo "Nome do Bot: $bot_username"

# Obtém e exibe os IDs dos grupos
echo "IDs dos Grupos:"
get_group_ids
