import 'dart:async';
import 'dart:convert';
import 'package:firebase_admob/firebase_admob.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'package:flutter_web/material.dart';
//import 'package:flutter/main.dart' as app;
//import 'package:flutter_web_ui/ui.dart' as ui;
const appId = 'ca-app-pub-7446695481897843~7104025558';
const adUnitId = 'ca-app-pub-7446695481897843/7137077896';

MobileAdTargetingInfo targetingInfo = new MobileAdTargetingInfo(
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender
      .unknown, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);

BannerAd myBanner = new BannerAd(
  adUnitId: "ca-app-pub-7446695481897843/7137077896",
  targetingInfo: targetingInfo,
  size: AdSize.smartBanner,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

InterstitialAd myInterstitial = new InterstitialAd(
  adUnitId: "ca-app-pub-7446695481897843/1822646814",
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("InterstitialAd event is $event");
  },
);
Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      // await client.get('https://cloud.iexapis.com/stable/stock/market/batch?symbols=CNPF,ICOL,PGX,MORL,EMLC,GYLD,IPFF,SMB,YDIV,YYY,PEY,IEI,TLH,DIA,BSJF,MONY&types=quote,stats&token=');
      await client.get(
    'https://cloud.iexapis.com/stable/stock/market/batch?symbols=PGX,MORL,EMLC,GYLD,IPFF,SMB,YDIV,YYY,PEY,PGF,SNLN,DVHL,AUNZ,MDIV,PHB,PFXF,FPE,TIPX,MLN,SDIV,SIPE,SEMF,EMAG,IEMF,EU,BSCM,LEMF,BSCL,BSCK,BSCJ,BSCI,DSUM,BSCF,KBWD,PCEF,BSCG,BSCH,HYEM,ITM,BKLN,PGHY,IBCE,PZT,IJNK,XMPT,THHY,QYLD,IHY,IYLD,SHYD,PRB,DVHI,GOVT,BSJJ,BSJK,RIGS,INY,IBCD,PZA,PFIG,IBCC,BSCE,PVI,MBG,CXA,FWDB,DIV,CHLC,BSJI,FLTR,PWZ,MUAH,IBDD,PICB,IBDB,BSJH,RVNU,BSJG,IBDC,XOVR,BSJE,EBND,PCY,BWX,SJNK,DES,ANGL,BAB,SST,EMCD,CBND,HYD,PLW,SCPB,FLRN,BWZ,KBWY,ELD,IBND,AOK,RWXL,ITR,DON,DGRS,JNK,TZD,EPU,PFF,HYLD,GGOV,ULST,SPHD,HFIN,DGRW,LWC,ALD,LEMB,AGND,ITIP,EMHY,QLTC,TFI,SRLN,HYLS,SHM,GNMA,CEMB,IGOV,MINC,AGZD,FTSL,SPLV,GHYG,ISTB,ENGN,CMBS,GTIP,SCHO,SMMU,QLTA,SCHZ,HSPX,TUZ,GIY,GSY,TFLO,VMBS,CWB,FLOT,STPZ,MUAC,SCHR,BABZ,HYXU,GMTB,MUNI,WIP,MUAD,QLTB,SCHP,GMMB,MUAE,IPE,NYF,BNDX,MUAF,HYMB,TIPZ,CMF,LAG,ILTB,ITE,CLY,VGSH,VGIT,LTPZ,BABS,HYHG,EMCB,DVYL,VGLT,DHS,TLO,VWOB,IGHG,GLCB,RAVI,VCSH,BSV,BND,BIV,ISHG,SDYL,VCIT,SHY,BLV,HYG,VCLT,TENZ,DTN,BIL,AUD,DLN,DTD,FTSD,CAD,STIP,CORP,HYS,HOLD,TRSY,IEF,IBDA,COBO,BOND,MINT,MBB,CSJ,AGG,SUB,EMB,CIU,GVI,MUB,GBF,TIP,AGZ,CFT,LQD,TLT,IEI,TLH,DIA,BSJF,MONY&types=stats,quote&token=pk_4d1fbc59c1ae4cd1bc3d3221b34e4416',
  );
  //https://cloud.iexapis.com/v1/stock/market/batch?&types=price&symbols=aapl,fb,tsla&token=YOUR_TOKEN_HERE
  //https://cloud.iexapis.com/v1/stock/market/batch?&types=quote&symbols=aapl,fb,tsla&token=
  // Use the compute function to run parsePhotos in a separate isolate.
  //https://cloud.iexapis.com/stable/stock/market/batch?symbols=CNPF,ICOL,PGX,MORL,EMLC,GYLD,IPFF,SMB,YDIV,YYY,PEY,PGF,SNLN,DVHL,AUNZ,MDIV,PHB,PFXF,FPE,TIPX,MLN,SDIV,SIPE,SEMF,EMAG,IEMF,EU,BSCM,LEMF,BSCL,BSCK,BSCJ,BSCI,DSUM,BSCF,KBWD,PCEF,BSCG,BSCH,HYEM,ITM,BKLN,PGHY,IBCE,PZT,IJNK,XMPT,THHY,QYLD,IHY,IYLD,SHYD,PRB,DVHI,GOVT,BSJJ,BSJK,RIGS,INY,IBCD,PZA,PFIG,IBCC,BSCE,PVI,MBG,CXA,FWDB,DIV,CHLC,BSJI,FLTR,PWZ,MUAH,IBDD,PICB,IBDB,BSJH,RVNU,BSJG,IBDC,XOVR,BSJE,EBND,PCY,BWX,SJNK,DES,ANGL,BAB,SST,EMCD,CBND,HYD,PLW,SCPB,FLRN,BWZ,KBWY,ELD,IBND,AOK,RWXL,ITR,DON,DGRS,JNK,TZD,EPU,PFF,HYLD,GGOV,ULST,SPHD,HFIN,DGRW,LWC,ALD,LEMB,AGND,ITIP,EMHY,QLTC,TFI,SRLN,HYLS,SHM,GNMA,CEMB,IGOV,MINC,AGZD,FTSL,SPLV,GHYG,ISTB,ENGN,CMBS,GTIP,SCHO,SMMU,QLTA,SCHZ,HSPX,TUZ,GIY,GSY,TFLO,VMBS,CWB,FLOT,STPZ,MUAC,SCHR,BABZ,HYXU,GMTB,MUNI,WIP,MUAD,QLTB,SCHP,GMMB,MUAE,IPE,NYF,BNDX,MUAF,HYMB,TIPZ,CMF,LAG,ILTB,ITE,CLY,VGSH,VGIT,LTPZ,BABS,HYHG,EMCB,DVYL,VGLT,DHS,TLO,VWOB,IGHG,GLCB,RAVI,VCSH,BSV,BND,BIV,ISHG,SDYL,VCIT,SHY,BLV,HYG,VCLT,TENZ,DTN,BIL,AUD,DLN,DTD,FTSD,CAD,STIP,CORP,HYS,HOLD,TRSY,IEF,IBDA,COBO,BOND,MINT,MBB,CSJ,AGG,SUB,EMB,CIU,GVI,MUB,GBF,TIP,AGZ,CFT,LQD,TLT,IEI,TLH,DIA,BSJF,MONY&types=quote,stats&token=
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  //final parsed = json.decode(responseBody).cast<Map<String,dynamic>>();

  //return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();

  dynamic obj = json.decode(responseBody);
  debugPrint(responseBody, wrapWidth: 1000);
  print(obj.length);

  List<Photo> photoList = [];
  obj.forEach((k, v) => photoList.add(Photo(k, v)));

  return photoList;
}

