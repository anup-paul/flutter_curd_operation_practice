import 'package:curd_testing/models/user.dart';
import 'package:curd_testing/service/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      NetworkHelper().getData();
      _counter++;
    });
  }

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController image = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: firstName,
              decoration: InputDecoration(hintText: "Enter your first name"),
            ),
            TextField(
              controller: lastName,
              decoration: InputDecoration(hintText: "Enter your last name"),
            ),
            TextField(
              controller: mobile,
              decoration: InputDecoration(hintText: "Enter your phone Number"),
            ),
            TextField(
              controller: image,
              decoration: InputDecoration(hintText: "Enter your image"),
            ),
            ElevatedButton(
              onPressed: () {
                var data = {
                  'firstName': firstName.text,
                  'lastName': lastName.text,
                  'mobile': mobile.text,
                  'image': image.text,
                };

                NetworkHelper().postData(data: data);
              },
              child: Text('SUbmit'),
            ),
            SizedBox(
              height: 30,
            ),
            FutureBuilder(
                future: NetworkHelper().getData(),
                builder: (BuildContext context,
                    AsyncSnapshot<AriticalFetch> snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("FirstName : "),
                                        Text(snapshot
                                            .data!.data![index].firstName!),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("LastName : "),
                                        Text(snapshot
                                            .data!.data![index].lastName!),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("mobile : "),
                                        Text(snapshot
                                            .data!.data![index].mobile!),
                                      ],
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print('delete data');
                                    NetworkHelper().deleteData(
                                        id: snapshot
                                            .data!.data![index].firstName!);
                                  },
                                  child: Icon(
                                    Icons.delete_forever,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ));
                          }),
                    );
                  }

                  return CircularProgressIndicator();
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
