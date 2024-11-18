#!/bin/bash

#normalizing user inputs to match values in array
normalize() {
    local input=$1
    input=$(echo "$input" | tr '[:upper:]' '[:lower:]' | tr -d ' ')
    echo "$(echo "$input" | sed -e 's/\b\(.\)/\u\1/g')"
}

normalize_Gender() {
    local input=$1
    echo "$(echo "$input" | tr '[:upper:]' '[:lower:]' | tr -d ' ')"
}

#inputs
echo "Enter your pet type:  (Dog, Cat, Bird, Fish, Hamster, Reptile, Snake, Chicken, Exotic) "
read type 
norm_type=$(normalize "$type")

echo "Enter pet Sex (M/F)"
read gender
norm_Gen=$(normalize_Gender "$gender")

echo "Enter the type of name you want (Fantasy or Real)"   
read name
norm_name=$(normalize "$name")

echo "Your selected options are type:$type  nameType: $name Sex: $gender and the names for your pets are: "

#arrays for types and names
declare -a petType=("Dog" "Cat" "Bird" "Fish" "Hamster" "Reptile" "Snake" "Chicken" "Exotic")

declare -a petNameReal_male=("Pete" "Gib" "Negan" "Leroy" "Arnold" "Barney" "Henry" "Kine" "Justin" "Walter" "Alan" "Marcus" "Elez" "Megatron" "Tzeka")

declare -a petNameReal_female=("Beltina" "Admeta" "Celiaj" "Rebbeca" "Angela" "Kim" "Megatron" "Potts" "Pavlina" "Grecia" "Cheakina")

declare -a Fantasy_names=("Megatron" "Ehnoll" "Nils" "StarScream" "Bumblebee" "DiamondHead" "Goop" "Grey" "Shatterstar" "Pater" "Nebula" "Cosmic" "Galvon")

declare -a Exotic_names_male=("Mr.Pickles" "King Harald" "Wizz" "Bop" "Chowder" "Balboa" "Goblin" "Optimus" "Basillisk" "Odin")

declare -a Exotic_nemes_female=("Azula" "Ari" "Sabina" "Akemi" "Sly" "Zippy" "Lumen" "Pancake" "Ix Chel" "truffs" "Lyra")

#functions

# Generate Random names
get_rand(){
  local -n array=$1
  local count=$2
  #arry ref to local array
  shuf -n "$count" -e "${array[@]}"         
}

# Generating 5 random pet names based off user inputs
get_name() {
   type_found=false
    for valid_type in "${petType[@]}"; do
        if [[ "$norm_type" == "$valid_type" ]]; then
            type_found=true
            break
        fi
    done

    if $type_found; then
        if [[ "$norm_Gen" == "m" ]]; then
            if [[ "$norm_name" == "Real" ]]; then
                get_rand petNameReal_male 5
            elif [[ "$norm_name" == "Fantasy" ]]; then
                get_rand Fantasy_names 5
            fi
        elif [[ "$norm_Gen" == "f" ]]; then
            if [[ "$norm_name" == "Real" ]]; then
                get_rand petNameReal_female 5
            elif [[ "$norm_name" == "Fantasy" ]]; then
                get_rand Fantasy_names 5
            fi
        else
            echo "Invalid input. Please enter 'M' or 'F' for Gender and Fantasy or Real for names."
        fi
    elif [[ "$norm_type" == "Exotic" ]]; then
        if [[ "$norm_Gen" == "m" ]]; then
            if [[ "$norm_name" == "Real" ]]; then
                get_rand Exotic_names_male 5
            elif [[ "$norm_name" == "Fantasy" ]]; then
                get_rand Fantasy_names 5
            fi
        elif [[ "$norm_Gen" == "f" ]]; then
            if [[ "$norm_name" == "Real" ]]; then
                get_rand Exotic_names_female 5
            elif [[ "$norm_name" == "Fantasy" ]]; then
                get_rand Fantasy_names 5
            fi
        else
            echo "Invalid input. Please enter 'M' or 'F' for Gender and Fantasy or Real for names."
        fi
    else
        echo "Your pet type '$norm_type' is not valid. Please enter a valid pet type (e.g., Dog, Cat, Exotic)."
    fi
}


main(){
    get_name
}
main