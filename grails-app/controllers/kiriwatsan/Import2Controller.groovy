package kiriwatsan

import groovy.json.JsonSlurper

/**
 * ImportOldController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class Import2Controller {

    String path = "/home/sachin/IdeaProjects/Kiriwatsan/"

    def index = {
        render "disabled"

        //RainwaterHarvesting.executeUpdate("DELETE From RainwaterHarvesting ")
        //well()
        //storage()
        //building()
        //rain()
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

        render "Done."
    }

    def rain() {
        render "<h1>Importing Rainwater Harvesting...</h1>"
        //RainwaterHarvesting.executeUpdate("DELETE From RainwaterHarvesting ")
        //Building.list(order: "buildingID").each { b ->
        Building.findAllWhere(island: 'ABG') { b ->
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
        //Building.executeUpdate("Delete from Building")
        //def islands = ["BBG", "MTK", "MZK"]
        def islands = ["ABG"]
        islands.each { island ->
            def slurper = new JsonSlurper()
            def r = slurper.parseText(new File(path + "Building" + island + ".geojson").getText())

            for (int i = 0; i < 500; i++) {
                try {
                    Building s = new Building()
                    s.setIsland(island)
                    s.setTeam(r.features[i].properties.Team)
                    s.setVillageName(r.features[i].properties.VillageName)
                    s.setBuildingID(r.features[i].properties.BuildingID)
                    s.setBuildingType(r.features[i].properties.BuildingType)
                    s.setOwner(r.features[i].properties.Owner)
                    s.setRoofLength(String.valueOf(r.features[i].properties.Rooflength))
                    s.setRoofWidth(String.valueOf(r.features[i].properties.Roofwidth))
                    s.setRoofHeight(String.valueOf(r.features[i].properties.HeightofRoof))
                    s.setRoofMaterial(r.features[i].properties.RoofMaterial)
                    s.setRoofConditions(r.features[i].properties.RoofConditions)
                    s.setFasciaBoard(r.features[i].properties.FascialBoard)
                    s.setGutteringCondition(r.features[i].properties.GutteringCondition)
                    s.setGutterCoverage(r.features[i].properties.GutterCoverage)
                    s.setDownPipe(r.features[i].properties.DownPipe)
                    s.setOverhangingVegetation(r.features[i].properties.OverhangingVeg)
                    s.setComments(r.features[i].properties.Comments)
                    String photo = r.features[i].properties.Photo.trim()
                    if (photo.startsWith("\"")) photo = photo.substring(1, photo.length())
                    photo = photo.replace(",", ";")
                    photo = photo.replace(" ", ";")
                    s.setPhoto(photo)
                    s.setDate(r.features[i].properties.Date)
                    s.setTime(r.features[i].properties.Time)
                    String Longitude = r.features[i].geometry.coordinates[0]
                    String Latitude = r.features[i].geometry.coordinates[1]
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

        }
        render "Done."
    }

    def storage() {
        render "<h1>Importing Storage...</h1>"
        //Storage.executeUpdate("Delete from Storage")
        //def islands = ["BBG", "MTK", "MZK"]
        def islands = ["ABG"]
        islands.each { island ->
            def slurper = new JsonSlurper()
            def r = slurper.parseText(new File(path + "Storage" + island + ".geojson").getText())

            for (int i = 0; i < 500; i++) {
                try {
                    Storage s = new Storage()
                    s.setIsland(island)
                    s.setTeam(r.features[i].properties.Team)
                    s.setVillageName(r.features[i].properties.VillageName)
                    s.setJoinedToBuilding(String.valueOf(r.features[i].properties.Joined_to_Building))
                    s.setTankID(r.features[i].properties.TankID)
                    s.setTankType(r.features[i].properties.Tank_type)
                    s.setScreenOnTankEntry(r.features[i].properties.ScreenonTankEntry)
                    s.setStorageVolume(r.features[i].properties.StorageVolume)
                    s.setTankHeight(String.valueOf(r.features[i].properties.TankHeight))
                    s.setTankDiameter(String.valueOf(r.features[i].properties.TankDiameter))
                    s.setStorageCondition(r.features[i].properties.StorageCondition)
                    s.setAbstractionType2(r.features[i].properties.AbstractType2)
                    s.setBacteriologicalSample2(r.features[i].properties.BacteriologicalSmpl2)
                    s.setCisternHeight(String.valueOf(r.features[i].properties.CisternHeight))
                    s.setCisternWidth(String.valueOf(r.features[i].properties.CisternWidth))
                    s.setCisternLength(String.valueOf(r.features[i].properties.CisternLength))
                    s.setCisternCondition(r.features[i].properties.CisternCondition)
                    s.setAbstractionType1(r.features[i].properties.AbstractType1)
                    s.setBacteriologicalSample1(r.features[i].properties.BacteriologicalSmpl)
                    s.setImprovements1(r.features[i].properties.Improvements1)
                    s.setImprovements2(r.features[i].properties.Improvements2)
                    s.setImprovements3(r.features[i].properties.Improvements3)
                    s.setComments(r.features[i].properties.Comments)
                    String photo = r.features[i].properties.Photo.trim()
                    if (photo.startsWith("\"")) photo = photo.substring(1, photo.length())
                    photo = photo.replace(",", ";")
                    photo = photo.replace(" ", ";")
                    s.setPhoto(photo)
                    s.setDate(r.features[i].properties.Date)
                    s.setTime(r.features[i].properties.Time)
                    String Longitude = r.features[i].geometry.coordinates[0]
                    String Latitude = r.features[i].geometry.coordinates[1]
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
        }
        render "Done."
    }

    def well() {
        render "<h1>Importing Wells...</h1>"
        //Well.executeUpdate("Delete from Well")
        //def islands = ["BBG", "MTK", "MZK"]
        def islands = ["ABG"]
        islands.each { island ->
            def slurper = new JsonSlurper()
            def r = slurper.parseText(new File(path + "Well" + island + ".geojson").getText())

            for (int i = 0; i < 500; i++) {
                try {
                    Well w = new Well()
                    //String island = r.features[i].properties.island
                    //island = island.trim()
                    //if (island.equals("MKZ")) island = "MZK"
                    w.setIsland(island)
                    w.setTeam(r.features[i].properties.Team)
                    w.setVillageName(r.features[i].properties.VillageName)
                    w.setWellID(r.features[i].properties.WellID)
                    w.setWellType(r.features[i].properties.WellType)
                    w.setWellOwner(r.features[i].properties.WellOwner)
                    w.setCasingType(r.features[i].properties.CasingType)
                    w.setWellCover(r.features[i].properties.WellCover)
                    w.setWellCoverCondition(r.features[i].properties.WellCoverCondition)
                    w.setWellCoverMaterial(r.features[i].properties.WellCoverMaterial)
                    w.setFencingCondition(r.features[i].properties.FencingCondition)
                    w.setFencingMaterial(r.features[i].properties.FencingMaterial)
                    w.setWellApronSize(r.features[i].properties.WellApronSize)
                    w.setWellApronCondition(r.features[i].properties.WellApronCondition)
                    w.setWellApronMaterial(r.features[i].properties.WellApronMaterial)
                    w.setAbstractionType(r.features[i].properties.AbstrationType)
                    w.setPumpStatus(r.features[i].properties.PumpStatus)
                    w.setUseOfWater(r.features[i].properties.UseofWater)
                    w.setHouseholdUsage(String.valueOf(r.features[i].properties.HouseholdUsage))
                    w.setPeopleUsage(String.valueOf(r.features[i].properties.PeopleUsage))
                    w.setContaminationSource(r.features[i].properties.ContaminationSource)
                    w.setContaminationDist(String.valueOf(r.features[i].properties.ContaminationDist))
                    w.setDiameterInternal(String.valueOf(r.features[i].properties.DiameterInternal))
                    w.setParapetHeight(String.valueOf(r.features[i].properties.ParapetHeight))
                    w.setDistanceToWaterTable(String.valueOf(r.features[i].properties.DTWT))
                    w.setTotalDepth(String.valueOf(r.features[i].properties.TotalDepth))
                    w.setSalinityTop_mScm(String.valueOf(r.features[i].properties.SalinityTop_mScm))
                    w.setSalinityBase_mScm(String.valueOf(r.features[i].properties.Salinity_mScm_Base))
                    w.setBacteriological(r.features[i].properties.Bacteriological)
                    w.setNitrateNitrite(String.valueOf(r.features[i].properties.NitrateNitrite))
                    w.setWellImprovements1(r.features[i].properties.WellImprovements1)
                    w.setWellImprovements2(r.features[i].properties.WellImprovements2)
                    w.setWellImprovements3(r.features[i].properties.WellImprovements3)
                    w.setComments(r.features[i].properties.Comments)
                    String photo = r.features[i].properties.Photo.trim()
                    if (photo.startsWith("\"")) photo = photo.substring(1, photo.length())
                    photo = photo.replace(",", ";")
                    w.setPhoto(photo)
                    w.setDate(r.features[i].properties.Date)
                    w.setTime(r.features[i].properties.Time)
                    String Longitude = r.features[i].geometry.coordinates[0]
                    String Latitude = r.features[i].geometry.coordinates[1]
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
        }

        render "Done."
    }

}
