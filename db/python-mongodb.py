from pymongo import MongoClient


host = 'localhost'
port = 27017
client = MongoClient(host, port)

db = "baedalgeek_test"
col = "Users"


def insert_data(data):
    client[db][col].insert_one(data)
    result = client[db][col].find_one(None, sort=[('_id', -1)])
    del result['_id']
    return print(result)


def show_data():
    result = client[db][col].find()
    print("Database -", db, "\nCollection -", col)
    for k in result:
        del k['_id']
        print(k)


if __name__ == '__main__':
    data = {}
    data['name'] = input("Insert your name: ")
    data['age'] = int(input("Insert your age: "))
    insert_data(data)
    #client[db][col].delete_one({'name': 'test', 'age': 55})
    #show_data()