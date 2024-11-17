#!/bin/bash

echo "Enter your pet type"
read type 

echo "Enter your pet Breed"
read breed

echo "Enter the type of name you want (Fantasy or Real Names)"
read name

echo "Your selected options are type:$type breed: $breed name: $name"

declare -a petType

petType=("Dog" "Cat" "Bird" "Fish" "Hamster" "Reptile" "Snake" "Chicken" "Exotic")
function get_breed($breed){
    
}