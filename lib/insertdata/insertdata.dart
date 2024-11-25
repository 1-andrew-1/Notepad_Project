import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/homepage.dart';
import 'package:untitled2/sql/sql.dart';
import 'package:untitled2/style/appstyle.dart';

class Insertdata extends StatefulWidget {
  const Insertdata({super.key});

  @override
  State<Insertdata> createState() => _InsertdataState();
}

class _InsertdataState extends State<Insertdata> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  String getFormattedDateTime() {
    DateTime now = DateTime.now();
    String formattedDate =
        DateFormat('MMMM dd, yyyy').format(now); // e.g., October 12, 2024
    String formattedTime = DateFormat('hh:mm a').format(now); // e.g., 03:45 PM
    return '$formattedDate at $formattedTime'; // Combine date and time
  }

  @override
  Widget build(BuildContext context) {
    Sql sql = Sql();
    String currentDateTime = getFormattedDateTime();
    return Scaffold(
      backgroundColor: Colors.amber[50],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (title.text.isEmpty || content.text.isEmpty) {
              Get.snackbar('Error', 'Title and content cannot be empty.');
              return;
            }
            int response = await sql.insertData(
             '''INSERT INTO NOTES (`NOTES_TILTTLES`, `NOTES_CONTENT`, `data`) 
            VALUES ("${title.text}", "${content.text}","$currentDateTime") ''' , 
          );
            if (response > 0) {
              Get.snackbar('Success', 'Note added successfully.');
              Get.offAll(() => Homepage());
            } else {
              Get.snackbar('Error', 'Failed to add note.');
            }
        },
        child: Icon(Icons.save_as),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber[50],
        title: Text('Add a new Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: title,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ' Title',
                ),
                style: Appstyle.maintittle,
              ),
              SizedBox(height: 10),
              Text(
                currentDateTime,
                style: Appstyle.datetittle,
              ),
              SizedBox(height: 18),
              TextField(
                controller: content,
                keyboardType: TextInputType.multiline,
                maxLines: null, // Allows unlimited lines
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ' Content',
                ),
                style: Appstyle.maincontent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
