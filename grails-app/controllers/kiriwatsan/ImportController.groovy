package kiriwatsan

import groovy.json.JsonSlurper
import com.xlson.groovycsv.CsvParser

/**
 * ImportOldController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ImportController {

    String path = "/home/sachin/"

    def index = {

        //RainwaterHarvesting.executeUpdate("DELETE From RainwaterHarvesting ")
        //well()
        //storage()
        //building()
        rain()
        clean()
    }


    def clean() {
        Well.executeUpdate("Update Well Set island='BBG Butaritari' Where island='BBG'")
        Well.executeUpdate("Update Well Set island='MTK Makin' Where island='MTK'")
        Well.executeUpdate("Update Well Set island='MZK Marakei' Where island='MZK'")
        Well.executeUpdate("Update Well Set island='ABG Abaing' Where island='ABG'")

        Building.executeUpdate("Update Building Set island='BBG Butaritari' Where island='BBG'")
        Building.executeUpdate("Update Building Set island='MTK Makin' Where island='MTK'")
        Building.executeUpdate("Update Building Set island='MZK Marakei' Where island='MZK'")
        Building.executeUpdate("Update Building Set island='ABG Abaing' Where island='ABG'")

        Storage.executeUpdate("Update Storage Set island='BBG Butaritari' Where island='BBG'")
        Storage.executeUpdate("Update Storage Set island='MTK Makin' Where island='MTK'")
        Storage.executeUpdate("Update Storage Set island='MZK Marakei' Where island='MZK'")
        Storage.executeUpdate("Update Storage Set island='ABG Abaing' Where island='ABG'")


    }

    def rain() {
        render "<h1>Importing Rainwater Harvesting...</h1>"
        RainwaterHarvesting.executeUpdate("DELETE From RainwaterHarvesting ")
        Building.list(order: "buildingID").each { b ->
        //Building.findAllWhere(island: 'ABG') { b ->
            RainwaterHarvesting r = new RainwaterHarvesting()
            r.setBuilding(b)
            Set<Storage> list = new HashSet<Storage>()

            Storage.findAllWhere(island: b.island, villageName: b.villageName).each { s ->
                int attached = Integer.parseInt(s.joinedToBuilding.trim().replace(".0", "").trim())
                int buildingId = Integer.parseInt(b.buildingID.trim().replace("B", "").trim())
                if (attached == buildingId) list.add(s)
            }

            r.setTanks(list)
            r.save(flush: true, failOnError: true)
        }

        render "Done."
    }

    def building() {
        render "<h1>Importing Building...</h1>"
        Building.executeUpdate("Delete from Building")

        def data = new CsvParser().parse(new File(path + "Building.csv").getText())
        for (r in data) {
            try {
                Building s = new Building()
                s.setIsland(r[10])
                s.setTeam(r[22])
                s.setVillageName(r[24])
                s.setBuildingID(r[2])
                s.setBuildingType(r[3])
                s.setOwner(r[14])
                s.setRoofLength(r[19])
                s.setRoofWidth(r[21])
                s.setRoofHeight(r[18])
                s.setRoofMaterial(r[20])
                s.setRoofConditions(r[17])
                s.setFasciaBoard(r[7])
                s.setGutteringCondition(r[9])
                s.setGutterCoverage(r[8])
                s.setDownPipe(r[6])
                s.setOverhangingVegetation(r[13])
                s.setComments(r[4])
                String photo = r[15]
                if (photo.startsWith("\"")) photo = photo.substring(1, photo.length())
                photo = photo.replace(",", ";")
                photo = photo.replace(" ", ";")
                s.setPhoto(photo)
                s.setDate(r[5])
                s.setTime(r[23])
                String Longitude = r[12]
                String Latitude = r[11]
                s.setLongitude(Longitude)
                s.setLatitude(Latitude)
                //report photo
                String reportPhoto = photo
                if (photo.contains(";")) reportPhoto = photo.substring(0, photo.indexOf(";")).trim()
                if (photo.contains("-")) reportPhoto = photo.substring(0, photo.indexOf("-")).trim()
                s.setReportPhoto(reportPhoto)
                s.save(flush: true, failOnError: true)
            } catch (Exception ex) {
                ex.printStackTrace()
            }
        }

        render "Done."
    }

    def storage() {
        render "<h1>Importing Storage...</h1>"
        Storage.executeUpdate("Delete from Storage")
        def data = new CsvParser().parse(new File(path + "Storage.csv").getText())
        for (r in data) {
            try {
                Storage s = new Storage()
                s.setIsland(r[15])
                s.setTeam(r[28])
                s.setVillageName(r[30])
                s.setJoinedToBuilding(r[16])
                s.setTankID(r[26])
                s.setTankType(r[27])
                s.setScreenOnTankEntry(r[21])
                s.setStorageVolume(r[23])
                s.setTankHeight(r[25])
                s.setTankDiameter(r[24])
                s.setStorageCondition(r[22])
                s.setAbstractionType2(r[3])
                s.setBacteriologicalSample2(r[5])
                s.setCisternHeight(r[7])
                s.setCisternWidth(r[9])
                s.setCisternLength(r[8])
                s.setCisternCondition(r[6])
                s.setAbstractionType1(r[2])
                s.setBacteriologicalSample1(r[4])
                s.setImprovements1(r[12])
                s.setImprovements2(r[13])
                s.setImprovements3(r[14])
                s.setComments(r[10])
                String photo = r[19]
                if (photo.startsWith("\"")) photo = photo.substring(1, photo.length())
                photo = photo.replace(",", ";")
                photo = photo.replace(" ", ";")
                s.setPhoto(photo)
                s.setDate(r[11])
                s.setTime(r[29])
                String Longitude = r[18]
                String Latitude = r[17]
                s.setLongitude(Longitude)
                s.setLatitude(Latitude)
                //report photo
                String reportPhoto = photo
                if (photo.contains(";")) reportPhoto = photo.substring(0, photo.indexOf(";")).trim()
                if (photo.contains("-")) reportPhoto = photo.substring(0, photo.indexOf("-")).trim()
                s.setReportPhoto(reportPhoto)
                s.save(flush: true, failOnError: false)
            } catch (Exception ex) {
                ex.printStackTrace()
            }

        }
        render "Done."
    }

    def well() {
        render "<h1>Importing Wells...</h1>"
        Well.executeUpdate("Delete from Well")
        def data = new CsvParser().parse(new File(path + "Well.csv").getText())
        for (r in data) {


            try {
                Well w = new Well()
                String island = r[14]
                w.setIsland(island)
                w.setTeam(r[25])
                w.setVillageName(r[29])
                w.setWellID(r[36])
                w.setWellType(r[41])
                w.setWellOwner(r[40])
                w.setCasingType(r[4])
                w.setWellCover(r[33])
                w.setWellCoverCondition(r[34])
                w.setWellCoverMaterial(r[35])
                w.setFencingCondition(r[11])
                w.setFencingMaterial(r[12])
                w.setWellApronSize(r[32])
                w.setWellApronCondition(r[30])
                w.setWellApronMaterial(r[31])
                w.setAbstractionType(r[2])
                w.setPumpStatus(r[21])
                w.setUseOfWater(r[28])
                w.setHouseholdUsage(String.valueOf(r[13]))
                w.setPeopleUsage(String.valueOf(r[19]))
                w.setContaminationSource(r[7])
                w.setContaminationDist(String.valueOf(r[6]))
                w.setDiameterInternal(String.valueOf(r[9]))
                w.setParapetHeight(r[18])
                w.setDistanceToWaterTable(r[10])
                w.setTotalDepth(r[27])
                w.setSalinityTop_mScm(r[24])
                w.setSalinityBase_mScm(r[23])
                w.setBacteriological(r[3])
                w.setNitrateNitrite(r[17])
                w.setWellImprovements1(r[37])
                w.setWellImprovements2(r[38])
                w.setWellImprovements3(r[39])
                w.setComments(r[5])
                String photo = r[20].toString().trim()
                if (photo.startsWith("\"")) photo = photo.substring(1, photo.length())
                photo = photo.replace(",", ";")
                w.setPhoto(photo)
                w.setDate(r[8])
                w.setTime(r[26])
                String Longitude = r[16]
                String Latitude = r[15]
                w.setLongitude(Longitude)
                w.setLatitude(Latitude)
                //report photo
                String reportPhoto = photo
                if (photo.contains(";")) reportPhoto = photo.substring(0, photo.indexOf(";")).trim()
                if (photo.contains("-")) reportPhoto = photo.substring(0, photo.indexOf("-")).trim()
                w.setReportPhoto(reportPhoto)
                w.save(flush: true, failOnError: false)
            } catch (Exception ex) {
                render ex.getMessage() + "<br/>"
                ex.printStackTrace()
            }

        }

        render "Done."
    }

}
