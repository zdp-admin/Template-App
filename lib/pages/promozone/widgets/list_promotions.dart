import 'package:template/Services/navigation_service.dart';
import 'package:template/Services/setup_service.dart';
import 'package:template/models/promotion.dart';
import 'package:template/pages/promozone/bloc/promo_zone_bloc.dart';
import 'package:template/utils/app_settings.dart';
import 'package:flutter/material.dart';

Widget listPromotions(BuildContext context, PromoZoneBloc bloc) {
  String linkImage = appService<AppSettings>().linkImagePz;

  return StreamBuilder(
    stream: bloc.loadingStream,
    builder: (BuildContext ctxLoading, AsyncSnapshot<bool> snapshot) {
      if (snapshot.data ?? true) {
        return Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.pinkAccent)),
        );
      }

      return StreamBuilder(
        stream: bloc.listPromotionsStream,
        builder: (BuildContext ctx, AsyncSnapshot<List<Promotion>> sht) {
          if (!sht.hasData) {
            return Center(child: Text('Sin resultados'));
          }

          return ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext ctxList, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 25),
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: 400,
                  child: GestureDetector(
                    onTap: () {
                      appService<NavigationService>().navigateTo(
                          'details-promotion',
                          arguments: sht.data[index]);
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: double.infinity,
                              height: 60,
                              child: Row(children: [
                                Container(
                                  child: SizedBox(
                                    width: 60,
                                    child: Image.network(
                                        '$linkImage${sht.data[index].logo}'),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                    child: Text(sht.data[index].branchOffice))
                              ]),
                            ),
                            Expanded(
                              child: Center(
                                  child: FadeInImage(
                                image: NetworkImage(
                                    '$linkImage${sht.data[index].image}'),
                                placeholder: AssetImage(
                                    'assets/images/default_image.png'),
                                fit: BoxFit.cover,
                                imageErrorBuilder: (BuildContext ctxerror,
                                    Object obj, StackTrace stack) {
                                  return Image(
                                      image: AssetImage(
                                          'assets/images/default_image.png'),
                                      fit: BoxFit.cover);
                                },
                              )),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              height: 45,
                              child: Text(sht.data[index].title),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: sht.data.length);
        },
      );
    },
  );
}
