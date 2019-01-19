if [ -z $1 ]
then
    echo "Missing domain argument. ./chec-buckets.sh domain"
    exit 0
fi


C=`curl -s http://$1.s3.amazonaws.com | grep -c NoSuchBucket`
if [ $C -eq 0 ]
then
    echo "Bucket $1 exists"
fi

declare -a arr=("admin" "administrator" "archive" "backup" "database" "dev" "files" "git" "logs" "ops" "web")
for i in "${arr[@]}"
do
    C=`curl -s http://$1-$i.s3.amazonaws.com | grep -c NoSuchBucket`
    if [ $C -eq 0 ]
    then
    echo "Bucket $1-$i exists"
    fi
done
