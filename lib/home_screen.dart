import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bmi/constants.dart';
import 'package:flutter_bmi/results_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int height1=120;
  int age=25;
  int weight=25;
  String gender1;
  var maleColour = Color(0xff033e66);
  var femaleColour = Color(0xff033e66);
  var maleIconColour = Colors.white70;
  var femaleIconColour = Colors.white70;
  void calculateBMI(){
    var heighInMetter = height1 /100;
    var bmi = weight / (heighInMetter * heighInMetter);
    print(bmi.round());
    Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(bmiResult: bmi.round())));
  }
  void selectGender(bool gender){
    if(gender) {
      setState(() {
        maleColour = blueColor;
        femaleColour = selectedColour;
        maleIconColour = Colors.white;
        femaleIconColour = Colors.white70;
        gender1 = 'male';
      });
    }
      else{
        setState(() {
          femaleColour = blueColor;
          maleColour = selectedColour;
          maleIconColour = Colors.white70;
          femaleIconColour = Colors.white;
          gender1 = 'female';
        });
    }
    }

  addSubtractAge(bool Ageadd){
    if(Ageadd){
      setState(() {
        age++;
      });

    }
    else{
      setState(() {
        age--;
      });
    }
  }

  addSubtractWeight(bool weightAdd){
    if(weightAdd){
      setState(() {
        weight++;
      });

    }
    else{
      setState(() {
        weight--;
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
        title: Text("BMI Calculator"),
        backgroundColor: darkBlueColour,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                color: maleColour,
              ),
              height: 150,
              width: width*0.45,
            child: Column(
              children: [
               FaIcon(FontAwesomeIcons.mars,color: Colors.white70 ,size: 80,),
                Text("Male",style: textStyle,),
              ],
            ),
            ),
            onTap: (){
              selectGender(true);
            },
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
               color: femaleColour,
              ),
              height: 150,
              width: width*0.45,

              child: Column(
                children: [
                  FaIcon(FontAwesomeIcons.venus,color:femaleIconColour ,size: 80,),
                  Text("Female",style: textStyle,),
                ],
              ),
            ),
            onTap: (){
              setState(() {
                selectGender(false);
              });
            },
          ),
      ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: blueColor,
            ),
            height: 150,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Height",style: textStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:[
                Text("${height1}",style: numberTextStyle,),
                    SizedBox(width: 10,),
                    Text('cm', style: textStyle,),
            ],

                ),
                SliderTheme(data: SliderTheme.of(context).copyWith(
                  thumbColor: Colors.pink,
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.white70,
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 10.0,
                  ),
                  overlayColor: Colors.pinkAccent.withOpacity(0.3),
                  overlayShape: RoundSliderOverlayShape(
                    overlayRadius: 25.0,
                  )
                  
                ) ,
                    child: Slider(
                      value: height1.toDouble(),
                    min: 120,
                    max: 200,

                     onChanged: (double valueChanged){
                     setState(() {
                      height1 = valueChanged.toInt();
              });
            },
                    ),
          ) ,



              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  color: blueColor,
                ),
                width:width*0.45,
                height: 150,
                child: Column(
                  children: [
                    Text("Age",style: textStyle,),
                    Text("${age}",style: numberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedColor,
                            ),

                            child: Icon(Icons.remove, color: Colors.white,),
                          ),
                          onTap: (){
                              addSubtractAge(false);

                          },
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedColor,
                            ),

                            child: Icon(Icons.add, color: Colors.white,),
                          ),
                          onTap: (){
                              addSubtractAge(true);

                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            Row(
              children:[
            Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                color: blueColor,
              ),
                height: 150,
                width: width*0.45,

              child: Column(
                children: [
                  Text("Weight",style: textStyle,),
                  Text("${weight}",style: numberTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedColor,
                          ),

                          child: Icon(Icons.remove, color: Colors.white,),
                        ),
                        onTap: (){

                            addSubtractWeight(false);

                        },
                      ),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:selectedColor,
                          ),

                          child: Icon(Icons.add, color: Colors.white,),
                        ),
                        onTap: (){

                            addSubtractWeight(true);
                          
                        },
                      ),
                    ],
                  ),
                ],
              ),

              ),
              ],
            ),
      ],
            ),
          GestureDetector(
            child: Container(
              height: 60,
              width: width,
              color: Colors.pink,
              child: Center(child: Text("Calculate BMI",style: textStyle,)),
            ),
            onTap: (){
              calculateBMI();
            },
          ),
          ],
      ),
    );
  }
}
