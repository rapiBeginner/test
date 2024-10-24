import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Yummy Hari ini',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Menu Yummy Hari Ini'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  home() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    int Grid = MediaQuery.of(context).size.width.floor() <= 750 ? 2 : 4;
    List data = [
      {
        'judul': 'Bubur Kuah Ayam Sosis Telur',
        'gambar': '0',
        'rating': '4.8',
        'waktu': '45 mnt',
        'review': '12,7 rb'
      },
      {
        'judul': 'Mie Goreng Mercon Uncle Mutu',
        'gambar': '1',
        'rating': '4.6',
        'waktu': '60 mnt',
        'review': '10,7 rb'
      },
      {
        'judul': 'Salad Buah dengan Pudding Melati',
        'gambar': '2',
        'rating': '4.9',
        'waktu': '60 mnt',
        'review': '9 rb'
      },
      {
        'judul': 'Chocholate Mouse in Jar',
        'gambar': '3',
        'rating': '4.5',
        'waktu': '10 mnt',
        'review': '7,7 rb'
      },
    ];

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text('Menu', style: TextStyle(color: Colors.white),),
                decoration: BoxDecoration(color: Colors.lightBlue),
              ),
              ListTile(
                leading: Icon(Icons.food_bank),
                title: Text('Makanan'),
              ),
              
              ListTile(
                leading: Icon(Icons.local_cafe),
                title: Text('Makanan'),
              )
            ],

          ),
        ),
        appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () {Scaffold.of(context).openDrawer();},
          //   icon: Icon(Icons.chevron_left),
          // ),
          backgroundColor: Colors.white,
          title: Text(
            widget.title,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: GridView.count(
            crossAxisCount: Grid,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.5,
            children: List.generate(data.length, (index) {
              return Card(
                  elevation: 5,
                  child: LayoutBuilder(builder: (context, constraint) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: constraint.maxWidth * 0.05,
                          right: constraint.maxWidth * 0.05,
                          bottom: constraint.maxWidth * 0.03,
                          top: constraint.maxWidth * 0.03),
                      child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  child: Image.network(
                                    'https://th.bing.com/th/id/OIP.e786X0hkC2F6toB3RkKp0wAAAA?w=175&h=180&c=7&r=0&o=5&dpr=1.4&pid=1.7',
                                    height: constraint.maxWidth * 0.2,
                                    width: constraint.maxWidth * 0.2,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(1000),
                                ),
                                SizedBox(
                                  width: constraint.maxWidth * 0.055,
                                ),
                                Text(
                                  'Yummy official',
                                  style: TextStyle(
                                      fontSize: constraint.maxWidth * 0.065),
                                ),
                                SizedBox(
                                  width: constraint.maxWidth * 0.1,
                                ),
                                CircleAvatar(
                                  radius: constraint.maxWidth * 0.04,
                                  backgroundColor: Colors.blue[700],
                                  foregroundColor: Colors.white,
                                  child: Icon(
                                    Icons.check,
                                    size: constraint.maxWidth * 0.03,
                                  ),
                                )
                              ],
                              // Text(judul[index])
                            ),
                            SizedBox(
                              height: constraint.maxHeight * 0.02,
                            ),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: Image.asset(
                                  'assets/images/gambar$index.jpg',
                                  height: constraint.maxHeight * 0.45,
                                  width: constraint.maxWidth * 0.9,
                                  fit: BoxFit.cover),
                            ),
                            SizedBox(
                              height: constraint.maxHeight * 0.02,
                            ),
                            Container(
                              height: constraint.maxHeight * 0.15,
                              child: Text(
                                data[index]['judul'],
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: constraint.maxWidth * 0.09,
                                    fontWeight: FontWeight.bold),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  size: constraint.maxWidth * 0.1,
                                  Icons.star,
                                  color: Colors.orange[800],
                                ),
                                Text(data[index]['rating'],
                                    style: TextStyle(
                                        fontSize: constraint.maxWidth * 0.055)),
                                SizedBox(
                                  width: constraint.maxWidth * 0.1,
                                ),
                                Icon(
                                  size: constraint.maxWidth * 0.1,
                                  Icons.access_time_filled,
                                  color: Colors.grey[600],
                                ),
                                SizedBox(
                                  width: constraint.maxWidth * 0.01,
                                ),
                                Text(data[index]['waktu'],
                                    style: TextStyle(
                                        fontSize: constraint.maxWidth * 0.055))
                              ],
                            ),
                            SizedBox(height: constraint.maxWidth * 0.06),
                            Row(
                              children: [
                                Icon(
                                  Icons.visibility,
                                  size: constraint.maxWidth * 0.1,
                                  color: Colors.grey[600],
                                ),
                                Text(data[index]['review'],
                                    style: TextStyle(
                                        fontSize: constraint.maxWidth * 0.055)),
                                Spacer(),
                                Container(
                                  height: constraint.maxWidth * 0.2,
                                  width: constraint.maxWidth * 0.2,
                                  child: Material(
                                    elevation: 5,
                                    shape: CircleBorder(),
                                    child: IconButton(
                                      style: ButtonStyle(
                                          elevation:
                                              WidgetStateProperty.all(15)),
                                      onPressed: () {},
                                      icon: Icon(Icons.bookmark_border),
                                      iconSize: constraint.maxWidth * 0.07,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ]),
                    );
                  }));
            })
            // List.generate(length, generator)
            ,
          ),
        )); // trailing comma makes auto-formatting nicer for build methods.
  }
}
