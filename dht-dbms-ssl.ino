#include <WiFi.h>
#include <DHT.h>
#include <WiFiMulti.h>
#include <HTTPClient.h>
#include <WiFiClientSecure.h>

WiFiMulti WiFiMulti;
//WiFiClientSecure WiFiMulti;


// Config Firebase
#define FIREBASE_HOST "formal-fragment-418.firebaseio.com"
#define FIREBASE_AUTH "m0bZRhVzdWWYKruxywEavd6nbSXsMid5Z2xExXIo"

// Config connect WiFi

#define WIFI_SSID "kk"
#define WIFI_PASSWORD "12345678"
//const char* fingerprint = "‎34 71 28 06 70 65 fe 5f cc 44 81 bd c5 ce d1 07 c9 a0 89 16";
//#define fingerprint  "0F F3 11 3B 2C 5D 84 B0 B8 28 19 0A 8D AF BA 37 CF ED A1 6A"
// Config DHT
#define DHTPIN 23 
#define DHTTYPE DHT22

//LiquidCrystal_I2C lcd(0x3F, 16, 2);

String name;
DHT dht(DHTPIN, DHTTYPE);
    /*
     const char* test_root_ca= \
     "-----BEGIN CERTIFICATE-----\n" \
     "3082010A0282010100D141BF8FBCFC77F70B10A28A27E05B28316145C5C172D0\n" \
     "59E0175E6F4CA6D6D453A559ADBC57C5DA27291EEB10ADAE717BEB1D1C388553\n" \
     "D54C33243BF57A09831626B3D277643A48C2445DF74F412202E7F326B57B50AE\n" \
     "CB7EE9085664F24BC12E397D821D2606F9F23FDD836F8FDBAF505C1F2D4B014A\n" \
     "4AC821E0F3C977C543E322E842423F741DD925C2D1FE5C16B80752FB6FB4FE0F\n" \
     "AD9204ACBBEA2BD55C50F3B7266B68C194315A48F3D65781668ECBB18254BEE4\n" \
     "2AB3352998ABD4E78064DC666DB1BEB93E49DB529DB670D517DF824021274004\n" \
     "F69B87C3F59A05C4C98D678EADC2A6315842A84AB79E456CD9C0CBAEEE187F8D\n" \
     "DAEE8F287F3042EA3F0203010001\n" \
     "-----END CERTIFICATE-----\n";
      */

    const char* ca_cert = \ 
"-----BEGIN CERTIFICATE-----\n" \ 
"MIIEkjCCA3qgAwIBAgIQCgFBQgAAAVOFc2oLheynCDANBgkqhkiG9w0BAQsFADA/\n" \ 
"MSQwIgYDVQQKExtEaWdpdGFsIFNpZ25hdHVyZSBUcnVzdCBDby4xFzAVBgNVBAMT\n" \ 
"DkRTVCBSb290IENBIFgzMB4XDTE2MDMxNzE2NDA0NloXDTIxMDMxNzE2NDA0Nlow\n" \ 
"SjELMAkGA1UEBhMCVVMxFjAUBgNVBAoTDUxldCdzIEVuY3J5cHQxIzAhBgNVBAMT\n" \ 
"GkxldCdzIEVuY3J5cHQgQXV0aG9yaXR5IFgzMIIBIjANBgkqhkiG9w0BAQEFAAOC\n" \ 
"AQ8AMIIBCgKCAQEAnNMM8FrlLke3cl03g7NoYzDq1zUmGSXhvb418XCSL7e4S0EF\n" \ 
"q6meNQhY7LEqxGiHC6PjdeTm86dicbp5gWAf15Gan/PQeGdxyGkOlZHP/uaZ6WA8\n" \ 
"SMx+yk13EiSdRxta67nsHjcAHJyse6cF6s5K671B5TaYucv9bTyWaN8jKkKQDIZ0\n" \ 
"Z8h/pZq4UmEUEz9l6YKHy9v6Dlb2honzhT+Xhq+w3Brvaw2VFn3EK6BlspkENnWA\n" \ 
"a6xK8xuQSXgvopZPKiAlKQTGdMDQMc2PMTiVFrqoM7hD8bEfwzB/onkxEz0tNvjj\n" \ 
"/PIzark5McWvxI0NHWQWM6r6hCm21AvA2H3DkwIDAQABo4IBfTCCAXkwEgYDVR0T\n" \ 
"AQH/BAgwBgEB/wIBADAOBgNVHQ8BAf8EBAMCAYYwfwYIKwYBBQUHAQEEczBxMDIG\n" \ 
"CCsGAQUFBzABhiZodHRwOi8vaXNyZy50cnVzdGlkLm9jc3AuaWRlbnRydXN0LmNv\n" \ 
"bTA7BggrBgEFBQcwAoYvaHR0cDovL2FwcHMuaWRlbnRydXN0LmNvbS9yb290cy9k\n" \ 
"c3Ryb290Y2F4My5wN2MwHwYDVR0jBBgwFoAUxKexpHsscfrb4UuQdf/EFWCFiRAw\n" \ 
"VAYDVR0gBE0wSzAIBgZngQwBAgEwPwYLKwYBBAGC3xMBAQEwMDAuBggrBgEFBQcC\n" \ 
"ARYiaHR0cDovL2Nwcy5yb290LXgxLmxldHNlbmNyeXB0Lm9yZzA8BgNVHR8ENTAz\n" \ 
"MDGgL6AthitodHRwOi8vY3JsLmlkZW50cnVzdC5jb20vRFNUUk9PVENBWDNDUkwu\n" \ 
"Y3JsMB0GA1UdDgQWBBSoSmpjBH3duubRObemRWXv86jsoTANBgkqhkiG9w0BAQsF\n" \ 
"AAOCAQEA3TPXEfNjWDjdGBX7CVW+dla5cEilaUcne8IkCJLxWh9KEik3JHRRHGJo\n" \ 
"uM2VcGfl96S8TihRzZvoroed6ti6WqEBmtzw3Wodatg+VyOeph4EYpr/1wXKtx8/\n" \ 
"wApIvJSwtmVi4MFU5aMqrSDE6ea73Mj2tcMyo5jMd6jmeWUHK8so/joWUoHOUgwu\n" \ 
"X4Po1QYz+3dszkDqMp4fklxBwXRsW10KXzPMTZ+sOPAveyxindmjkW8lGy+QsRlG\n" \ 
"PfZ+G6Z6h7mjem0Y+iWlkYcV4PIWL1iwBi8saCbGS5jN2p8M+X+Q7UNKEkROb3N6\n" \ 
"KOqkqm57TH2H3eDJAkSnh6/DNFu0Qg==\n" \ 
"-----END CERTIFICATE-----\n";
      
