import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void showLicenseImagesDialog(BuildContext context, List<dynamic>? licenses) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('License Images'),
        content: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          height: MediaQuery.sizeOf(context).height *
              0.6, // Adjust height as needed
          child: licenses != null && licenses.isNotEmpty
              ? ListView.builder(
                  itemCount: licenses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CachedNetworkImage(
                          fit: BoxFit.fill, imageUrl: licenses[index]),
                    );
                  },
                )
              : const Text('No licenses found'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}
