import 'package:fci_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "3.1".tr,
            style: AppTextStyles.bodyText,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          // ⬅️ وضع الأيقونة على اليمين بدلاً من اليسار
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Image.asset("assets/images/fci_logo_1.png"),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // 🔹 بانر التعليم
              SizedBox(
                height: 250,
                child: Container(
                  height: 123,
                  width: 396,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF074F83), Color(0xFF0C8CE9)],
                    ),
                  ),
                  child: OverflowBox(
                    maxWidth: double.infinity, // السماح للصورة بالخروج أفقياً
                    maxHeight: double.infinity, // السماح للصورة بالخروج عمودياً
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/bro.svg"),
                  ),
                ),
              ),

              AppGaping.kGap20,

              // 🔹 اختيار الفرقة الدراسية
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.blue, width: 1.5),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.settings,
                        color: Colors.blue), // ⬅️ وضع الأيقونة في اليمين
                    Text(
                      "الفرقة الثالثة",
                      style: GoogleFonts.cairo(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              AppGaping.kGap30,

              SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    List<Map<String, dynamic>> items = [
                      {"icon": Icons.qr_code, "label": "الحضور"},
                      {"icon": Icons.event_note, "label": "التقويم"},
                      {"icon": Icons.code, "label": "البرمجة"},
                      {"icon": Icons.settings, "label": "الإعدادات"},
                      {"icon": Icons.add, "label": "إضافة"},
                    ];
                    return Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          radius: 25,
                          child: Icon(items[index]["icon"],
                              color: Colors.blue, size: 28),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          items[index]["label"],
                          style: GoogleFonts.cairo(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ],
                    );
                  },
                ),
              ),

              AppGaping.kGap100,

              // 🔹 الدورات الدراسية (تم قلب الترتيب)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CourseCard(
                      title: "الشبكات العصبية",
                      image: "assets/images/neural_networks.png"),
                  CourseCard(
                      title: "الحكومة الإلكترونية",
                      image: "assets/images/e_government.png"),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz), label: "المزيد"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "الشخصية"),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: "الجدول"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
        ],
      ),
    );
  }
}

// ✅ ويدجت مخصصة لكروت الدورات الدراسية
class CourseCard extends StatelessWidget {
  final String title;
  final String image;

  const CourseCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.7)
              ],
            ),
          ),
          child: Text(
            title,
            style: GoogleFonts.cairo(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