WiFiClientSecure client;

void setup() {
  //lcd.begin();
  //lcd.backlight();
  Serial.begin(115200);
  delay(10);

    // We start by connecting to a WiFi network
    WiFiMulti.addAP("kk", "12345678");

  
  //WiFi.mode(WIFI_STA);
  // connect to wifi.
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  //lcd.setCursor(0, 0);
  //lcd.print("Connecting");
  
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());
  //lcd.setCursor(0, 1);
  //lcd.print(WiFi.localIP());
  

  //Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  dht.begin();
  delay(1000);
  //lcd.clear();
}

int readSensorCounter=0u;
int failSensorReading=0u;
void loop() {
  // Read temp & Humidity for DHT22
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  readSensorCounter++;
  Serial.print("readSensorCounter ");
  Serial.print(readSensorCounter);
  Serial.print("\n");
  
  if (isnan(h) || isnan(t)) {
    Serial.println("Failed to read from DHT sensor!");
    //lcd.setCursor(0, 0);
    //lcd.print("Failed to read from DHT sensor!");
    
    delay(500);
    //lcd.clear();
    failSensorReading++;
    //Serial.print("failSensorReading: %d \n", failSensorReading);
    return;
  }
  
    if ((WiFiMulti.run() == WL_CONNECTED)) {
    HTTPClient http;
    
    //String url;
    String url = "https://www.chiangmai.services/simpleDB/insert.php?recordTime="+String('10')+"&temperature="+String(t)+"&humidity="+String(h);
    //String url = "http://35.240.206.116/simpleDB/insert.php?recordTime="+String('10')+"&temperature="+String(t)+"&humidity="+String(h);
     
    Serial.println(url);
    //http.begin(url); //HTTP
    // add public key
    //client.setCACert(test_root_ca);

    
    http.begin(url,ca_cert); 
    http.addHeader("Content-Type", "application/x-www-form-urlencoded");

    int httpCode = http.GET();

     // print anything
      Serial.printf("[HTTP] GET... code: %d\n", httpCode);
      String payload = http.getString();
      Serial.println(payload);
     //
    
    if (httpCode > 0) {
    Serial.printf("[HTTP] GET... code: %d\n", httpCode);
    //String payload = http.getString();
    //Serial.println(payload);
    /*if (httpCode == HTTP_CODE_OK) {
      String payload = http.getString();
      Serial.println(payload);
    }*/
    } /*else {
    Serial.printf("[HTTP] GET... failed, error: %s\n", http.errorToString(httpCode).c_str());
    }*/
    http.end();
    }
  
  // append a new value to /temperature
   /*Firebase.setFloat("Main-DHT/temp", t);
  if (Firebase.failed()) {
      Serial.print("pushing /temp failed:");
      Serial.println(Firebase.error());  
      return;
  }
  Serial.print("pushed: /temp/");
  Serial.println(Firebase.getFloat("Main-DHT/temp"));
  lcd.setCursor(0, 0);
  lcd.print("temp = ");lcd.print(t,1);lcd.print((char)223);lcd.print("C");

  // append a new value to /humidity
   Firebase.setFloat("Main-DHT/humidity", h);
  if (Firebase.failed()) {
      Serial.print("pushing /humidity failed:");
      Serial.println(Firebase.error());  
      return;
  }
  Serial.print("pushed: /humidity/");
  Serial.println(Firebase.getFloat("Main-DHT/humidity"));
  lcd.setCursor(0, 1);
  lcd.print("humidity = ");lcd.print(h,1);lcd.print("%");
  
  //JsonBuffer
  StaticJsonBuffer<200> jsonBuffer;
  JsonObject& root = jsonBuffer.createObject();
  root["temp"] = t;
  root["humidity"] = h;
  
  // append a new value to /logDHT
  String name = Firebase.push("Status-DHT", root);
  // handle error
  if (Firebase.failed()) {
      Serial.print("pushing /Status-DHT failed:");
      Serial.println(Firebase.error());  
      return;
  }
  Serial.print("pushed: /Status-DHT");
  Serial.println(name);
  delay(6000);
  */
}
