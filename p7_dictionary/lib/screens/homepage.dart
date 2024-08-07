import 'package:flutter/material.dart';
import 'package:p7_dictionary/services/dictClient.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// init state is the first state of a page when it is built. It specifies what will be displayed from the backend first, like all the blank video containers when youtube is launched.

class _HomePageState extends State<HomePage> {
  DictClient dClient = DictClient();
  TextEditingController tcont = TextEditingController();
  String meaning = 'null';

  callAPI(q) async {
    meaning = await dClient.searchForward(q);
    //.tostring();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
        ),
        drawer: Drawer(
            child: DrawerHeader(
          decoration: BoxDecoration(color: Colors.red),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                drawerTile(),
                drawerTile(),
                drawerTile(),
                drawerTile(),
                drawerTile(),
              ],
            ),
          ),
        )),
        body: Container(
          color: const Color.fromARGB(255, 20, 155, 137),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // ignore: prefer_const_constructors
          child: Column(children: [
            const SizedBox(
              height: 100,
            ),
            const Text('Dictionary'),
            Container(
              width: MediaQuery.of(context).size.width * 90,
              child: TextField(
                controller: tcont,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.clear)),
                    label: const Text("DICTIONARY"),
                    hintText: "Enter a Word Here"),
                //keyboardType: TextInputType.number,
                keyboardType: TextInputType.text,
                onChanged: (string) {
                  // print(textfield.text); //controller--> text
                  print("This is the text from the textfield $string");
                },
                onEditingComplete: () {
                  // print(
                  //     // "this is the final submission from the textfield ${txtfld.text}");
                },
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            OutlinedButton(
              onPressed: () {
                callAPI(tcont.text);
                //tcont.clear(); removes the word after it is used.
              },
              child: const Text('Search'),
              //style: ButtonStyle(),
            ),
            Container(
              color: Color.fromARGB(255, 187, 186, 185),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Center(child: Text("Meaning: $meaning")),
            ),
          ]),
        ),
      ),
    );
  }

  ListTile drawerTile({
    String t = 'home',
    MaterialColor c = Colors.red,
  }) {
    return ListTile(
      tileColor: c,
      title: Text(t),
      onTap: () {},
    );
  }
}
