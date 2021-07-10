from flask import Flask, request, json, redirect
import firebase_admin
from firebase_admin import credentials,firestore
from datetime import datetime

from flask.sessions import NullSession


app = Flask(__name__)

cred = credentials.Certificate("key.json")
firebase_admin.initialize_app(cred)
db=firestore.client()

dbCol = db.collection(u'users')

@app.route("/",methods=['POST'])
def createUser():
    jsonData = json.loads(request.get_data())
    dbCol.document(u'user{0}'.format(jsonData['userID'])).set({'dateOfCreation':datetime.now().timestamp()})
    return "User Created"

@app.route("/get-scores/<userID>",methods=["GET"])
def getDbData(userID):
    result = dbCol.document(u'user{0}'.format(userID)).get()
    return result.to_dict()
   

@app.route("/delete",methods=["DELETE"])
def deleteDb():
    jsonData = json.loads(request.get_data())
    query = dbCol.document(u'user{0}'.format(jsonData['userID_param']))
    result = query.get()
    if(request.method=="DELETE"):
        for item in result.to_dict().items():
            if(item[0] == 'userID' and item[1] == int(jsonData['userID_param'])):
                query.delete()
                return f"Deleted entry with user id {jsonData['userID_param']}"
        return "Data Not Present"
    else:
        return "Method Not Correct"


@app.route("/update",methods=['POST'])
def updateDb():
    jsonData = json.loads(request.get_data())
    query = dbCol.document(u'user{0}'.format(jsonData['userID']))
    result = query.get()
    if(request.method=='POST'):
        for item in result.to_dict().items():
            if(item[0] == 'userID' and item[1] == int(jsonData['userID'])):
                query.update({'activityID': jsonData['activityID'], 'targetDistance': jsonData['distance'], 'timeSpent': jsonData['time'], 'timestamp':datetime.now().timestamp(), 'userID': jsonData['userID']})
                return f"Updated entry with user id {jsonData['userID']}"
        return "Data Not Present"
    else:
        return "Method Not Correct"

@app.route("/add-activity",methods=['POST'])
def addToDb():
    jsonData = json.loads(request.get_data())
    if(request.method=='POST'):
        dbCol.document(u'user{0}'.format(jsonData['userID'])).update({f"activity{jsonData['activityID']}":{'targetDistance': jsonData['distance'], 'timeSpent': jsonData['time'], 'timestamp':datetime.now().timestamp(), 'userID': jsonData['userID']}})
    return "Added Succefully"


if __name__ == "__main__":
  app.run(debug=True)