
# To install package —— python -m pip install RateMyProfessorAPI 
import ratemyprofessor # https://pypi.org/project/RateMyProfessorAPI/ 
# To install package —— pip install mysql-connector-python
import mysql.connector
# import timeit

mydb = mysql.connector.connect(
  host="127.0.0.1",
  user="root",
  password="",
  database = 'mydegree'
)

mycursor = mydb.cursor()

# start = timeit.default_timer()
query = ("SELECT CONCAT(PROF_FNAME, ' ', PROF_LNAME) AS PROF_NAME, PROF_ID FROM PROFESSOR;")
mycursor.execute(query)

school = ratemyprofessor.get_school_by_name("Oakland University")

results = mycursor.fetchall()

for PROF_NAME, PROF_ID in results:
    prof = ratemyprofessor.get_professor_by_school_and_name(school, PROF_NAME)
    if prof is not None:
      sql = ("UPDATE professor SET PROF_RATING = %s WHERE professor.PROF_ID = %s;")
      vals = (prof.rating, PROF_ID)
      mycursor.execute(sql,vals)
      print(f"prof {prof.name} has a rating of {prof.rating} is added")
    else:
      sql = (f"UPDATE professor SET PROF_RATING = NULL WHERE professor.PROF_ID = {PROF_ID};")
      mycursor.execute(sql)
      print(f"Professor {PROF_NAME} is not rated yet")
      
# print(f"time: {timeit.default_timer()-start:.6} s")
print(f"{mycursor.rowcount} rows affected")
mydb.commit()
mycursor.close()
mydb.close()

