#!/bin/bash

#normalizing user inputs to match values in array
normalize(){
    local input=$1
    input=$(echo "$input" | tr '[:upper:]' '[:lower:]' | tr -d ' ')
    echo "$(echo "$input" | sed -e 's/\b\(.\)/\u\1/g')"
}

normalize_Gender(){
    local input=$1
    input=$(echo "$input"| tr '[:upper:]' '[:lower:]' | tr -d ' ')
}

#inputs
echo "Enter your pet type"
read type 
norm_type=$(normalize "$type")

echo "Enter pet Sex (M/F)"
read gender
norm_Gen=$(normalize_Gender "$gender")

echo "Enter the type of name you want (Fantasy or Real)"
read name
norm_name=$(normalize "$name")

echo "Your selected options are type:$type  nameType: $name Sex: $gender"

#arrays for types and names
declare -a petType=("Dog" "Cat" "Bird" "Fish" "Hamster" "Reptile" "Snake" "Chicken" "Exotic")

declare -a petNameReal_male=("Pete" "Gib" "Negan" "Leroy" "Arnold" "Barney" "Henry" "Kine" "Justin" "Walter" "Alan" "Marcus" "Elez" "Megatron" "Tzeka")

declare -a petNameReal_female=("Beltina" "Admeta" "Celiaj" "Rebbeca" "Angela" "Kim" "Megatron" "Potts" "Pavlina" "Grecia" "Cheakina")

declare -a Fantasy_names=("Megatron" "Ehnoll" "Nils" "StarScream" "Bumblebee" "DiamondHead" "Goop" "Grey" "Shatterstar" "Pater" "Nebula" "Cosmic" "Galvon")

#functions

get_name(){

    if ($norm_type == )
}

get_breed(){
    local breed=$1
    echo "The breed youve entered is: $breed"
}

get_breed "$breed"