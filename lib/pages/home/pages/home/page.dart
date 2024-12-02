import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelompoktwoo/core/core.dart';
import 'package:kelompoktwoo/pages/home/home.dart';
import 'package:kelompoktwoo/pages/product/pages/index/page.dart';
import 'package:kelompoktwoo/pages/transaction/pages/index/page.dart';

part 'sections/card_section.dart';
part 'sections/card_profile.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';


  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetDataHomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beranda')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Column(
              children: [
                _CardSection(
                  label: 'Total Penjualan',
                  value: state.totalSale.toIDR(),
                  page: const TransactionPage()
                ),
                Dimens.dp16.height,
                _CardSection(
                  label: 'Total Transaksi',
                  value: state.totalTransaction.toString(),
                  page: const TransactionPage(),
                ),
                Dimens.dp16.height,
                _CardSection(
                  label: 'Total Produk',
                  value: '${state.totalProduct}',
                  page: const ProductPage(),
                ),
                Dimens.dp16.height,
                const CardProfile(
                  label: 'API WIDI PRATAMA', 
                  img: 'https://avatars.githubusercontent.com/u/155319274?v=4', 
                  url: 'https://github.com/argonotz',
                  no: '7',
                ),
                Dimens.dp16.height,
                const CardProfile(
                  label: 'AZKHA AMALYA', 
                  img: 'https://avatars.githubusercontent.com/u/140592353?v=4', 
                  url: 'https://github.com/azkhaxirpl2',
                  no: '9',
                ),
                Dimens.dp16.height,
                const CardProfile(
                  label: 'KRISNA MAULANA SAPUTRA', 
                  img: 'https://avatars.githubusercontent.com/u/140592893?v=4', 
                  url: 'https://github.com/kriss987',
                  no: '20',
                ),
                Dimens.dp16.height,
                const CardProfile(
                  label: 'MAHARDIKA SEPTA ARVIL CP', 
                  img: 'https://avatars.githubusercontent.com/u/140592244?v=4', 
                  url: 'https://github.com/Mahardika-XIRPL2',
                  no: '21',
                ),
                Dimens.dp16.height,
                const CardProfile(
                  label: 'RAIZA GHAZALI AR ROSYID', 
                  img: 'https://avatars.githubusercontent.com/u/140592157?v=4', 
                  url: 'https://github.com/raizaghazali-rpl2',
                  no: '29',
                ),
                Dimens.dp16.height,
                const CardProfile(
                  label: 'SAHARANI', 
                  img: 'https://avatars.githubusercontent.com/u/140592245?v=4', 
                  url: 'https://github.com/saharani-XIRPL2',
                  no: '30',
                ),
                Dimens.dp16.height,
              ],
            );
          },
        ),
      ),
    );
  }
}
