import 'package:flutter/material.dart';

class ErrorMessage {
  static void showError(
      GlobalKey<ScaffoldState> key, String message, VoidCallback onClose,
      {String title = "Error!"}) {
    showModalBottomSheet(
      context: key.currentState!.context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.25,
          child: Center(
            child: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              spacing: 16, // gap between adjacent chips
              runSpacing: 16,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: onClose,
                  style: ElevatedButton.styleFrom(
                      elevation: 4.0,
                      textStyle: const TextStyle(color: Colors.white)),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );
    /*
    key.currentState?.showBottomSheet(
      (context) {
        return SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.25,
          child: Center(
            child: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              spacing: 16, // gap between adjacent chips
              runSpacing: 16,
              children: [
                const Text(
                  "Error!",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: onClose,
                  style: ElevatedButton.styleFrom(
                      elevation: 4.0,
                      textStyle: const TextStyle(color: Colors.white)),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );*/
  }
}
