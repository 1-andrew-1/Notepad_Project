import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/homepage.dart';
import 'package:untitled2/sql/sql.dart';
import 'package:untitled2/style/appstyle.dart';

class Updated extends StatefulWidget {
  const Updated({super.key, required this.id, required this.color});
  final int id ;
  final Color color ;
  @override
  State<Updated> createState() => _UpdatedState();
}

class _UpdatedState extends State<Updated> {
  final TextEditingController title = TextEditingController();

  final TextEditingController content = TextEditingController();

  Sql sql = Sql();
  String  date = '' ;
  List<Map> data = [];

  Future<void> readD() async {
    List<Map> response = await sql.readData("SELECT * FROM NOTES WHERE ID = '${widget.id}'");
    setState(() {
      data = response; // Update the data in the state
      title.text = data[0]['NOTES_TILTTLES'] ;
      content.text = data[0]['NOTES_CONTENT'] ;
      date = data[0]['data'] ;
    });
  }

  @override
  void initState() {
    super.initState();
    readD().then((_) {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed:  () async {
       
      //   if (title.text.isEmpty || content.text.isEmpty) {
      //         Get.snackbar('Error', 'Title and content cannot be empty.');
      //         return;
      //       }
      //       int response = await sql.updateData('''
      //         UPDATE NOTES
      //         SET NOTES_TILTTLES = '${title.text}', NOTES_CONTENT = '${content.text}' WHERE ID = "${widget.id}"''' );
      //       if (response > 0) {
      //         Get.snackbar('Success', 'Note Update successfully.' ,);
      //         Get.offAll(() => Homepage());
      //       } else {
      //         Get.snackbar('Error', 'Failed to Update note.');
      //       }
      // } ,
      // child: Icon(Icons.edit, color: Colors.white),
      // ),
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Colors.orange[50] ,
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: ()  async {
        if (title.text.isEmpty || content.text.isEmpty) {
              Get.snackbar('Error', 'Title and content cannot be empty.');
              return;
            }
            int response = await sql.updateData('''
              UPDATE NOTES
              SET NOTES_TILTTLES = '${title.text}', NOTES_CONTENT = '${content.text}' WHERE ID = "${widget.id}"''' );
            if (response > 0) {
              Get.snackbar('Success', 'Note Update successfully.' ,);
              Get.offAll(() => Homepage());
            } else {
              Get.snackbar('Error', 'Failed to Update note.');
            }
          Get.offAll( ()=> Homepage() ) ;// Go back to the previous screen
        },
      ),
      ),
      body:
          Padding(
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
                SizedBox(height: 10) ,
                Text( date , style: Appstyle.datetittle,) ,
                SizedBox(height: 18) ,
                TextField(
                  controller: content ,
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