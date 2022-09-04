import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/color_utils.dart';

class updateUserForm extends StatelessWidget {
  String titleText, descriptionText, dateValue;

  // updateUserForm(this.titleText, this.descriptionText,
  //     this.dateValue); // final MyHomePage show_details;
  //

  updateUserForm(
      {Key? key,
      required this.titleText,
      required this.descriptionText,
      required this.dateValue})
      : super(key: key);

  // updateUserForm({Key? key, required String title}) : super(key: key);

  // const updateUserForm(this.show_details, {Key? key, required String title}) : super(key: key);
  // String title;
  //
  // updateUserForm(this.title);

//   @override
//   State<updateUserForm> createState() => _updateUserFormState();
// }
//
// class _updateUserFormState extends State<updateUserForm> {

  // var titleText = 'Task';

  // final CollectionReference _update_val =
  //     FirebaseFirestore.instance.collection('TodoList');

  // TextEditingController _titleController = new TextEditingController();
  // TextEditingController _descriptionController = new TextEditingController();
  // TextEditingController _dateController = new TextEditingController();

  final bool _validateTitle = false;
  final bool _validateDescription = false;
  final bool _validateDate = false;
  //

  @override
  Widget build(BuildContext context) {
    print('Received_Title_is:$titleText');
    print('Received_Description_is:$descriptionText');
    print('Received_Date_is:$dateValue');
    // var barColor2 = Color(0xff4568dc);
    // var barColor2 = Color(0xff5b86e5);
    // var barColor2 = Color(0xff667eea);
    final style = TextStyle(fontSize: 25);
    // final style = TextStyle(fontSize: 45, fontWeight: FontWeight.bold);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // backgroundColor: barColor2,
        title: Column(
          children: [
            Text(
              'Update Todo List',
              // style: GoogleFonts.tangerine(textStyle: style),
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
                  // controller: _titleController,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.title_outlined,
                      color: Colors.white70,
                    ),
                    labelText: titleText,
                    // labelText: 'Title',
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
              // reusableTextField(
              //     "Title", Icons.title_outlined, false, _titleController),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  // controller: _descriptionController,
                  // onTap: () {
                  //   print('titleText_is:${titleText}');
                  // },
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.description_outlined,
                      color: Colors.white70,
                    ),
                    labelText: descriptionText,
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
              // reusableTextField("Description", Icons.description_outlined,
              //     false, _descriptionController),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  // controller: _dateController,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.date_range_outlined,
                      color: Colors.white70,
                    ),
                    labelText: dateValue,
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
              // reusableTextField(
              //     "Date", Icons.date_range_outlined, false, _dateController),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // MainAxisAlignment = MainAxisAlignment.spaceBetween,
                  TextButton(
                      onPressed: () {
                        print('Update Text Button');
                      },
                      child: OutlinedButton(
                        onPressed: () {
                          print('Update Details');
                        },
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
