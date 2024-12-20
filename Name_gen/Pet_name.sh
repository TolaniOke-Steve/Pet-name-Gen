#!/bin/bash

#normalizing user inputs to match values in array
normalize() {
    local input=$1
    input=$(echo "$input" | tr '[:upper:]' '[:lower:]' | tr -d ' ')
    echo "$(echo "$input" | sed -e 's/\b\(.\)/\u\1/g')"
}  


#inputs
echo "Enter your pet type:  (Dog, Cat, Bird, Fish, Hamster, Reptile, Snake, Chicken, Exotic) "
read type 
norm_type=$(normalize "$type")


echo "Enter the type of name you want: Fantasy, sweet or paint"   
read name
norm_name=$(normalize "$name")

echo "Your selected options are type:$type  nameType: $name "

#array for type
declare -a petType=("Dog" "Cat" "Bird" "Fish" "Hamster" "Reptile" "Snake" "Chicken" "Exotic")

#functions

#check if user entered a valid pet type
valid_type(){
    local type_found=false
    for valid_type in "${petType[@]}"; do
        if [[ "$norm_type" == "$valid_type" ]]; then
            type_found=true
            break
        fi
    done

    if ! $type_found; then 
        echo "invalid pet type '$norm_type' selected please enter one of the following (${petType[*]})"
        exit 1
    fi

    if [[ "$norm_name" != "Fantasy" && "$norm_name" != "Sweet" && "$norm_name" != "Paint" ]]; then
            echo "invalid name type entered enter any of these options: Fantasy, Sweet or Paint"
            exit 1
    fi
}

# Generate Random names from output txt file
get_rand(){
  local file=$1
  local count=$2      

  if [[ -f "$file" ]]; then
        shuf -n "$count" "$file"
   else 
        echo "File not found"
        exit 1
  fi
}

# Generating 5 random pet names based off user inputs
get_name() {
  valid_type

   case "$norm_name" in
        "Sweet")
            echo "Sweet names for your pet:"
            get_rand "sweet_names.txt" 5
            ;;
        "Fantasy")
            echo "Fantasy pet names:"
            get_rand "Exotic_names.txt" 5
            ;;
        "Paint")
            echo "colour inspired names for your pet:"
            get_rand "colour.txt" 5
            ;;
    esac

}


main(){
    get_name
}
main
