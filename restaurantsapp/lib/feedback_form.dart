import 'package:flutter/material.dart';
import 'package:restaurantsapp/services/database.dart';
import 'package:restaurantsapp/widgets/drawer.dart';
import 'screens/Main-Menu/main_meun.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedBackForm extends StatelessWidget {

  DatabaseService databaseService = new DatabaseService();

  double score = 3;
  TextEditingController feedbackInput = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Feedback Form'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'How Was Your Meal ?'
              ),
            ),

          RatingBar(
            initialRating: 3,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              score = rating;
              print(rating);
            },
          ),


            TextField(
              controller: feedbackInput,
              minLines: 10,
              maxLines: 15,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: 'Write your status here',
                filled: true,
                fillColor: Color(0xFFDBEDFF),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),


            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                  print("Feedback : " + feedbackInput.text.toString() + " Rating : " + score.toString());
                  if(feedbackInput.text.isEmpty){
                    print('feedback is emepty');
                  }else{
                    print('feedback is not emepty');
                    //database.sendFeedbackToDatabase('feedback', score, feedbackInput.text.toString());
                    databaseService.sendFeedback(feedbackInput.text, score);
                    showAlertDialog(context);
                  }
              },
              child: Text(
                "Submit Feedback",
                style: TextStyle(fontSize: 20.0),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("Close"),
    onPressed: () {
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainMenu()),
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("FeedBack Submitted"),
    content: Text(""),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}