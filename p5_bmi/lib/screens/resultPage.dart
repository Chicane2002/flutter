import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class ResultPage extends StatefulWidget {
//   double bmi;
//   ResultPage({super.key, required this.bmi});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController textfield = TextEditingController();
//     return
//   }

class ResultPage extends StatefulWidget {
  double? bmi;
  ResultPage({super.key, required this.bmi});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  TextEditingController textfield = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          child: Text('Your BMI is: ${widget.bmi}'),
        ),
        TextField(
          //Box to take text input
          controller: textfield,
          obscureText: true,
          obscuringCharacter: '%',
          keyboardType: TextInputType
              .number, //makes it so that the type of keyboard used is the numpad
          decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            prefixIcon: Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {},
            ),
          ),
          onChanged: (string) {
            print("The given text is $string");
            print(
                "The given text is ${textfield.text}"); //gets the value of string
            textfield.clear(); //clears field,similar to pressing close button
          },
          onEditingComplete: () {
            //the data becomes final,similar to pressing search button
            print(
                'The final value entered is ${textfield.text}'); //string wont work here
          },
        ),
        TextButton(
            onPressed: () {
              textfield.clear();
              setState(() {});
            },
            child: Text(
              "Clear Screen",
              style: GoogleFonts.akayaKanadaka(
                  fontSize:
                      50), // Uses the fonts installed from Pub.dev. Type in terminal "flutter pub add google_fonts"
            )),
        const SizedBox(
          //Used to define size of card
          height: 200,
          width: 200,
          child: Card(
            //Makes a box with the property of elevation
            elevation: 20,
            // shadowColor: Colors.red,
            //shadowColor: Color(),
            color: Colors.green,
            child: Center(
              child: Text('Yay'),
            ),
          ),
        ),
        Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
              gradient: RadialGradient(colors: [
            Colors.white,
            Colors.red,
            Colors.blue
          ]) //other gradients include regular with left to right
              ),
        )
      ]),
    ));
  }
}
