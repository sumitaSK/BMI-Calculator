import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bmi/constants.dart';

class ResultScreen extends StatefulWidget {
  final int bmiResult;

  const ResultScreen({Key key, this.bmiResult}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

var bmicolor=Colors.white;
var bmiText='Normal';
var imagepath='normal';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Hello");
    updateUI();
  }

void updateUI(){
    var bmi = widget.bmiResult;
    if(bmi <18){
setState(() {
  bmiText='Underweight';
  bmicolor=Colors.lightBlueAccent;
  imagepath='underweight';
});
    }
    else if(bmi >=18 && bmi<=25){
setState(() {
  bmiText='Normal';
  bmicolor=Colors.green;
  imagepath='normal';
});
    }
    else if(bmi>26 && bmi<=30){
      setState(() {
        bmiText='OverWeight';
        bmicolor=Colors.yellowAccent;
        imagepath='overweight';
      });
    }
    else if(bmi>=31 && bmi<=35){
      setState(() {
        bmiText='Obese';
        bmicolor=Colors.orange;
        imagepath='obese';
      });
    }
    else if(bmi>=36 ){
      setState(() {
        bmiText='Extreme Obese';
        bmicolor=Colors.red;
        imagepath='extreme';
      });
    }
}
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: darkBlueColour,
      appBar: AppBar(
        backgroundColor: darkBlueColour,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Container(
          width: width,
        height: 200,
        decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(3)),
    color: Color(0xff033e66),
    ),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
            children:[
            Text("Your BMI value is",style: textStyle.copyWith(fontSize: 20),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${widget.bmiResult}",style: numberTextStyle,),
              ),
              Text(bmiText, style: textStyle.copyWith(fontSize: 35,color: bmicolor,),)
            ],
          ),
         ),
          Image.asset('images/${imagepath}.png',height: height*0.5,),
          Spacer(),
          GestureDetector(
            child: Container(
              height: 50,
              width: width,
              color: Colors.pink,
              child: Center(child: Text("Calculate Again",style: textStyle,)),
            ),
            onTap: (){
             Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
