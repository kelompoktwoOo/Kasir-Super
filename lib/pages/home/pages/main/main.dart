import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelompoktwoo/core/core.dart';
import 'package:kelompoktwoo/pages/home/home.dart';
import 'package:kelompoktwoo/pages/pos/pos.dart';
import 'package:kelompoktwoo/pages/product/product.dart';
import 'package:kelompoktwoo/pages/settings/pages/pages.dart';
import 'package:kelompoktwoo/pages/transaction/pages/pages.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    const pages = [
      HomePage(),
      TransactionPage(),
      POSPage(),
      ProductPage(),
      SettingsPage(),
    ];

    return BlocBuilder<BottomNavBloc, int>(
      builder: (context, index) {
        return Scaffold(
          body: pages[index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              context.read<BottomNavBloc>().add(TapBottomNavEvent(value));
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(AppIcons.storefront),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.receipt),
                label: 'Transaksi',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.pos),
                label: 'POS',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.product),
                label: 'Produk',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.settings),
                label: 'Lainnya',
              ),
            ],
          ),
        );
      },
    );
  }
}
