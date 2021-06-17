import 'package:flutter/material.dart';
import 'package:template/Services/rest_service.dart';
import 'package:template/Services/setup_service.dart';
import 'package:template/models/branch_office.dart';
import 'package:template/models/promotion.dart';
import 'package:template/pages/detailspromotions/widgets/background_content.dart';
import 'package:template/pages/detailspromotions/widgets/info_content.dart';
import 'package:template/utils/app_settings.dart';

class DetailsPromotionPage extends StatefulWidget {
  @override
  DetailsPromotionState createState() => DetailsPromotionState();
}

class DetailsPromotionState extends State<DetailsPromotionPage> {
  BranchOffice branchOffice;
  bool loading = false;
  Promotion promotion;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    promotion = ModalRoute.of(context).settings.arguments as Promotion;

    if (this.branchOffice == null) {
      fetchBranchOffice(promotion.idEstablishment);
    }
  }

  void fetchBranchOffice(int id) {
    setState(() {
      this.loading = true;
    });

    appService<RestService>()
        .getBranchOffice(id)
        .then((value) => {
              setState(() {
                this.branchOffice = value;
              })
            })
        .catchError((onError) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        duration: Duration(seconds: 3),
        content: Text(
            onError is String ? onError : 'Error al consultar la información'),
      ));
    }).whenComplete(() {
      setState(() {
        this.loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String linkImage = appService<AppSettings>().linkImagePz;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Promo Zone'),
      ),
      body: Stack(
        children: [
          backgroundContent(context, '$linkImage${promotion.image}'),
          infoContent(context, promotion, '$linkImage${promotion.logo}',
              branchOffice, loading)
        ],
      ),
    );
  }
}
