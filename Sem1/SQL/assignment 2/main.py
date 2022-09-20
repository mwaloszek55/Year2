import pymysql


def mysqlconnect():

    connection = pymysql.Connect(host='hostname',
            user='user', 
            password ="pass",
            db='db')

    with connection:
        with connection.cursor() as cursor:          
            sql = "insert into OrderList values(0, 23, 'whatever3', 'whatever2', 3, 0)"             
            cursor.execute(sql)

            connection.commit()

mysqlconnect()
