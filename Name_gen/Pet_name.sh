#!/bin/bash

#inputs
echo "Enter your pet type"
read type 

echo "Enter your pet Breed"
read breed

echo "Enter pet Sex (M/F)"
read gender

echo "Enter the type of name you want (Fantasy or Real Names)"
read name

echo "Your selected options are type:$type breed: $breed name: $name Sex: $gender"

#arrays for types and names
declare -a petType=("Dog" "Cat" "Bird" "Fish" "Hamster" "Reptile" "Snake" "Chicken" "Exotic")

declare -a petNameReal_male=("Pete" "Gib" "Negan" "Leroy" "Arnold" "Barney" "Henry" "Kine" "Justin" "Walter" "Alan" "Marcus" "Elez" "Megatron" "Tzeka")

declare -a petNameReal_female=("Beltina" "Admeta" "Celiaj" "Rebbeca" "Angela" "Kim" "Megatron" "Potts" "Pavlina" "Grecia" "Cheakina")

declare -a exotic_names=("Megatron" "Ehnoll" "Nils" "StarScream" "Bumblebee" "DiamondHead" "Goop" "Grey" "Shatterstar" "Pater")

#functions
get_breed(){
    local breed=$1
    echo "The breed youve entered is: $breed"
}

get_breed "$breed"