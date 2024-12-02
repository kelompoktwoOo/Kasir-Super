import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelompoktwoo/core/core.dart';
import 'package:kelompoktwoo/pages/home/home.dart';
import 'package:kelompoktwoo/pages/settings/settings.dart';
import 'package:kelompoktwoo/pages/transaction/transaction.dart';
import 'package:screenshot/screenshot.dart';

part 'sections/action_section.dart';
part 'sections/heading_section.dart';
part 'sections/type_section.dart';
part 'sections/order_section.dart';
part 'sections/detail_section.dart';

class SuccessTransactionPage extends StatelessWidget {
  const SuccessTransactionPage({super.key, required this.referenceId});

  final String referenceId;

  static const routeName = '/transaction/success';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: Navigator.canPop(context),
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            HomePage.routeName,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Transaksi Berhasil')),
        body: ListView(
          children: const [
            _HeadingSection(),
            Divider(thickness: 8),
            _TypeSection(),
            Divider(thickness: 8),
            _OrderSection(),
            Divider(thickness: 8),
            _DetailSection(),
          ],
        ),
        bottomNavigationBar: const _ActionSection(),
      ),
    );
  }
}
