import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_day5/icon_content.dart';
import 'package:bmi_calculator_day5/ReuseCard.dart';
import 'package:bmi_calculator_day5/Constants.dart';
import 'package:bmi_calculator_day5/RoundIconButton.dart';
import 'package:bmi_calculator_day5/ResultsPage.dart';
import 'package:bmi_calculator_day5/BottomButton.dart';
import 'package:bmi_calculator_day5/Calculate_BMI.dart';

enum Gender{
   male,
   female;
}


 class InputHomePage extends StatefulWidget {
   @override
   _InputHomePageState createState() => _InputHomePageState();
 }

 class _InputHomePageState extends State<InputHomePage>{
   int height=180;
   int weight=60;
   int Age=18;
   // late Null selectedGender;
   Color maleCardGender=InactiveCardColour;
   Color FemaleCardGender=InactiveCardColour;

void updateColor(Gender selectedGender){
  if(selectedGender==Gender.male){
    if(maleCardGender==InactiveCardColour){
      maleCardGender=activeCardColour;
      FemaleCardGender=InactiveCardColour;
    }
    else{
      maleCardGender=InactiveCardColour;
    }
  }
  if(selectedGender==Gender.female){
    if(FemaleCardGender==InactiveCardColour)
      FemaleCardGender=activeCardColour;
    maleCardGender=InactiveCardColour;
  }
  else{
    FemaleCardGender=InactiveCardColour;
  }
}
   @override
   Widget build(BuildContext context) {
     return Scaffold(appBar: AppBar(
       title: const Center(child: Text('BMI Calculator')),
     ),

       body: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children:<Widget>[
           Expanded(child:Row(
           children: <Widget>[
             Expanded(child:  GestureDetector(
               onTap: (){
                 setState(() {
                   updateColor(Gender.male);
                 });

               },
               child: ReuseAbleCard(
                 colour: maleCardGender,

                 cardChild: ReuseIcon(
                   icon: FontAwesomeIcons.mars,
                   text: 'MALE',
                 ),
              //   colour: selectedGender==Gender.male ? activeCardColour : InactiveCardColour),
               ),),
             ),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColor(Gender.female);
                  });
                },
                child: ReuseAbleCard(
                  colour: FemaleCardGender,

                  cardChild: ReuseIcon(
                   icon: FontAwesomeIcons.venus,
                   text: 'FEMALE',
                 ),
                 //  colour: selectedGender==Gender.female ? activeCardColour : InactiveCardColour ),

               ),),),
               ],
                ),),
               Expanded(child: ReuseAbleCard(
               colour:  activeCardColour,
               cardChild: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text('HEIGHT', style: labelTextStyle),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.baseline,
                 textBaseline: TextBaseline.ideographic,
                 children: <Widget>[
                 Text(height.toString(), style: NumberTextStyle),
                   Text('cm',style:labelTextStyle ,),
                 ],

                 ),
                   SliderTheme(
                     data: SliderTheme.of(context).copyWith(
                       activeTrackColor: Colors.white,
                       thumbColor: Color(0xFFEB1555),
                       overlayColor: Color(0x29EB1555),
                       thumbShape:
                         RoundSliderThumbShape(enabledThumbRadius: 15.0),
                       overlayShape:
                         RoundSliderOverlayShape(overlayRadius: 30.0),
                     ),
                     child: Slider(value: height.toDouble(),
                         min: 120,
                         max: 220,
                         // activeColor: Color(0xFFEB1555),
                         inactiveColor:Color(0xFF8D8E98),
                         onChanged: (double newValue){
                       setState(() {
                         height=newValue.round();
                       });
                         }),
                   )
   ],
              ),),),
                Expanded(
                  child:Row(
                   children: <Widget>[
                   Expanded(child:  ReuseAbleCard(
                   colour:  activeCardColour,
                   cardChild:Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children :<Widget>[
                     Text('WEIGHT', style: labelTextStyle),
                     Text(weight.toString(), style: NumberTextStyle,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children:<Widget> [
                           RoundIconButton(
                               icon: FontAwesomeIcons.minus,
                             onPressed:(){
                                 setState(() {
                                   weight--;
                                 });
                             } ,

                              ),
                           SizedBox(
                             width: 10.0,
                           ),
                           RoundIconButton(
                             icon: FontAwesomeIcons.plus,
                             onPressed: () {
                               setState(() {
                                 weight++;
                               });
                             },
                           ),
                         ],
                       ),
                   ],)
                  ),),
                 Expanded(child: ReuseAbleCard(
                   colour:  activeCardColour,
                     cardChild:Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children :<Widget>[
                         Text('AGE', style: labelTextStyle),
                         Text(Age.toString(), style: NumberTextStyle,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children:<Widget> [
                             RoundIconButton(
                               icon: FontAwesomeIcons.minus,
                               onPressed:(){
                                 setState(() {
                                   Age--;
                                 });
                               } ,

                             ),
                             SizedBox(
                               width: 10.0,
                             ),
                             RoundIconButton(
                               icon: FontAwesomeIcons.plus,
                               onPressed: () {
                                 setState(() {
                                   Age++;
                                 });
                               },
                             ),
                           ],
                         ),
                       ],)),),
             ],
           ),),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: (){
                CalculatorBrain calcuate= CalculatorBrain(height: height,weight: weight);

                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
                  bmiResult: calcuate.calculateBMI(),
                  resultText: calcuate.getResult(),
                  textResult: calcuate.gettextResult(),
                )));
              },
            ),

     ],),
     );
   }
 }



