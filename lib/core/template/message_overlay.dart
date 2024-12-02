import 'package:flutter/material.dart';

class MessageOverlay {
  static void show(
    BuildContext context, 
    String message,
    {Duration duration = const Duration(seconds: 3)}
  ){
    final orverlay = Overlay.maybeOf(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).viewInsets.top + 50,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ) ,
    );

    orverlay?.insert(overlayEntry);

    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}