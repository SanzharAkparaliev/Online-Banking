package com.demo_bank_v1.helper;

public class HTML {
    public static String htmlEmailTemplate(String token,String code){
        String url = "http://localhost:8080/register/verify?token" + token + "&code" + code;
        String emailTemplate = "<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <link rel=\"stylesheet\" href=\"css/email.css\">\n" +
                "    <title>Document</title>\n" +
                "</head>\n" +
                "<body>\n" +
                "        <div class=\"wrapper\">\n" +
                "            <h2 class=\"email-msg-header\">Welcome and Thank You for choosing</h2>\n" +
                "\n" +
                "        <div class=\"company-name\">Easy Way Bank</div>\n" +
                "        <hr>\n" +
                "        <p class=\"welcome-text\">\n" +
                "            Your Account has been successfully registered,please click below verify your account\n" +
                "        </p>\n" +
                "        <br>\n" +
                "        <br>\n" +
                "        <center><a href='"+ url +"' class='verify-account-btn' role=\"button\">Verify Account</a></center>\n" +
                "        <div class=\"copy-right\">\n" +
                "            &copy: Copy Rigth 2022.All Rights Reserved.\n" +
                "        </div>\n" +
                "    </div>\n" +
                "\n" +
                "</body>\n" +
                "</html>";
        return null;
    }
}
