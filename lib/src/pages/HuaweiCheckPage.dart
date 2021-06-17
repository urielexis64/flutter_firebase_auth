import 'package:flutter/material.dart';

import 'package:flutter_hms_gms_availability/flutter_hms_gms_availability.dart';

class HuaweiCheckPage extends StatefulWidget {
  @override
  _HuaweiCheckPageState createState() => _HuaweiCheckPageState();
}

class _HuaweiCheckPageState extends State<HuaweiCheckPage> {
  bool gms = false, hms = false;

  @override
  void initState() {
    super.initState();
    checkAvailability();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HMS/GMS'),
      ),
      body: Center(
        child: Text('GMS Available:  $gms\nHMS Available:  $hms'),
      ),
    );
  }

  // Verificamos la disponibilidad tanto de los servicios de Google como los de Huawei
  // y actualizamos el estado
  void checkAvailability() {
    FlutterHmsGmsAvailability.isGmsAvailable.then((t) {
      setState(() {
        this.gms = t;
      });
    });
    FlutterHmsGmsAvailability.isHmsAvailable.then((t) {
      setState(() {
        this.hms = t;
      });
    });
  }
}
