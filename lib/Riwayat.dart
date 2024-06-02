import 'package:final_camp/ProsesKonten.dart';
import 'package:final_camp/R.iwayatKonten.dart';
import 'package:flutter/material.dart';


class Riwayat extends StatelessWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: TabBar(
              indicator: null, 
              labelColor: const Color(0xFF0E2954),
              unselectedLabelColor:const Color(0xFF0E2954),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Riwayat',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Proses',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            RiwayatContent(),
            ProsesContent(),
          ],
        ),
      ),
    );
  }
}

class ProsesContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProsesKonten();
  }
}

class RiwayatContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RiwayatKonten();
  }
}
