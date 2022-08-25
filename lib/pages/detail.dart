import 'package:flutter/material.dart';
import '../models/model.dart';
import '../theme.dart';

class Detail extends StatelessWidget {
  final Gundam item;
  Detail({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hitam,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              item.img!,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            ListView(
              children: [
                SizedBox(height: 450),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    color: abu2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 0),
                                  child: Text(
                                    item.nama!,
                                    style: txtPutih.copyWith(fontSize: 22),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text.rich(
                                  TextSpan(
                                    text: 'by ',
                                    style: txtHitam.copyWith(fontSize: 16),
                                    children: [
                                      TextSpan(
                                        text: item.brand,
                                        style: txtPutih.copyWith(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  '${item.rating}',
                                  style: txtPutih,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Description',
                          style: regulerTxt.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: Text(
                          item.deskripsi!,
                          style: txtPutih.copyWith(fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '\$${item.harga}',
                              style: txtPutih.copyWith(fontSize: 24),
                            ),
                            ElevatedButton(
                              child: Text(
                                'Buy Now',
                                style: txtHitam.copyWith(fontSize: 18),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.yellow,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("You pressed buy ;"),
                                ));
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: putih,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: abu1,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  BtnFavorite(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BtnFavorite extends StatefulWidget {
  @override
  State<BtnFavorite> createState() => _BtnFavorite();
}

class _BtnFavorite extends State<BtnFavorite> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: putih,
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}
