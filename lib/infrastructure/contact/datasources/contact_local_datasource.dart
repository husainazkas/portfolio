import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../domain/contact/entities/contact.dart';
import '../../../domain/core/failures.dart';

abstract class IContactLocalDatasource {
  Future<Contact> getContact();
}

class AssetsContactLocalDatasource implements IContactLocalDatasource {
  @override
  Future<Contact> getContact() async {
    try {
      final result = await rootBundle.loadString('assets/data/contact.json');

      return Contact.fromJson((jsonDecode(result) as Map).cast());
    } catch (e) {
      throw Failure.local(code: -1, message: e.toString());
    }
  }
}
