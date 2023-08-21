
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Giriş Yap')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo eklenmiş widget
            /*Image.asset(
              'lib/pictures/flutter_pic.png', // Logo dosyasının yolu
              width: 200.0, // İstediğiniz genişlik
              height: 200.0, // İstediğiniz yükseklik
            ),*/
            const Icon(
              Icons.account_box_rounded,
              size: 100,),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adı',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Şifre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(

              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => PicPlace()),
                // );
                // Giriş işlemleri burada gerçekleştirilebilir
              },
              child: Text('Giriş Yap'),
            ),

            SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                // Kayıt ekranına yönlendirme işlemleri burada gerçekleştirilebilir
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => RegisterApp()),
                // );
              },
              child: Text('Hesabınız yok mu? Kayıt Olun'),
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child:ElevatedButton.icon(
                      onPressed: () {
                        // Google ile giriş işlemleri burada gerçekleştirilebilir
                      },
                      icon: Icon(Icons.g_mobiledata_rounded),
                      label: Text('Google ile Giriş '),
                    ),
                  ),
                ),
                SizedBox(width: 16.0, height: 15,),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child:ElevatedButton.icon(
                      onPressed: () {
                        // Apple ile giriş işlemleri burada gerçekleştirilebilir
                      },
                      icon: Icon(Icons.apple),
                      label: Text('Apple ile Giriş '),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





