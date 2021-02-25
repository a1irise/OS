[[ $# != 1 ]] && { echo "Error: invalid number of parameters." 1>&2; exit 1; }
[[ ! -f $1 ]] && { echo "Error: file not found." 1>&2; exit 1; }

trash=$HOME/.trash
log=$HOME/.trash.log
id_path=$HOME/.id
file=$(pwd)/$1

[[ ! -d $trash ]] && mkdir $trash
[[ ! -f $log ]] && touch $log
[[ ! -f $id_path ]] && echo 0 > $id_path

id=$(cat $id_path)
ln $file $trash/$id
rm $file
echo "$file $trash/$id" >> $log
echo $((id + 1)) > $id_path
