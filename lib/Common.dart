import "package:flutter/material.dart";

Widget Navbar(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.width * 0.05,
    color: Colors.black87,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage("assets/logo.png"),
          height: MediaQuery.of(context).size.width * 0.05,
        ),
        SizedBox(width: 10), // Adjust the size as needed
        TextButton(
          onPressed: () {},
          child: Text(
            "Home",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Movies",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Show Times",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Buy Tickets",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Contact Us",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
        SizedBox(
          width: 60,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.pink, // Background color
            onPrimary: Colors.white, // Text color
          ),
          child: Text("Buy Tickets"),
        ),
      ],
    ),
  );
}

Widget footerBar(BuildContext context) {
  return Container(
      height: MediaQuery.of(context).size.width * 0.15,
      color: Colors.black87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage("assets/logo.png"),
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Text(
                      "EPR FILMS & THEATERS",
                      style: TextStyle(
                          fontSize: 27,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Text(
                "© 2024 EPR Movies. All Rights Reserved.",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Home",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Movies",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Show Times",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Buy Tickets",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ));
}
