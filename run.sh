git clone https://github.com/chupino/postgresvoting.git postgres
cd postgres

docker build -t postgres-image .

if [ $? -eq 0 ]; then
    echo "bien"
else
    echo "mal"
    exit 1
fi

docker run -dp 5432:5432 --name=postgres-db postgres-image