package kiriwatsan

/**
 * ReportControllerOld
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ReportControllerOld {

    def wellphoto() {
        String path = ""
        File f = null

        String id = params.id
        Well w = Well.findById(id)
        String photoString = w.reportPhoto
        if (photoString != null) {
            String photo = photoString.trim()
            if (photo.contains(";")) photo = photo.split(";")[0]
            if (photo.contains("-")) photo = photo.split("-")[0]
            photo = photo.trim()

            path = "/var/lib/tomcat6/webapps/ROOT/kiriwatsanphoto/DSC0" + photo + ".JPG"
            f = new File(path)
            if (!f.exists()) {
                path = getServletContext().getRealPath("photo/no_image.jpg")
                f = new File(path)
            }
        } else {
            path = getServletContext().getRealPath("photo/no_image.jpg")
            f = new File(path)
        }

        response.setHeader("Content-Type", "image/jpeg")
        response.outputStream << f.newInputStream()
        response.flushBuffer()
    }

    def buildingphoto() {
        String path = ""
        File f = null

        String id = params.id
        Building w = Building.findById(id)
        String photoString = w.getReportPhoto()
        if (photoString != null) {
            String photo = photoString.trim()
            if (photo.contains(";")) photo = photo.split(";")[0]
            if (photo.contains("-")) photo = photo.split("-")[0]
            photo = photo.trim()

            path = "/var/lib/tomcat6/webapps/ROOT/kiriwatsanphoto/DSC0" + photo + ".JPG"
            f = new File(path)
            if (!f.exists()) {
                path = getServletContext().getRealPath("photo/no_image.jpg")
                f = new File(path)
            }
        } else {
            path = getServletContext().getRealPath("photo/no_image.jpg")
            f = new File(path)
        }

        response.setHeader("Content-Type", "image/jpeg")
        response.outputStream << f.newInputStream()
        response.flushBuffer()
    }

    def storagephoto() {
        String path = ""
        File f = null

        String id = params.id
        Storage w = Storage.findById(id)

        String photoString = w.getReportPhoto()
        if (photoString != null) {
            String photo = photoString.trim()
            if (photo.contains(";")) photo = photo.split(";")[0]
            if (photo.contains("-")) photo = photo.split("-")[0]
            photo = photo.trim()

            path = "/var/lib/tomcat6/webapps/ROOT/kiriwatsanphoto/DSC0" + photo + ".JPG"
            f = new File(path)
            if (!f.exists()) {
                path = getServletContext().getRealPath("photo/no_image.jpg")
                f = new File(path)
            }
        } else {
            path = getServletContext().getRealPath("photo/no_image.jpg")
            f = new File(path)
        }

        response.setHeader("Content-Type", "image/jpeg")
        response.outputStream << f.newInputStream()
        response.flushBuffer()
    }

    def index = {
        render "Report Image Server..."
    }
}
