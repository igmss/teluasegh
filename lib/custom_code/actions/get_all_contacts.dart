// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

Future<List<ContactStruct>> getAllContacts(
  BuildContext context,
  List<ContactStruct> sampleContactList,
) async {
  // Add your function code here!

  // Check for contacts permission and request if not already granted
  PermissionStatus permissionStatus = await Permission.contacts.status;
  if (permissionStatus != PermissionStatus.granted) {
    permissionStatus = await Permission.contacts.request();
    if (permissionStatus != PermissionStatus.granted) {
      // If permission is denied, return the existing list or empty list.
      // You may also throw an exception or show a dialog to the user.
      return sampleContactList;
    }
  }

  ////

  // Retrieve contacts
  Iterable<Contact> contacts =
      await ContactsService.getContacts(withThumbnails: false);

  // Map the contacts to the ContactStruct format
  List<ContactStruct> newContactList = contacts.map((contact) {
    String? shortName = '';
    if (contact.givenName != null && contact.givenName!.isNotEmpty) {
      shortName += contact.givenName![0];
    }
    if (contact.familyName != null && contact.familyName!.isNotEmpty) {
      shortName += contact.familyName![0];
    }

    String? phoneNumber = contact.phones != null && contact.phones!.isNotEmpty
        ? contact.phones!.first.value
        : '';

    return ContactStruct(
      name: contact.displayName,
      phone: phoneNumber,
      shortName: shortName,
    );
  }).toList();

  // Return the new list
  return newContactList;
}
