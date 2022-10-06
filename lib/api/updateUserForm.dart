import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/color_utils.dart';

class updateUserForm extends StatefulWidget {
  // late String titleText, descriptionText, dateValue;

  updateUserForm(
      {Key? key,
      required this.titleText,
      required this.descriptionText,
      required this.dateValue})
      : super(key: key);

  final String titleText;
  final String descriptionText;
  final String dateValue;

  @override
  State<updateUserForm> createState() => _updateUserFormState(
      titleText: titleText,
      descriptionText: descriptionText,
      dateValue: dateValue);
}

class _updateUserFormState extends State<updateUserForm> {
  // var titleText = 'Task';

  // String titleText, descriptionText, dateValue;/

  _updateUserFormState(
      {Key? key,
      required this.titleText,
      required this.descriptionText,
      required this.dateValue});
  // : super(key: key);

  late final String titleText;
  final String descriptionText;
  final String dateValue;

  // final CollectionReference _update_val =
  //     FirebaseFirestore.instance.collection('TodoList');

  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  TextEditingController _dateController = new TextEditingController();

  final bool _validateTitle = false;
  final bool _validateDescription = false;
  final bool _validateDate = false;

  // ################## ---------------------------

  updateToDo() {
    // final documentReference =
    // FirebaseFirestore.instance.collection("TodoList");

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("TodoList").doc(titleText);

    // final reference_id = FirebaseFirestore.instance.collection("TodoList").id;

    Map<String, String> todoList = {
      "todoTitle": _titleController.text,
      // "todoTitle": titleText,
      "todoDesc": _descriptionController.text,
      "todoDate": _dateController.text,
    };

    documentReference
        .update(todoList)
        .whenComplete(() => print("Data stored successfully $todoList"));

    print('Title_is:');
    print(todoList["todoTitle"]);
    print(todoList["todoDesc"]);
    print(todoList["todoDate"]);
  }

  //
  // // #################################
  //
  @override
  Widget build(BuildContext context) {
    print('Received_Title_is:$titleText');
    print('Received_Description_is:$descriptionText');
    print('Received_Date_is:$dateValue');
    final style = TextStyle(fontSize: 25);

    _titleController.text = titleText;
    _descriptionController.text = descriptionText;
    _dateController.text = dateValue;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          children: [
            Text(
              'Update Todo List',
              style: GoogleFonts.pacifico(textStyle: style),
            ),
          ],
        ),
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
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
              hexStringToColor("9546C4"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 100.0,
              ),
              TextField(
                  controller: _titleController,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.title_outlined,
                      color: Colors.white70,
                    ),
                    labelStyle:
                        TextStyle(color: Colors.white70.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                    errorText:
                        _validateTitle ? 'Title Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _descriptionController,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.description_outlined,
                      color: Colors.white70,
                    ),
                    labelStyle:
                        TextStyle(color: Colors.white70.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                    errorText: _validateDescription
                        ? 'Description Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _dateController,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.date_range_outlined,
                      color: Colors.white70,
                    ),
                    // labelText: dateValue,
                    labelStyle:
                        TextStyle(color: Colors.white70.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                    errorText:
                        _validateDate ? 'Date Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        print('Update Text Button');
                      },
                      child: OutlinedButton(
                        // onPressed: updateToDo,
                        onPressed: () {
                          updateToDo();
                          Navigator.pop(context);
                          print('Update Details');
                        },
                        // _titleController.clear();
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0))),
                        ),
                        child: const Text(
                          "Update",
                          style: TextStyle(fontSize: 18, color: Colors.white70),
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        print('Clear Button');
                      },
                      child: OutlinedButton(
                        onPressed: () {
                          print('Clear Details');
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0))),
                        ),
                        child: const Text(
                          "  Clear  ",
                          style: TextStyle(fontSize: 18, color: Colors.white70),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
