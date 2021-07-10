from flask import Flask, request, json
import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from datetime import datetime


app = Flask(__name__)

cred = credentials.Certificate("<Location of Service Account KEY>")
firebase_admin.initialize_app(cred)
ref = db.reference('/users',url="DB_URL")
@app.route("/")
def hello():
    result = ref.get()
    return str(result)

@app.route("/get-scores/<userID>",methods=["GET"])
def getDbData(userID):
    return ref.child(f'user{userID}').get()
   

@app.route("/delete",methods=["DELETE"])
def deleteDb():
    jsonData = json.loads(request.get_data())
    if(request.method=="DELETE"):
        for k,v in dict(ref.get()).items():
            if(int(v["userID"]) == int(f"{jsonData['userID_param']}")):
                ref.child(k).set({})
                return f"Deleted entry with user id {jsonData['userID_param']}"
            else:
                return "Data Not Present"
    else:
        return "Method Not Correct"


@app.route("/update",methods=['POST'])
def updateDb():
    jsonData = json.loads(request.get_data())
    if(request.method=='POST'):
        for k,v in dict(ref.get()).items():
            if(int(v["userID"]) == int(f"{jsonData['userID']}")):
                ref.child(k).update({'activityID':request.get_json()['activityID'],'targetDistance': request.get_json()['distance'], 'timeSpent': request.get_json()['time'], 'timestamp':datetime.now().timestamp()})
                return f"Updated entry with user id: {jsonData['userID']}"
            else:
                return "Data Not Present"
    else:
        return "Method Not Correct"
    return f"Added Succefully {ref.get()}"

@app.route("/add",methods=['POST'])
def addToDb():
    if(request.method=='POST'):
        ref.update({f"user{request.get_json()['userID']}":{'activityID': request.get_json()['activityID'], 'targetDistance': request.get_json()['distance'], 'timeSpent': request.get_json()['time'], 'timestamp':datetime.now().timestamp(), 'userID': request.get_json()['userID']}})
    return f"Added Succefully"

if __name__ == "__main__":
  app.run(debug=True)