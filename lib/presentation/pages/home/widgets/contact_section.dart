import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../blocs_cubits/contact_section/contact_section_bloc.dart';
import '../../../utils/html_style.dart';
import 'section.dart';

class ContactSection extends StatelessWidget {
  const ContactSection(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Section(
      title: title,
      children: [
        BlocBuilder<ContactSectionBloc, ContactSectionState>(
          builder: (context, state) => state.maybeWhen(
            loading: () => const Center(
              child: SizedBox.square(
                dimension: 75.0,
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
            failure: (failure) => Center(
              child: Text(failure.message ?? 'Unknown Error'),
            ),
            success: (contact) => Html(
              data: contact.description,
              style: {
                'body': Style(
                  margin: Margins.zero,
                  padding: EdgeInsets.zero,
                ),
                ...HtmlStyle.getEffectiveTextStyle(),
              },
            ),
            orElse: () => const SizedBox(),
          ),
        )
      ],
    );
  }
}
