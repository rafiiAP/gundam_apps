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
              shrinkWrap: true,
              children: [
                SizedBox(height: 450),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    color: abu2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 6,
                              child: Text(
                                item.nama!,
                                style: txtPutih.copyWith(fontSize: 20),
                              )),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text('${item.rating}',
                                    style: txtPutih.copyWith(fontSize: 16)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text('by  ', style: txtHitam.copyWith(fontSize: 16)),
                          Text(item.brand!,
                              style: txtPutih.copyWith(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        item.deskripsi!,
                        style: txtPutih,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$${item.harga}',
                              style: txtPutih.copyWith(fontSize: 20)),
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
                      SizedBox(height: 40)
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
