import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

import '../assets/components/app_colors.dart';

class FidelityCard extends StatelessWidget {
  const FidelityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.greenSysU,
      child: Center(
        child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                BarcodeWidget(
                  barcode: Barcode. code128(),
                  data: '12345674567876543',
                )
              ],
            )),
      ),
    );
  }
}

// BarcodeWidget(
//                           barcode: Barcode.qrCode(),
//                           data: '${bloc.uuid}',
//                         )
