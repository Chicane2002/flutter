import 'package:flutter/material.dart';
import 'package:p5_bmi/screens/resultPage.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

calcBMI({double h = 0, double w = 0}) {
  double bmi = w / (h * w);
  return bmi;
}

class _FirstScreenState extends State<FirstScreen> {
  double sliderValue = 100;
  double weight = 0;
  double age = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    color: Color.fromARGB(255, 73, 255, 252),
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //color: Colors.amber,
                          height: 100,
                          width: 100,
                          child: IconButton(
                              //by itself the button is moved to the right
                              onPressed: () {},
                              icon: Icon(Icons.male, size: 80),
                              color: Color.fromARGB(255, 111, 110, 110)),
                        ),
                        const Text(
                          'Male',
                          style: TextStyle(
                            color: Color.fromARGB(2255, 111, 110, 110),
                            fontSize: 32,
                          ),
                        )
                      ],
                    )),
                Container(
                    color: Color.fromARGB(255, 73, 255, 252),
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Column(
                      children: [
                        Container(
                          //color: Colors.amber,
                          height: 100,
                          width: 100,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.female, size: 80),
                              color: Color.fromARGB(255, 111, 110, 110)),
                        ),
                        const Text(
                          'Female',
                          style: TextStyle(
                            color: Color.fromARGB(255, 111, 110, 110),
                            fontSize: 32,
                          ),
                        )
                      ],
                    ))
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              color: Color.fromARGB(255, 68, 255, 74),
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height",
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 109, 109, 108)),
                        ),
                      ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text.rich(TextSpan(
                        text: sliderValue.toString().substring(0, 5),
                        style: const TextStyle(
                            fontSize: 52,
                            color: Color.fromARGB(255, 109, 109, 108)),
                        children: const [
                          TextSpan(
                              text: "  cm",
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Color.fromARGB(255, 109, 109, 108)))
                        ])),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Slider(
                        value: sliderValue,
                        activeColor: Colors.amber,
                        thumbColor: Colors.red,
                        min: 100,
                        max: 250,
                        onChanged: (v) {
                          sliderValue = v;
                          setState(() {});
                        }),
                  ]),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    color: Color.fromARGB(255, 73, 255, 252),
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Weight",
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 109, 109, 108)),
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(TextSpan(
                                  text: weight.toString(),
                                  style: const TextStyle(
                                      fontSize: 32,
                                      color:
                                          Color.fromARGB(255, 109, 109, 108)),
                                  children: const [
                                    TextSpan(
                                        text: "  kg",
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Color.fromARGB(
                                                255, 109, 109, 108)))
                                  ])),
                            ]),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                //color: Colors.amber,
                                height: 40,
                                width: 40,
                                child: IconButton(
                                    //by itself the button is moved to the right
                                    onPressed: () {
                                      weight++;
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.add, size: 30),
                                    color: Color.fromARGB(255, 111, 110, 110)),
                              ),
                              Container(
                                //color: Colors.amber,
                                height: 40,
                                width: 40,
                                child: IconButton(
                                    //by itself the button is moved to the right
                                    onPressed: () {
                                      weight--;
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.remove, size: 30),
                                    color: Color.fromARGB(255, 111, 110, 110)),
                              )
                            ]),
                      ],
                    )),
                Container(
                    color: Color.fromARGB(255, 73, 255, 252),
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Column(
                      children: [
                        const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Age",
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 109, 109, 108)),
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(TextSpan(
                                  text: age.toString(),
                                  style: const TextStyle(
                                      fontSize: 32,
                                      color:
                                          Color.fromARGB(255, 109, 109, 108)),
                                  children: const [
                                    TextSpan(
                                        text: "  years",
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Color.fromARGB(
                                                255, 109, 109, 108)))
                                  ])),
                            ]),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                //color: Colors.amber,
                                height: 40,
                                width: 40,
                                child: IconButton(
                                    //by itself the button is moved to the right
                                    onPressed: () {
                                      age++;
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.add, size: 30),
                                    color: Color.fromARGB(255, 111, 110, 110)),
                              ),
                              Container(
                                //color: Colors.amber,
                                height: 40,
                                width: 40,
                                child: IconButton(
                                    //by itself the button is moved to the right
                                    onPressed: () {
                                      age--;
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.remove, size: 30),
                                    color: Color.fromARGB(255, 111, 110, 110)),
                              )
                            ]),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double Bmi = calcBMI(h: sliderValue, w: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ResultPage(bmi: Bmi)),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 90,
                height: 50,
                color: Color.fromARGB(255, 255, 146, 250),
                child: Center(
                  child: Text(
                    "Calculate BMI",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
