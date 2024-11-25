import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/homepage.dart';
import 'package:untitled2/sizeconfig/sizeconig.dart';

class SmoothDeleteButton extends StatelessWidget {
  final int id;
  final Function deleteNoteCallback;

  const SmoothDeleteButton({
    super.key,
    required this.id,
    required this.deleteNoteCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Sizeconig.defaultsize! * 2,
      right: Sizeconig.defaultsize! * 8,
      child: GestureDetector(
        onTapDown: (_) {
          // Add visual feedback when pressed (optional)
        },
        onTap: () async {
          await AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.scale,
            title: 'Warning',
            desc: 'Are you sure you want to delete this note?',
            btnCancelOnPress: () {},
            btnOkOnPress: () async {
              int response = await deleteNoteCallback(id);
              if (response > 0) {
                Get.snackbar(
                  'Success',
                  'Note deleted successfully.',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green.withOpacity(0.8),
                  colorText: Colors.white,
                  duration: Duration(seconds: 2),
                );
                Get.offAll(() => Homepage(), transition: Transition.circularReveal);
              } else {
                Get.snackbar(
                  'Error',
                  'Failed to delete the note.',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red.withOpacity(0.8),
                  colorText: Colors.white,
                  duration: Duration(seconds: 2),
                );
              }
            },
          ).show();
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: AnimatedScale(
            scale: 1.0,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent.withOpacity(0.8),
              ),
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 24.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}