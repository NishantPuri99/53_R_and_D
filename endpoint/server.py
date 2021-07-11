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

leaderDict = {}

def updateLeaderBoardForUser(jsonData,deleteUser):
    if(deleteUser==True):
        del leaderDict[jsonData['userID']]
    else:
        print(jsonData)
        print(leaderDict)
        if(jsonData['userID'] not in leaderDict.keys()):
            print('hi')
            leaderDict[jsonData['userID']] = {'targetDistance_km': jsonData['distance_km'], 'timeSpent_mins': jsonData['time_mins'], 'timestamp':datetime.now().timestamp()}
            print(leaderDict)
        else:
            print('here')
            print(leaderDict)
            if(jsonData['distance_km'] == leaderDict[jsonData['userID']]['targetDistance_km']):
                if(jsonData['time_mins'] <= leaderDict[jsonData['userID']]['timeSpent_mins']):
                    leaderDict[jsonData['userID']]['timeSpent_mins'] = jsonData['time_mins']
                    leaderDict[jsonData['userID']]['timestamp'] = datetime.now().timestamp()

            else:
                s1 = float(jsonData['distance_km']/jsonData['time_mins'])
                s2 = float(leaderDict[jsonData['userID']]['targetDistance_km']/leaderDict[jsonData['userID']]['timeSpent_mins'])
                if(s1>=s2):
                    leaderDict[jsonData['userID']]['targetDistance_km'] = jsonData['distance_km']
                    leaderDict[jsonData['userID']]['timeSpent_mins'] = jsonData['time_mins']
                    leaderDict[jsonData['userID']]['timestamp'] = datetime.now().timestamp()

            print(leaderDict)
    


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
                updateLeaderBoardForUser(jsonData,True)
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
        for k,v in result.to_dict().items():
            print(jsonData)
            if(k==f"activity{jsonData['activityID']}" and v["userID"]==jsonData['userID']):
                updateLeaderBoardForUser(jsonData,False)
                query.update({f"activity{jsonData['activityID']}":{'targetDistance_km': jsonData['distance_km'], 'timeSpent_mins': jsonData['time_mins'], 'timestamp':datetime.now().timestamp(), 'userID': jsonData['userID']}})
                return f"Updated entry with user id {jsonData['userID']}"
        return "Data Not Present"
    else:
        return "Method Not Correct"

@app.route("/add-activity",methods=['POST'])
def addToDb():
    jsonData = json.loads(request.get_data())
    if(request.method=='POST'):
        updateLeaderBoardForUser(jsonData,False)
        dbCol.document(u'user{0}'.format(jsonData['userID'])).update({f"activity{jsonData['activityID']}":{'targetDistance_km': jsonData['distance_km'], 'timeSpent_mins': jsonData['time_mins'], 'timestamp':datetime.now().timestamp(), 'userID': jsonData['userID']}})
    return "Added Succefully"

@app.route("/leaderboard")
def leaderboard():
    return leaderDict

if __name__ == "__main__":
  app.run(debug=True)