i=2;
fileExtensions="";
numberOfExtensions=$1;
numberOfExtensions=$((numberOfExtensions+1));
while [ $i -le $numberOfExtensions ]
do
if [ $i -lt $numberOfExtensions ]
then
eval "arg=\${$i}"
fileExtensions="$fileExtensions$arg|"
fi
if [ $i = $numberOfExtensions ]
then
eval "arg=\${$i}"
fileExtensions="$fileExtensions$arg"
fi
i=$((i+1))
done
find . -regextype posix-egrep -regex ".*\.($fileExtensions)$" -type f -delete
echo Fisierele cu extensiile $fileExtensions au fost sterse. 
