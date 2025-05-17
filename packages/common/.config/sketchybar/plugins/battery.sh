#!/usr/bin/env sh

source "$HOME/.config/sketchybar/helpers/colors.sh"

# Battery is here bcause the ICON_COLOR doesn't play well with all background colors

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
    exit 0
fi

case ${PERCENTAGE} in
[8-9][0-9] | 100)
    ICON=""
    ICON_COLOR=$GREEN
    ;;
7[0-9])
    ICON=""
    ICON_COLOR=$YELLOW
    ;;
[4-6][0-9])
    ICON=""
    ICON_COLOR=$ORANGE
    ;;
[1-3][0-9])
    ICON=""
    ICON_COLOR=0xffee99a0
    ;;
[0-9])
    ICON=""
    ICON_COLOR=$RED
    ;;
esac

if [[ $CHARGING != "" ]]; then
    ICON=""
    ICON_COLOR=$YELLOW
fi

sketchybar --set $NAME \
    icon=$ICON \
    label="${PERCENTAGE}%" \
    icon.color=${ICON_COLOR}
