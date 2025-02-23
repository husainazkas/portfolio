import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../blocs_cubits/contact_section/contact_section_bloc.dart';
import 'section.dart';

class ContactSection extends StatelessWidget {
  const ContactSection(this.title, {super.key, this.titleKey});

  final Key? titleKey;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Section(
      titleKey: titleKey,
      title: title,
      children: [
        BlocBuilder<ContactSectionBloc, ContactSectionState>(
          builder:
              (context, state) => state.maybeWhen(
                loading:
                    () => const Center(
                      child: SizedBox.square(
                        dimension: 75.0,
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ),
                failure:
                    (failure) =>
                        Center(child: Text(failure.message ?? 'Unknown Error')),
                success:
                    (contact) => Html(
                      data: contact.description,
                      extensions: [
                        MatcherExtension.inline(
                          matcher: (context) => context.id == 'email',
                          builder:
                              (context) => TextSpan(
                                text: contact.email.trim(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        final url = Uri.parse(
                                          'mailto:${contact.email}',
                                        );
                                        canLaunchUrl(url).then((value) {
                                          if (value) launchUrl(url);
                                        });
                                      },
                              ),
                        ),
                      ],
                      style: {
                        'body': Style(
                          margin: Margins.zero,
                          padding: HtmlPaddings.zero,
                        ),
                      },
                    ),
                orElse: () => const SizedBox(),
              ),
        ),
      ],
    );
  }
}
