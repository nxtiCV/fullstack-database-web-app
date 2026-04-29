from db import get_connection
if __name__=="__main__":
    connection = get_connection()
    print(f"Connected to {connection.database} database")