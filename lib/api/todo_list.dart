import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/api/updateUserForm.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../screens/signin_screen.dart';
import '../utils/color_utils.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage(
  //     {Key? key,
  //     required this.title,
  //     required this.description,
  //     required this.date})
  //     : super(key: key);

  // final String title;
  // final String description;
  // final String date;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

  updateList(String title, String description, String date) {}
}

class _MyHomePageState extends State<MyHomePage> {
  List todos = List.empty();
  String title = "";
  String description = "";

  TextEditingController _date = TextEditingController();

  @override
  void initState() {
    super.initState();
    todos = ["Hello", "Hey There"];
  }

  createToDo() {
    DocumentReference documentReference =
        // FirebaseFirestore.instance.collection("MyTodos").doc(title);
        FirebaseFirestore.instance.collection("TodoList").doc(title);

    Map<String, String> todoList = {
      "todoTitle": title,
      "todoDesc": description,
      "todoDate": _date.text,
    };

    documentReference
        .set(todoList)
        .whenComplete(() => print("Data stored successfully $todoList"));
    // I/flutter ( 4869): Data stored successfully {todoTitle: Iphone, todoDesc: this iPhone is 85000}
  }

  deleteTodo(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("TodoList").doc(item);

    documentReference
        .delete()
        .whenComplete(() => print("deleted successfully"));
  }

  CollectionReference TodoList =
      FirebaseFirestore.instance.collection('TodoList');

  Future<void> updateList(id, title, description, _date) {
    return TodoList.doc(id)
        .update(
            {'todoTitle': title, 'todoDesc': description, 'todoDate': _date})
        .then((value) => print("List Updated"))
        .catchError((error) => print("Failed to update List: $error"));
  }

  @override
  Widget build(BuildContext context) {
    // var barColor2 = Color(0xff753a88);
    // final style = TextStyle(fontSize: 25, fontStyle: FontStyle.italic);
    // final style = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
    final style = TextStyle(fontSize: 25);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // My Todo List
        // title: Text(widget.title),
        title: Center(
          child: Text(
            'My Todo List',
            textAlign: TextAlign.center,
            style: GoogleFonts.pacifico(textStyle: style),
            // style: GoogleFonts.sourceSerifPro(textStyle: style),
            // style: GoogleFonts.libreBaskerville(textStyle: style),
            // style: GoogleFonts.lora(textStyle: style),
            // style: GoogleFonts.arsenal(textStyle: style),
            // style: TextStyle(
            //   fontSize: 23,
            //   fontStyle: FontStyle.italic,
            // ),
            // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        // backgroundColor: Colors.lightBlue,
        // backgroundColor: barColor2,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () {
              print('Go to signin screen');
              print('Signed Out');

              FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              hexStringToColor("5E61F4"),
              hexStringToColor("9546C4"),
              hexStringToColor("9543C4"),
              hexStringToColor("5E61F4"),
              hexStringToColor("9546C4"),
              hexStringToColor("CB2B93"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("TodoList").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              } else if (snapshot.hasData || snapshot.data != null) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      QueryDocumentSnapshot<Object?>? documentSnapshot =
                          snapshot.data?.docs[index];
                      return Dismissible(
                          key: Key(index.toString()),
                          child: Card(
                            margin: EdgeInsets.all(5),
                            elevation: 5,
                            child: Container(
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Center(
                                      child: Text((documentSnapshot != null)
                                          ? (documentSnapshot["todoTitle"])
                                          : ""),
                                    ),
                                    subtitle: Column(
                                      children: [
                                        Text((documentSnapshot != null)
                                            ? ((documentSnapshot["todoDesc"] !=
                                                    null)
                                                ? documentSnapshot["todoDesc"]
                                                : "")
                                            : ""),
                                        Text((documentSnapshot != null)
                                            ? ((documentSnapshot["todoDate"] !=
                                                    null)
                                                ? documentSnapshot["todoDate"]
                                                : "")
                                            : ""),
                                      ],
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.edit),
                                          color: Colors.blue,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                // google sign in
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        updateUserForm()));
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          color: Colors.red,
                                          onPressed: () {
                                            setState(() {
                                              deleteTodo(
                                                  (documentSnapshot != null)
                                                      ? (documentSnapshot[
                                                          "todoTitle"])
                                                      : "");
                                              print('delete datas:');
                                              print(documentSnapshot![
                                                  "todoTitle"]);
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    });
              }
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.red,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Add Floading Button');
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  title: Center(
                    child: const Text("Add Todo"),
                  ),
                  content: Container(
                    width: 500,
                    height: 200,
                    child: SingleChildScrollView(
                      // scroll option disable
                      // physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (String value) {
                              title = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'Title',
                            ),
                          ),
                          TextField(
                            onChanged: (String value) {
                              description = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'Description',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: TextField(
                              controller: _date,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.calendar_today_rounded),
                                // hintText: 'Enter Name',
                                labelText: 'Date',
                              ),
                              onTap: () async {
                                print('date_is:$_date');
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2025),
                                );
                                if (pickedDate != null) {
                                  setState(() {
                                    // _date.text = DateFormat('yyy-MM-dd')
                                    _date.text = DateFormat('dd-MM-yyy')
                                        .format(pickedDate);
                                    print('date_is1:');
                                    print(_date.text);

                                    // _date.text = DateF'yyy-MM-dd').format(pickedDate);
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          print('new record added');
                          setState(() {
                            //todos.add(title);
                            createToDo();
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("Add"))
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
