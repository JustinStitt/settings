#!/bin/bash


# EMOJIS=(🎈 🎆 🎇 🧨 ✨)

EMOJIS=(🐶 🦒 🦊 🙈 🙉 🐸 🐼 🐨 🦝 🐷 🐗 🐹 🐰 🐻 🐉 🐬 🐍 🦎 🐋 🐍 🐪 🦖 🦕 🐟 🐠 🦐 🦆 🦜 🐋 🐳 🦚 🦚 🐛 🦋 🦋 🦋 🐣 🐤 🐥 🐧 🦩 🦠)

SELECTED_EMOJI=${EMOJIS[$RANDOM % ${#EMOJIS[@]}]}

printf $SELECTED_EMOJI
