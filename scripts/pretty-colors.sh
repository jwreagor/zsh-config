#!/usr/bin/env zsh

# --- 16 colors

echo '------------------------------------------------------------------------------'
for clbg in {40..47} {100..107} 49 ; do
  # foreground
  for clfg in {30..37} {90..97} 39 ; do
    # formatting
    for attr in 0 1 2 4 5 7 ; do
      # out shoots the rainbow
      echo -en "\e[${attr};${clbg};${clfg}m ^[${attr};${clbg};${clfg}m \e[0m"
    done
    echo
  done
  echo '------------------------------------------------------------------------------'
done

# --- 256 colors

for fgbg in 38 48 ; do # Foreground/Background
  for color in {0..256} ; do # Colors
    # Display the color
    echo -en "\e[${fgbg};5;${color}m ${color}\t \e[0m"
    # Display 10 colors per lines
    if [ $((($color + 1) % 10)) = 0 ] ; then
      echo #New line
    fi
  done
  echo #New line
  echo '---------------------------------------------------------------------------------'
done

exit 0
