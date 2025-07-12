import 'package:flutter/material.dart';

class GlobalTechCard extends StatelessWidget {
  const GlobalTechCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Center(
            child: Container(
              width: 300,
              height: 400,
              child: Stack(
                children: [
                  // Background image container
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Main blue container with notch
                  Positioned(
                    top: 70,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 330,
                      decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          // Notch cutout
                          Positioned(
                            top: 0,
                            left: 30,
                            child: Container(
                              width: 70,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(35),
                                  bottomRight: Radius.circular(35),
                                ),
                              ),
                            ),
                          ),

                          // Content
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Follow button
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.orange[500],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.person_add,
                                            color: Colors.white, size: 16),
                                        SizedBox(width: 5),
                                        Text('Follow',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20),

                                // Title
                                Text(
                                  'GlobalTech Supplies',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height: 10),

                                // Description
                                Text(
                                  'GlobalTech Supplies is a verified international seller specializing in high-quality in high-quality electronics, accessories & smart gadgets.',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 14,
                                    height: 1.4,
                                  ),
                                ),

                                SizedBox(height: 20),

                                // Location
                                Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        color: Colors.white.withOpacity(0.8),
                                        size: 16),
                                    SizedBox(width: 5),
                                    Text(
                                      'Shenzhen, China',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.9),
                                          fontSize: 14),
                                    ),
                                    SizedBox(width: 20),
                                    Icon(Icons.calendar_today,
                                        color: Colors.white.withOpacity(0.8),
                                        size: 16),
                                    SizedBox(width: 5),
                                    Text(
                                      '4+ Years on Sellapp',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.9),
                                          fontSize: 14),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 10),

                                // Rating
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.white.withOpacity(0.8),
                                        size: 16),
                                    SizedBox(width: 5),
                                    Text(
                                      '4.89/89921 Repust in 1hr',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.9),
                                          fontSize: 14),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 20),

                                // Action buttons
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        'Store Product',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        'Store Highlights',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 10),

                                // Discounts
                                Row(
                                  children: [
                                    Icon(Icons.local_offer,
                                        color: Colors.white.withOpacity(0.8),
                                        size: 16),
                                    SizedBox(width: 5),
                                    Text(
                                      'Discounts Available',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.9),
                                          fontSize: 14),
                                    ),
                                  ],
                                ),

                                Spacer(),

                                // Items sold
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '4,301 Items sold',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward,
                                        color: Colors.white, size: 20),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // User profile image in the notch
                  Positioned(
                    top: 50,
                    left: 45,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1494790108755-2616b612b786?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShoppingBag(Color color, double height) {
    return Container(
      width: height * 0.8,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 2,
            left: height * 0.2,
            right: height * 0.2,
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                color: color.withOpacity(0.7),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Example usage
void main() {
  runApp(MaterialApp(
    home: GlobalTechCard(),
    debugShowCheckedModeBanner: false,
  ));
}
