import json
import firebase_admin
from firebase_admin import credentials, firestore

cred = credentials.Certificate("serviceAccountKey.json")
firebase_admin.initialize_app(cred)

db = firestore.client()


with open("cocktail.json", "r") as drinks:
    data = drinks.read()
    data = json.loads(data)
    count = 0
    for drink in data:    
        
        doc_ref = db.collection("Menu").document("Drinks").collection("Drinks").document(drink["idDrink"])
        doc_ref.create({
            "Name": drink["strDrink"],
            "imageLink": drink["strDrinkThumb"]
        })
        count+=1
        print(count)