class Photo {
  String symbol;

  //String companyName;
  dynamic data;

  // dynamic iexClose;
  // dynamic quote;
  Photo(this.symbol, this.data);
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance.initialize(appId: appId);
    myBanner
      // typically this happens well before the ad is shown
      ..load()
      ..show(
        // Positions the banner ad 60 pixels from the bottom of the screen
        anchorOffset: 0.0,
        // Banner Position
        anchorType: AnchorType.bottom,
      );

    myInterstitial
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
      );

    final appTitle = 'Monthly Paying ETFs';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('About'),
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
              ),
            ),
            ListTile(
              title: Text(
                  'This app is to provide the list of ETF s that pay monthly dividend',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'for questions or feedback please contact me at: allenvega@gmail.com  ',
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Spacer(),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.greenAccent,
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class PhotosList extends StatefulWidget {
  final List photos;

  PhotosList({Key key, this.photos})
      : assert(photos != null),
        super(key: key);

  @override
  _PhotosListState createState() => _PhotosListState();
}

class _PhotosListState extends State<PhotosList> {
  @override
  Widget build(BuildContext context) {
    return bodyData();
  }

  SingleChildScrollView bodyData() => SingleChildScrollView(
        scrollDirection: Axis.vertical,

        // padding: EdgeInsets.all(0.0),
        //padding: const EdgeInsets.symmetric(
        //  padding: new EdgeInsets.fromLTRB(0.001, .001, 1.0, 1.0),
        padding: EdgeInsets.all(0.05),

        // child: FittedBox(fit:BoxFit.contain,

        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: DataTable(
              // sortColumnIndex: 1,
              //  sortAscending: true,

              columns: <DataColumn>[
                DataColumn(
                  label: Text("Company",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onSort: (_, __) {
                    setState(() {
                      widget.photos.sort((a, b) => a.data["quote"]
                              ["companyName"]
                          .compareTo(b.data["quote"]["companyName"]));
                    });
                  },
                ),
                DataColumn(
                  label: Text("ttmDivRate",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green)),
                  numeric: true,
                  onSort: (_, __) {
                    setState(() {
                      widget.photos.sort((a, b) => a.data["quote"]
                              ["ttmDividendRate"]
                          .compareTo(b.data["quote"]["ttmDividendRate"]));
                    });
                  },
                ),

                DataColumn(
                  label: Text("Ticker",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green)),
                  numeric: true,
                  onSort: (_, __) {
                    setState(() {
                      widget.photos.sort((a, b) => a.data["quote"]
                      ["symbol"]
                          .compareTo(b.data["quote"]["symbol"]));
                    });
                  },
                ),
                DataColumn(
                  label: Text("Price",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green)),
                  numeric: true,
                  onSort: (_, __) {
                    setState(() {
                      widget.photos.sort((a, b) => a.data["quote"]
                              ["latestPrice"]
                          .compareTo(b.data["quote"]["latestPrice"]));
                    });
                  },
                ),
                DataColumn(
                  label: Text("Next Dividend",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  numeric: true,
                  onSort: (_, __) {
                    setState(() {
                      widget.photos.sort((a, b) => a.data["quote"]
                              ["nextDividendDate"]
                          .compareTo(b.data["quote"]["nextDividendDate"]));
                    });
                  },
                ),
                DataColumn(
                  label: Text("ExDividend",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  numeric: true,
                  onSort: (_, __) {
                    setState(() {
                      widget.photos.sort((a, b) => a.data["quote"]
                              ["exDividendDate"]
                          .compareTo(b.data["quote"]["exDividendDate"]));
                    });
                  },
                ),
              ],

              rows: widget.photos
                  .map(
                    (photo) => DataRow(
                      cells: [
                        DataCell(
                          Text(
                            '${photo.data["stats"]["companyName"] ?? ""}',
                          ),
                        ),

                        DataCell(
                          Text(
                            '${photo.data["stats"]["ttmDividendRate"] ?? ""}',
                          ),
                        ),

                        DataCell(
                          Text(
                            '${(photo.data["quote"] != null ? photo.data["quote"]["symbol"] : "") ?? ""}',
                          ),
                        ),
//["quote"]["stats"]
                        DataCell(
                          Text(
                            '${(photo.data["quote"] != null ? photo.data["quote"]["latestPrice"] : "") ?? ""}',
                          ),
                        ),

                        DataCell(
                          Text(
                            '${(photo.data["stats"] != null ? photo.data["stats"]["nextDividendDate"] : "") ?? ""}',
                          ),
                        ),

                        DataCell(
                          Text(
                            '${(photo.data["stats"] != null ? photo.data["stats"]["exDividendDate"] : "") ?? ""}',
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );
}
