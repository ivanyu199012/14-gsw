# This will remove the alias of the "gsw" command
if alias "gsw" &>/dev/null; then
  unalias "gsw"
  echo "Unalias \"gsw\" from the existing alias"
fi

gsw() {
  local is_to_master_branch=false
  local is_create_branch=false
  local new_brancn_name=''

  # Loop through the option
  while [[ $# -gt 0 ]]; do
    case "$1" in
    -m | --master)
      is_to_master_branch=true
      shift
      ;;
    -c | --create)
      is_create_branch=true
      shift
      ;;
    *)
      if $is_create_branch; then
        new_brancn_name=$1
      fi
      shift
      ;;
    esac
  done

  if $is_to_master_branch; then
    git switch master
    return
  fi

  if $is_create_branch; then
    git switch -c $new_brancn_name
    return
  fi

  # Split the git branch output into an array
  local branch_list=($(git branch | grep -v -e '(HEAD detached .*)' | cut -c 3-))
  local current_branch=$(git rev-parse --abbrev-ref HEAD)

  # Print the branches with attached numbers
  local branch_total=${#branch_list[@]}
  for ((i = 0; i < ${branch_total}; i++)); do
    branch=${branch_list[i]}
    if [ "$branch" = "$current_branch" ]; then
      # Hight the current branch as green

      # ANSI escape code for green color
      local GREEN='\033[0;32m'

      # ANSI escape code to reset color
      local NC='\033[0m'
      echo -e "$((i + 1)). * ${GREEN}${branch_list[i]}${NC}"
    else
      echo "$((i + 1)).   ${branch_list[i]}"
    fi
  done

  # Ask user to input
  local input_branch_num=1000
  while ! [[ "$input_branch_num" =~ ^[0-9]+$ ]] || [ "$input_branch_num" -gt "$branch_total" ]; do
    read -p "Enter branch no.: " input_branch_num
  done

  git switch ${branch_list[$((input_branch_num - 1))]}
}
