import 'package:flutter/material.dart';
import 'package:harmonica/screens/homePage.dart';
import 'package:harmonica/shared/widgets/stack.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List<Map<String, String>> IndianArtist = [
    {
      "name": "Arijit Singh",
      "imageURL": "https://wallpapercave.com/wp/wp1890577.jpg"
    },
    {
      "name": "Kailash Kher",
      "imageURL":
          "https://th.bing.com/th/id/OIP.MXYqdGWP4NGgJwd0XyofIQHaFL?pid=ImgDet&w=474&h=331&rs=1"
    },
    {
      "name": "Mohammed Rafi",
      "imageURL":
          "https://bro4u.com/blog/wp-content/uploads/2015/07/R7-600x652.jpg"
    },
    {
      "name": "Neeti Mohan",
      "imageURL":
          "https://th.bing.com/th/id/OIP.XttY_woi28EsdqVqEOCpwwHaE8?w=258&h=180&c=7&r=0&o=5&dpr=1.6&pid=1.7"
    },
  ];
  List<Map<String, String>> popArtist = [
    {
      "name": "Dua Lipa",
      "imageURL":
          "https://th.bing.com/th/id/OIP.PRqpSDVMXKyakph-cY8MDgHaE8?pid=ImgDet&rs=1"
    },
    {
      "name": "Taylor Swift",
      "imageURL":
          "https://th.bing.com/th/id/OIP.LuF6CIVofD1zt2y1Ptwj-gHaEK?w=284&h=180&c=7&r=0&o=5&dpr=1.6&pid=1.7"
    },
    {
      "name": "Charlie Puth",
      "imageURL":
          "https://th.bing.com/th/id/OIP.btb2tyiqDIFegI2TEZx5UgHaMR?w=115&h=180&c=7&r=0&o=5&dpr=1.6&pid=1.7"
    },
    {
      "name": "Elvis Presley",
      "imageURL":
          "https://th.bing.com/th/id/R.29870ec35f2c5f2b1ff06a628e17ec34?rik=VqBMaubPosHl6w&riu=http%3a%2f%2fthewowstyle.com%2fwp-content%2fuploads%2f2015%2f01%2fElvis-Presley-11.jpg&ehk=8MD4I0A3%2fKeEz4ofi5WzyGHOD8ulniZVR3IHy20zsqM%3d&risl=&pid=ImgRaw&r=0"
    },
  ];

  List<Map<String, String>> rapArtist = [
    {
      "name": "Eminem",
      "imageURL":
          "https://th.bing.com/th/id/OIP.2okXklZHQWA_ElP3NOIccAHaHa?w=212&h=212&c=7&r=0&o=5&dpr=1.6&pid=1.7"
    },
    {
      "name": "Drake",
      "imageURL":
          "https://th.bing.com/th/id/OIP.88AjaJdF-aj8t6f31RMp9gAAAA?pid=ImgDet&rs=1"
    },
    {
      "name": "Wiz Khalifa",
      "imageURL":
          "https://th.bing.com/th/id/OIP.0Ycv9A4tL6u6OT5LXRsRAgHaKX?w=187&h=261&c=7&r=0&o=5&dpr=1.6&pid=1.7"
    },
    {
      "name": "Kendrick Lamar",
      "imageURL":
          "https://th.bing.com/th/id/OIP.YsFXnIhow-ge5NUMo6DG4wHaJ4?w=141&h=188&c=7&r=0&o=5&dpr=1.6&pid=1.7"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            leading: const Icon(Icons.notifications),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.black,
                  label: Text(
                    "Music",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Chip(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.black,
                  label: Text(
                    "Podcast",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            centerTitle: true,
            actions: const [Icon(Icons.settings)],
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8.0,
                ),
                child: sectionHeader(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: IndianArtist.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Home(
                                      artistName: IndianArtist[index]["name"],
                                    )));
                      },
                      child: SongStack(
                        artistName: IndianArtist[index]["name"],
                        imagePath: IndianArtist[index]["imageURL"],
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8.0,
                ),
                child: sectionHeader(
                  sectionTitle: "Reminsce POP",
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: popArtist.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Home(
                                      artistName: popArtist[index]["name"],
                                    )));
                      },
                      child: SongStack(
                        artistName: popArtist[index]["name"],
                        imagePath: popArtist[index]["imageURL"],
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8.0,
                ),
                child: sectionHeader(
                  sectionTitle: "BLAZIN Streets",
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: rapArtist.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Home(
                                      artistName: rapArtist[index]["name"],
                                    )));
                      },
                      child: SongStack(
                        artistName: rapArtist[index]["name"],
                        imagePath: rapArtist[index]["imageURL"],
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class sectionHeader extends StatelessWidget {
  String? sectionTitle;

  sectionHeader({
    this.sectionTitle = "BEST from India",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          sectionTitle!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Spacer(),
        Chip(
            label: Text(
          "SEE MORE",
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }
}
