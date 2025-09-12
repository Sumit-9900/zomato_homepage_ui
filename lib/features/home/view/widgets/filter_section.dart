import 'package:flutter/material.dart';
import 'package:zomato_ui/core/constants/app_constants.dart';
import 'package:zomato_ui/features/home/models/category.dart';
import 'package:zomato_ui/features/home/view/widgets/category_chip.dart';
import 'package:zomato_ui/features/home/view/widgets/new_offer.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final filterCategories = [
      Category(
        title: 'Chicken',
        imagePath:
            'https://imgs.search.brave.com/tle4qQcWNT8aHJ-ncHh11wTMMgR2IYJ1Mp3dxPd0KHg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTc3/MTI2NTQxL3Bob3Rv/L2luZGlhbi1jaGlj/a2VuLWphbGZyZXpp/LWN1cnJ5LmpwZz9z/PTYxMng2MTImdz0w/Jms9MjAmYz1sT2tt/UmlCRm92cEtXNUZB/OWhuMF95WGc1SE9U/eDc4Q2FuNEUzSmF2/cEZFPQ',
      ),
      Category(
        title: 'Hyderabadi',
        imagePath:
            'https://imgs.search.brave.com/8mNKLYAksPK78uWay6ztiUUJbgds85TC_5OymZS-X9I/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTMw/MDAwNzQ4Ny9waG90/by9jaGlja2VuLWJp/cnlhbmktb24tYmxh/Y2stYmFja2dyb3Vu/ZC1zcGljeS1pbmRp/YW4taGFuZGktYmly/eWFuaS5qcGc_cz02/MTJ4NjEyJnc9MCZr/PTIwJmM9emRzbGNs/QWU1cEZrYXZkMHk4/WHA0aFdUN0xEVl9v/cWtWZWE2R0pwSGV0/UT0',
      ),
      Category(
        title: 'Egg',
        imagePath:
            'https://imgs.search.brave.com/NrciNzRW0tPOUwNAvDxYeLO1vwSJRpMm6qDKygR9ziE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvOTc5/OTY3MzAyL3Bob3Rv/L2VnZy1iaXJ5YW5p/LWJhc21hdGktcmlj/ZS1jb29rZWQtd2l0/aC1tYXNhbGEtcm9h/c3RlZC1lZ2dzLWFu/ZC1zcGljZXMtYW5k/LXNlcnZlZC13aXRo/LXlvZ3VydC5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9YVd1/Rk03OUVQQU5pLVVt/eUF0NUlBS3VvZFkz/RzF6MUpqMUhocXZX/R1A2Zz0',
      ),
      Category(
        title: 'Dum',
        imagePath:
            'https://imgs.search.brave.com/7AXi5Az7FQSpsw2ULrzUqKAwy5MzvC69LAw-Nc_IPZk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90aHVt/YnMuZHJlYW1zdGlt/ZS5jb20vYi9oeWRy/YWJhZGktbXV0dG9u/LWR1bS1iaXJ5YW5p/LWNvcmlhbmRlci1j/YXNoZXctc2VydmVk/LWRpc2gtaXNvbGF0/ZWQtZGFyay1iYWNr/Z3JvdW5kLXRvcC12/aWV3LWluZGlhbi1z/cGljZXMtMzI3Nzk2/NTA1LmpwZw',
      ),
      Category(
        title: 'Ambur',
        imagePath:
            'https://imgs.search.brave.com/9GT1Kt8TnxSLIS8P_7SYZQjH0Z9olyk3n_J7dpKRFpg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9n/cmlsbGVkLXNlYWZv/b2QtcGFlbGxhLWdv/dXJtZXQtaGVhbHRo/eS1tZWFsLWdlbmVy/YXRlZC1ieS1haV8x/ODg1NDQtMzkyNTMu/anBnP3NlbXQ9YWlz/X2h5YnJpZCZ3PTc0/MCZxPTgw',
      ),
      Category(
        title: 'Chicken 65',
        imagePath:
            'https://imgs.search.brave.com/QonHGAgqCzxHlfXKPEscBUVV7s1qhr1vCGBvObv5Cwk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90aHVt/YnMuZHJlYW1zdGlt/ZS5jb20vYi9jaGlj/a2VuLWJpcnlhbmkt/YmxhY2stYmFja2dy/b3VuZC04ODU2NTAw/OC5qcGc',
      ),
      Category(
        title: 'Awadhi',
        imagePath:
            'https://imgs.search.brave.com/OoBe9mSq851KQKebnn2n6lbIgKnGq5a7oewuKf241_Y/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMjE4/Nzk2Mzg4MS9waG90/by9iaXJ5YW5pLmpw/Zz9zPTYxMng2MTIm/dz0wJms9MjAmYz1y/UnFjMXBpSk95N0Q3/U3ROZ1VVeUk4YnFS/TEhieEZ0NE1QNFVJ/WGdqc2NBPQ',
      ),
    ];

    final offers = [
      'Under ${AppConstants.indianRuppee}200',
      'Under 30 mins',
      'Great Offers',
      'Rating 4.0+',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Chip(
                avatar: Image.asset(
                  AppConstants.filterIcon,
                  color: Colors.white,
                ),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Filters',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10),
                    Image.asset(
                      AppConstants.dropDownImage,
                      color: Colors.white,
                      width: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6.0),
              ...filterCategories.map((filterCategory) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: CategoryChip(filterCategory: filterCategory),
                );
              }),
            ],
          ),
          Row(
            children: [
              Chip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NewOffer(),
                    const SizedBox(width: 6),
                    Text(
                      'Meals under ${AppConstants.indianRuppee}300',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12.0),
              Chip(
                avatar: Image.asset(AppConstants.discountOfferImage),
                label: Text(
                  'Flat 50% OFF',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Chip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Schedule',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10),
                    Image.asset(
                      AppConstants.dropDownImage,
                      color: Colors.white,
                      width: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6.0),
              ...offers.map((offer) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Chip(
                    label: Text(
                      offer,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
