import mysql.connector

def get_connection():
    connection = mysql.connector.connect(
        user='root', # your username goes here, which is 'root'
        password='soccerMan1#', #your password goes here
        host='localhost',
        database='car_rental'
    )
    return connection