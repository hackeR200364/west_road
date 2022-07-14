import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:west_road/values.dart';

class MapContainer extends StatelessWidget {
  const MapContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Site Office',
                style: TextStyle(
                  color: AppColors.btnColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Image.asset('images/map.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Holding No 1394 SH2,\nBarasat - Barrackpore Rd,\nBarasat, West Bengal 700125',
                    style: TextStyle(fontSize: 11),
                  ),
                  Row(
                    children: [
                      IconButton(
                        splashRadius: 18,
                        onPressed: (() {}),
                        icon: Icon(
                          Icons.copy,
                          color: AppColors.btnColor,
                          size: 15,
                        ),
                      ),
                      IconButton(
                        splashRadius: 18,
                        onPressed: (() {}),
                        icon: Icon(
                          Icons.share,
                          color: AppColors.btnColor,
                          size: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.description,
                      color: AppColors.btnColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'City Office',
                      style: TextStyle(
                        color: AppColors.btnColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  child: Image.asset('images/map.png'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Holding No 1394 SH2,\nBarasat - Barrackpore Rd,\nBarasat, West Bengal 700125',
                    style: TextStyle(fontSize: 11),
                  ),
                  Row(
                    children: [
                      IconButton(
                        splashRadius: 18,
                        onPressed: (() {}),
                        icon: Icon(
                          Icons.copy,
                          color: AppColors.btnColor,
                          size: 15,
                        ),
                      ),
                      IconButton(
                        splashRadius: 18,
                        onPressed: (() {}),
                        icon: Icon(
                          Icons.share,
                          color: AppColors.btnColor,
                          size: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
