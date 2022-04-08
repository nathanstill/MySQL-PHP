#https://www.youtube.com/watch?v=elWvom3F2tQ

import mysql.connector

mydb = mysql.connector.connect(
    host='localhost',
    user='root',
    password='test1234',
    port='3306',
    database='school'
)

mycursor = mydb.cursor()

mycursor.execute('select * from student')

users = mycursor.fetchall()

for user in users:
    print(user)
    print('First Name: ' + user[1])
    print('Last Name: ' + user[2])

print('What user do you want (first name)? ')
userRequest = input()

mycursor.execute('select * from student where firstname="'+userRequest + '"')
users = mycursor.fetchall()

for user in users:
    print(user)
    print('First Name: ' + user[1])
    print('Last Name: ' + user[2])