import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelompoktwoo/core/core.dart';
import 'package:kelompoktwoo/pages/home/home.dart';
import 'package:kelompoktwoo/pages/transaction/transaction.dart';
import 'package:qr_flutter/qr_flutter.dart';

part 'sections/qr_section.dart';

class POSQrPage extends StatelessWidget {
  const POSQrPage({super.key});

  static const routeName = '/pos/qr';

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
      child: BlocListener<TransactionBloc, TransactionState>(
        listener: (context, state) {
          if (state.status == Status.processed &&
              state.item?.type == TypeEnum.paid) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              SuccessTransactionPage.routeName,
              (route) => false,
              arguments: state.item?.referenceId,
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Kode Pembayaran')),
          body: ListView(
            padding: const EdgeInsets.all(Dimens.dp16),
            children: const [
              _QRSection(),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(Dimens.dp16),
            child: ElevatedButton(
              onPressed: () {
                context.read<TransactionBloc>().add(CekQRTransactionEvent());
              },
              child: const Text('Cek Status Pembayaran'),
            ),
          ),
        ),
      ),
    );
  }
}
