if [ "$1" == "" ]; then
    echo "Specify the type of value to load. (alphabet or template)"
    exit 1
fi

if [ "$2" == "" ]; then
    echo "Specify the required template or alphabet to load into Vault."
    exit 1
fi

if [ "$3" == "" ]; then
    echo "Specify the name that will be used in Vault to save this template or alphabet"
    exit 1
fi

if [ "$1" == "template" ] && [ "$4" == "" ]; then
    echo "Loading a template requires an alphabet to be specified"
    exit 1
fi

TYPE=$1
PATH_TO_LOAD=$2
NAME=$3
TEMPLATE_ALPHABET=$4

if [ $TYPE == "alphabet" ]; then
    vault write transform/alphabet/$NAME alphabet="$(cat $PATH_TO_LOAD)"
elif [ $TYPE == "template" ]; then
    vault write transform/template/$NAME \
        type=regex \
        pattern="$(cat $PATH_TO_LOAD)" \
        alphabet=$TEMPLATE_ALPHABET
fi