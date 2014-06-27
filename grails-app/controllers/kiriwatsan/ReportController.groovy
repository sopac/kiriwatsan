package kiriwatsan

import java.net.*
import java.io.*

/**
 * ReportControllerOld
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ReportController {


    public static int getResponseCode(String urlString) throws MalformedURLException, IOException {
        URL u = new URL(urlString);
        HttpURLConnection huc = (HttpURLConnection) u.openConnection();
        huc.setRequestMethod("GET");
        huc.connect();
        return huc.getResponseCode();
    }

    def wellphoto() {

        String id = params.id
        Well w = Well.findById(id)
        String photoString = w.reportPhoto
        String url = "http://ict.sopac.org/kiriwatsan/photo/no_image.jpg"
        if (photoString != null) {
            String photo = photoString.trim()
            if (photo.contains(";")) photo = photo.split(";")[0]
            if (photo.contains("-")) photo = photo.split("-")[0]
            photo = photo.trim()
            println photo + ".JPG"

            url = "http://www.sopac.org/sopac/kiriwatsanphoto/DSC0" + photo + ".JPG"
            if (getResponseCode(url) != 200) {
                url = "http://ict.sopac.org/kiriwatsan/photo/no_image.jpg"
            }

        } else {
            url = "http://ict.sopac.org/kiriwatsan/photo/no_image.jpg"
        }

        response.setHeader("Content-Type", "image/jpeg")
        response.outputStream << new URL(url).openStream()
        response.flushBuffer()
    }

    def buildingphoto() {
        String url = "http://ict.sopac.org/kiriwatsan/photo/no_image.jpg"

        String id = params.id
        Building w = Building.findById(id)
        String photoString = w.getReportPhoto()
        if (photoString != null) {
            String photo = photoString.trim()
            if (photo.contains(";")) photo = photo.split(";")[0]
            if (photo.contains("-")) photo = photo.split("-")[0]
            photo = photo.trim()

            url = "http://www.sopac.org/sopac/kiriwatsanphoto/DSC0" + photo + ".JPG"
            if (getResponseCode(url) != 200) {
                url = "http://ict.sopac.org/kiriwatsan/photo/no_image.jpg"
            }

        } else {
            url = "http://ict.sopac.org/kiriwatsan/photo/no_image.jpg"
        }

        response.setHeader("Content-Type", "image/jpeg")
        response.outputStream << new URL(url).openStream()
        response.flushBuffer()
    }

    def storagephoto() {

        String url = "http://ict.sopac.org/kiriwatsan/photo/no_image.jpg"

        String id = params.id
        Storage w = Storage.findById(id)

        String photoString = w.getReportPhoto()
        if (photoString != null) {
            String photo = photoString.trim()
            if (photo.contains(";")) photo = photo.split(";")[0]
            if (photo.contains("-")) photo = photo.split("-")[0]
            photo = photo.trim()

            url = "http://www.sopac.org/sopac/kiriwatsanphoto/DSC0" + photo + ".JPG"
            if (getResponseCode(url) != 200) {
                url = "http://ict.sopac.org/kiriwatsan/photo/no_image.jpg"
            }

        } else {
            url = "http://ict.sopac.org/kiriwatsan/photo/no_image.jpg"
        }


        response.setHeader("Content-Type", "image/jpeg")
        response.outputStream << new URL(url).openStream()
        response.flushBuffer()
    }

    def index = {
        render "Report Image Server..."
    }
}
