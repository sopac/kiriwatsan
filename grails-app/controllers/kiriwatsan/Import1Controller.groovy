package kiriwatsan

import groovy.json.JsonSlurper

/**
 * ImportController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class Import1Controller {

    String path = "/home/sachin/IdeaProjects/Kiriwatsan/"

    def index = {
        //well()
        //storage()
        //building()
        //rain()
        //clean()
    }

    def clean() {
        def map = ["ABG":"Abaing", "BBG":"Butaritari", "BEZ": "Beru", "MNK": "Maiana", "MTK": "Makin", "MZK": "Marakei", "NIG": "Nikunau", "NON": "Nonouti"]
        map.each {
            String val = it.key + " " + it.value
            Well.executeUpdate("Update Well Set island='${val}' Where island='${it.key}'")
            Building.executeUpdate("Update Building Set island='${val}' Where island='${it.key}'")
            Storage.executeUpdate("Update Storage Set island='${val}' Where island='${it.key}'")
        }
        render "Renaming Done."
    }

    def rain() {
        render "<h1>Importing Rainwater Harvesting...</h1>"
        Building.findAllWhere(island: 'ABG').each { b ->
            try {
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
            } catch (Exception ex) {
                ex.printStackTrace()
            }
        }

        render "Done."
    }

    def well_import1(Object r, int i) {
        try {
            Well w = new Well()
            String island = r.features[i].properties.Island
            //render island + " : " + r.features[i].Team + "<br/>"
            w.setIsland(island)
            w.setTeam(r.features[i].properties.Team)
            w.setVillageName(r.features[i].properties.VillageName)
            w.setWellID(r.features[i].properties.WellID)
            w.setWellType(r.features[i].properties.WellType)
            w.setWellOwner(r.features[i].properties.WellOwner)
            w.setCasingType(r.features[i].properties.CasingType)
            if (r.features[i].properties.CasingType == null) w.setCasingType(" ")
            w.setWellCover(r.features[i].properties.WellCover)
            if (r.features[i].properties.WellCover == null) w.setWellCover(" ")
            w.setWellCoverCondition(r.features[i].properties.WellCoverCondition)
            if (r.features[i].properties.WellCoverCondition == null) w.setWellCoverCondition(" ")
            w.setWellCoverMaterial(r.features[i].properties.WellCoverMaterial)
            if (r.features[i].properties.WellCoverMaterial == null) w.setWellCoverMaterial(" ")
            w.setFencingCondition(r.features[i].properties.FencingCondition)
            if (r.features[i].properties.FencingCondition == null) w.setFencingCondition(" ")
            w.setFencingMaterial(r.features[i].properties.FencingMaterial)
            if (r.features[i].properties.FencingMaterial == null) w.setFencingMaterial(" ")
            w.setWellApronSize(r.features[i].properties.WellApronSize)
            if (r.features[i].properties.WellApronSize == null) w.setWellApronSize(" ")
            w.setWellApronCondition(r.features[i].properties.WellApronCondition)
            if (r.features[i].properties.WellApronCondition == null) w.setWellApronCondition(" ")
            w.setWellApronMaterial(r.features[i].properties.WellApronMaterial)
            if (r.features[i].properties.WellApronMaterial == null) w.setWellApronMaterial(" ")
            w.setAbstractionType(r.features[i].properties.AbstrationType)
            if (r.features[i].properties.AbstrationType == null) w.setAbstractionType(" ")
            w.setPumpStatus(r.features[i].properties.PumpStatus)
            if (r.features[i].properties.PumpStatus == null) w.setPumpStatus(" ")
            w.setUseOfWater(r.features[i].properties.UseofWater)
            if (r.features[i].properties.UseofWater == null) w.setUseOfWater(" ")
            w.setHouseholdUsage(String.valueOf(r.features[i].properties.HouseholdUsage))
            if (r.features[i].properties.HouseholdUsage == null) w.setHouseholdUsage(" ")
            w.setPeopleUsage(String.valueOf(r.features[i].properties.PeopleUsage))
            if (r.features[i].properties.PeopleUsage == null) w.setPeopleUsage(" ")
            String cs = r.features[i].properties.ContaminationSource1
            if (r.features[i].properties.ContaminationSource2 != null) cs = cs + ", " + r.features[i].properties.ContaminationSource2
            if (r.features[i].properties.ContaminationSource3 != null) cs = cs + ", " + r.features[i].properties.ContaminationSource3
            w.setContaminationSource(cs)
            if (cs == null) w.setContaminationSource(" ")
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
            if (r.features[i].properties.WellImprovements1 == null) w.setWellImprovements1(" ")
            if (r.features[i].properties.WellImprovements2 == null) w.setWellImprovements2(" ")
            if (r.features[i].properties.WellImprovements3 == null) w.setWellImprovements3(" ")
            w.setComments(r.features[i].properties.Comments)
            String photo = r.features[i].properties.Photo
            if (photo == null) photo = " "
            if (photo != null) photo = photo.trim()
            if (photo.startsWith("\"")) photo = photo.substring(1, photo.length())
            photo = photo.replace(",", ";")
            w.setPhoto(photo)
            w.setDate(r.features[i].properties.Date)
            w.setTime(r.features[i].properties.Time)
            if (r.features[i].properties.Time == null) w.setTime(" ")
            if (r.features[i].properties.Date == null) w.setDate(" ")
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
            //render "<b>" + r.features[i].toString() + "</b><br/><br/>"
            ex.printStackTrace()
        }
    }

    def well_import2(Object r, int i) {
        try {
            Well w = new Well()
            String island = r.features[i].properties.Island
            //render island + " : " + r.features[i].Team + "<br/>"
            w.setIsland(island)
            w.setTeam(String.valueOf(r.features[i].properties.Team))
            w.setVillageName(r.features[i].properties.Villagenam)
            //println r.features[i].properties.Villagenam
            w.setWellID(r.features[i].properties.Wellid)
            w.setWellType(r.features[i].properties.Welltype)
            w.setWellOwner(r.features[i].properties.Wellowner)
            w.setCasingType(r.features[i].properties.Casingtype)
            if (r.features[i].properties.Casingtype == null)
                w.setCasingType(" ")
            w.setWellCover(r.features[i].properties.Wellcover)
            if (r.features[i].properties.Wellcover == null)
                w.setWellCover(" ")
            w.setWellCoverCondition(r.features[i].properties.Wellcoverc)
            if (r.features[i].properties.Wellcoverc == null)
                w.setWellCoverCondition(" ")
            w.setWellCoverMaterial(r.features[i].properties.Wellcoverm)
            if (r.features[i].properties.Wellcoverm == null)
                w.setWellCoverMaterial(" ")
            w.setFencingCondition(r.features[i].properties.Fencingcon)
            if (r.features[i].properties.Fencingcon == null)
                w.setFencingCondition(" ")
            w.setFencingMaterial(r.features[i].properties.Fencingmat)
            if (r.features[i].properties.Fencingmat == null)
                w.setFencingMaterial(" ")
            w.setWellApronSize(r.features[i].properties.Wellaprons)
            if (r.features[i].properties.Wellaprons == null)
                w.setWellApronSize(" ")
            w.setWellApronCondition(r.features[i].properties.Wellapronc)
            if (r.features[i].properties.Wellapronc == null)
                w.setWellApronCondition(" ")
            w.setWellApronMaterial(r.features[i].properties.Wellapronm)
            if (r.features[i].properties.Wellapronm == null)
                w.setWellApronMaterial(" ")
            w.setAbstractionType(r.features[i].properties.Abstractio)
            if (r.features[i].properties.Abstractio == null)
                w.setAbstractionType(" ")
            w.setPumpStatus(r.features[i].properties.Pumpstatus)
            if (r.features[i].properties.Pumpstatus == null)
                w.setPumpStatus(" ")
            w.setUseOfWater(r.features[i].properties.Useofwater)
            if (r.features[i].properties.Useofwater == null)
                w.setUseOfWater(" ")
            w.setHouseholdUsage(String.valueOf(r.features[i].properties.Householdu))
            if (r.features[i].properties.Householdu == null)
                w.setHouseholdUsage(" ")
            w.setPeopleUsage(String.valueOf(r.features[i].properties.Peopleusag))
            if (r.features[i].properties.Peopleusag == null)
                w.setPeopleUsage(" ")
            w.setContaminationSource(r.features[i].properties.Contaminat + " " + r.features[i].properties.Contaminat2 + " " + r.features[i].properties.Contamina3)
            if (w.getContaminationSource() == null) w.setContaminationSource(" ")
            w.setContaminationDist(String.valueOf(r.features[i].properties.Contamina4))
            if (r.features[i].properties.Contamina4 == null)
                w.setContaminationDist(" ")
            w.setDiameterInternal(String.valueOf(r.features[i].properties.Diameterin))
            if (r.features[i].properties.Diameterin == null)
                w.setDiameterInternal(" ")
            w.setParapetHeight(String.valueOf(r.features[i].properties.Parapethei))
            if (r.features[i].properties.Parapethei == null)
                w.setParapetHeight(" ")
            w.setDistanceToWaterTable(String.valueOf(r.features[i].properties.Dtwt))
            if (r.features[i].properties.Dtwt == null)
                w.setDistanceToWaterTable(" ")
            w.setTotalDepth(String.valueOf(r.features[i].properties.Totaldepth))
            if (r.features[i].properties.Totaldepth == null)
                w.setTotalDepth(" ")
            w.setSalinityTop_mScm(String.valueOf(r.features[i].properties.Salinityto))
            if (r.features[i].properties.Salinityto == null)
                w.setSalinityTop_mScm(" ")
            w.setSalinityBase_mScm(String.valueOf(r.features[i].properties.Salinity_m))
            if (r.features[i].properties.Salinity_m == null)
                w.setSalinityBase_mScm(" ")
            w.setBacteriological(r.features[i].properties.Bacteriolo)
            if (r.features[i].properties.Bacteriolo == null)
                w.setBacteriological(" ")
            w.setNitrateNitrite(String.valueOf(r.features[i].properties.Nitrate_ni))
            if (r.features[i].properties.Nitrate_ni == null)
                w.setNitrateNitrite(" ")
            w.setWellImprovements1(r.features[i].properties.Wellimprov)
            w.setWellImprovements2(r.features[i].properties.Wellimpro2)
            w.setWellImprovements3(r.features[i].properties.Wellimpro3)
            if (r.features[i].properties.WellImprov == null) w.setWellImprovements1(" ")
            if (r.features[i].properties.WellImpro2 == null) w.setWellImprovements2(" ")
            if (r.features[i].properties.WellImpro3 == null) w.setWellImprovements3(" ")
            w.setComments(r.features[i].properties.Comments_)
            if (r.features[i].properties.Comments_ == null)
                w.setComments(" ")
            String photo = r.features[i].properties.Photo.toString()
            if (photo == null) photo = " "
            photo = photo.trim()
            if (photo.startsWith("\"")) photo = photo.substring(1, photo.length())
            photo = photo.replace(",", ";")
            w.setPhoto(photo)
            w.setDate(r.features[i].properties.Date)
            w.setTime(r.features[i].properties.Time)
            if (r.features[i].properties.Time == null) w.setTime(" ")
            if (r.features[i].properties.Date == null) w.setDate(" ")
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

    def well() {
        render "<h1>Importing Wells...</h1>"
        String path = "/home/sachin/tmp/json/"
        new File(path).listFiles().each { f ->
            if (f.toString().endsWith("well.geojson")) {
                render "<h3>Import : " + f.getName() + "</h3>"
                def slurper = new JsonSlurper()
                def r = slurper.parseText(f.getText())
                for (int i = 0; i < 500; i++) {
                    if (r.features[i] != null) {
                        if (r.features[i].properties.Wellid != null) well_import2(r, i)
                        if (r.features[i].properties.WellID != null) well_import1(r, i)
                    }
                }
            }
        }
        render "Done."
    }

    def building_import1(Object r, int i) {
        try {
            Building s = new Building()
            s.setIsland(r.features[i].properties.Island)
            s.setTeam(String.valueOf(r.features[i].properties.Team))
            s.setVillageName(r.features[i].properties.Villagenam)
            s.setBuildingID(r.features[i].properties.Buildingid)
            s.setBuildingType(r.features[i].properties.Buildingty)
            if (r.features[i].properties.Buildingty == null) s.setBuildingType(" ")
            s.setOwner(r.features[i].properties.Owner)
            if (r.features[i].properties.Owner == null) s.setOwner("Unknown")
            s.setRoofLength(String.valueOf(r.features[i].properties.Rooflength))
            s.setRoofWidth(String.valueOf(r.features[i].properties.Roofwidth))
            s.setRoofHeight(String.valueOf(r.features[i].properties.Heightofro))
            s.setRoofMaterial(r.features[i].properties.Roofmateri)
            s.setRoofConditions(r.features[i].properties.Roofcondit)
            s.setFasciaBoard(r.features[i].properties.Fascialboar)
            s.setGutteringCondition(r.features[i].properties.Gutteringc)
            s.setGutterCoverage(r.features[i].properties.Guttercove)
            s.setDownPipe(r.features[i].properties.Downpipe)
            s.setOverhangingVegetation(r.features[i].properties.Overhangin)
            s.setSanitation(r.features[i].properties.Sanitation)
            s.setComments(r.features[i].properties.Comments)
            String photo = ""
            if (r.features[i].properties.Photo != null)
                photo = r.features[i].properties.Photo.trim()
            if (photo.startsWith("\"")) photo = photo.substring(1, photo.length())
            photo = photo.replace(",", ";")
            photo = photo.replace(" ", ";")
            s.setPhoto(photo)
            s.setDate(r.features[i].properties.Date)
            s.setTime(r.features[i].properties.Time)
            if (r.features[i].properties.Time == null) s.setTime(" ")
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
            render ex.getMessage() + "<br/>"
            ex.printStackTrace()
        }
    }

    def building_import2(Object r, int i) {
        try {
            Building s = new Building()
            s.setIsland(r.features[i].properties.Island)
            s.setTeam(String.valueOf(r.features[i].properties.Team))
            s.setVillageName(r.features[i].properties.VillageName)
            s.setBuildingID(r.features[i].properties.BuildingID)
            s.setBuildingType(r.features[i].properties.BuildingType)
            if (r.features[i].properties.BuildingType == null) s.setBuildingType(" ")
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
            String photo = r.features[i].properties.Photo
            if (photo != null) photo = photo.trim()
            if (photo == null) photo = ""
            if (photo.startsWith("\"")) photo = photo.substring(1, photo.length())
            photo = photo.replace(",", ";")
            photo = photo.replace(" ", ";")
            s.setPhoto(photo)
            s.setDate(r.features[i].properties.Date)
            s.setTime(r.features[i].properties.Time)
            if (r.features[i].properties.Time == null) s.setTime(" ")
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
            render ex.getMessage() + "<br/>"
            ex.printStackTrace()
        }
    }

    def building() {
        render "<h1>Importing Building...</h1>"
        String path = "/home/sachin/tmp/json/"
        new File(path).listFiles().each { f ->
            if (f.toString().endsWith("building.geojson")) {
                render "<h3>Import : " + f.getName() + "</h3>"
                def slurper = new JsonSlurper()
                def r = slurper.parseText(f.getText())
                for (int i = 0; i < 500; i++) {
                    if (r.features[i] != null) {
                        if (r.features[i].properties.Buildingid != null) building_import1(r, i)
                        if (r.features[i].properties.BuildingID != null) building_import2(r, i)
                    }
                }
            }
        }
        render "Done."
    }

    def storage() {
        render "<h1>Importing Storage...</h1>"
        String path = "/home/sachin/tmp/json/"
        new File(path).listFiles().each { f ->
            if (f.toString().endsWith("storage.geojson")) {
                render "<h3>Import : " + f.getName() + "</h3>"
                def slurper = new JsonSlurper()
                def r = slurper.parseText(f.getText())
                for (int i = 0; i < 500; i++) {
                    if (r.features[i] != null) {
                        if (r.features[i].properties.Tankid != null) storage_import1(r, i)
                        if (r.features[i].properties.TankID != null) storage_import2(r, i)
                    }
                }
            }
        }
        render "Done."
    }

    def storage_import1(Object r, int i) {
        try {
            Storage s = new Storage()
            s.setIsland(r.features[i].properties.Island)
            s.setTeam(r.features[i].properties.Team)
            s.setVillageName(r.features[i].properties.Villagenam)
            s.setJoinedToBuilding(String.valueOf(r.features[i].properties.Joined_to_))
            s.setTankID(r.features[i].properties.Tankid)
            s.setTankType(r.features[i].properties.Tank_type)
            if (r.features[i].properties.Tank_type == null)
                s.setTankType(" ")
            s.setScreenOnTankEntry(r.features[i].properties.Screenonta)
            if (r.features[i].properties.Screenonta == null)
                s.setScreenOnTankEntry(" ")
            s.setStorageVolume(r.features[i].properties.Storagevol)
            if (r.features[i].properties.Storagevol == null)
                s.setStorageVolume(" ")
            s.setTankHeight(String.valueOf(r.features[i].properties.Tankheight))
            if (r.features[i].properties.Tankheight == null)
                s.setTankHeight(" ")
            s.setTankDiameter(String.valueOf(r.features[i].properties.Tankdiamet))
            if (r.features[i].properties.Tankdiamet == null)
                s.setTankDiameter(" ")
            s.setStorageCondition(r.features[i].properties.Storagecon)
            if (r.features[i].properties.Storagecon == null)
                s.setStorageCondition(" ")
            s.setAbstractionType2(r.features[i].properties.Abstractio)
            if (r.features[i].properties.Abstractio == null) {
                s.setAbstractionType2(" ")
            }
            s.setBacteriologicalSample2(r.features[i].properties.Bacteriolo)
            if (r.features[i].properties.Bacteriolo == null)
                s.setBacteriologicalSample2(" ")
            s.setCisternHeight(String.valueOf(r.features[i].properties.Cisternhei))
            if (r.features[i].properties.Cisternhei == null)
                s.setCisternHeight(" ")
            s.setCisternWidth(String.valueOf(r.features[i].properties.Cisternwid))
            if (r.features[i].properties.Cisternwid == null)
                s.setCisternWidth(" ")
            s.setCisternLength(String.valueOf(r.features[i].properties.Cisternlen))
            if (r.features[i].properties.Cisternlen == null)
                s.setCisternLength(" ")
            s.setCisternCondition(r.features[i].properties.Cisterncon)
            if (r.features[i].properties.Cisterncon == null)
                s.setCisternCondition(" ")
            s.setAbstractionType1(r.features[i].properties.Abstracti2)
            if (r.features[i].properties.Abstracti2 == null)
                s.setAbstractionType1(" ")
            s.setBacteriologicalSample1(r.features[i].properties.Bacteriol2)
            if (r.features[i].properties.Bacteriol2 == null)
                s.setBacteriologicalSample1(" ")
            s.setImprovements1(r.features[i].properties.Improvemen)
            if (r.features[i].properties.Improvemen == null)
                s.setImprovements1(" ")
            s.setImprovements2(r.features[i].properties.Improveme2)
            if (r.features[i].properties.Improveme2 == null)
                s.setImprovements2(" ")
            s.setImprovements3(r.features[i].properties.Improveme3)
            if (r.features[i].properties.Improveme3 == null)
                s.setImprovements3(" ")
            s.setComments(r.features[i].properties.Comments)
            if (r.features[i].properties.Comments == null)
                s.setComments(" ")
            String photo = ""
            if (r.features[i].properties.Photo != null)
                photo = r.features[i].properties.Photo.trim()
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
            render ex.getMessage() + "<br/>"
            ex.printStackTrace()
        }
    }

    def storage_import2(Object r, int i) {
        try {
            Storage s = new Storage()
            s.setIsland(r.features[i].properties.Island)
            s.setTeam(r.features[i].properties.Team)
            s.setVillageName(r.features[i].properties.VillageName)
            s.setJoinedToBuilding(String.valueOf(r.features[i].properties.Joined_to_Building))
            s.setTankID(r.features[i].properties.TankID)
            s.setTankType(r.features[i].properties.Tank_type)
            if (r.features[i].properties.Tank_type == null) s.setTankType(" ")
            s.setScreenOnTankEntry(r.features[i].properties.ScreenonTankEntry)
            if (r.features[i].properties.ScreenonTankEntry == null) s.setScreenOnTankEntry(" ")
            s.setStorageVolume(r.features[i].properties.StorageVolume)
            if (r.features[i].properties.StorageVolume == null) s.setStorageVolume(" ")
            s.setTankHeight(String.valueOf(r.features[i].properties.TankHeight))
            if (r.features[i].properties.TankHeight == null) s.setTankHeight(" ")
            s.setTankDiameter(String.valueOf(r.features[i].properties.TankDiameter))
            if (r.features[i].properties.TankDiameter) s.setTankDiameter(" ")
            s.setStorageCondition(r.features[i].properties.StorageCondition)
            if (r.features[i].properties.StorageCondition == null) s.setStorageCondition(" ")
            s.setAbstractionType2(r.features[i].properties.AbstractType2)
            if (r.features[i].properties.AbstractType2 == null) s.setAbstractionType2(" ")
            s.setBacteriologicalSample2(r.features[i].properties.BacteriologicalSmpl2)
            if (r.features[i].properties.BacteriologicalSmpl2 == null) s.setBacteriologicalSample2(" ")
            s.setCisternHeight(String.valueOf(r.features[i].properties.CisternHeight))
            if (r.features[i].properties.CisternHeight == null) s.setCisternHeight(" ")
            s.setCisternWidth(String.valueOf(r.features[i].properties.CisternWidth))
            s.setCisternLength(String.valueOf(r.features[i].properties.CisternLength))
            s.setCisternCondition(r.features[i].properties.CisternCondition)
            if (r.features[i].properties.CisternCondition == null) s.setCisternCondition(" ")
            s.setAbstractionType1(r.features[i].properties.AbstractType1)
            if (r.features[i].properties.AbstractType1 == null) s.setAbstractionType1(" ")
            s.setBacteriologicalSample1(r.features[i].properties.BacteriologicalSmpl)
            if (r.features[i].properties.BacteriologicalSmpl == null) s.setBacteriologicalSample1(" ")
            s.setImprovements1(r.features[i].properties.Improvements1)
            s.setImprovements2(r.features[i].properties.Improvements2)
            s.setImprovements3(r.features[i].properties.Improvements3)
            if (r.features[i].properties.Improvements1 == null) s.setImprovements1(" ")
            if (r.features[i].properties.Improvements2 == null) s.setImprovements2(" ")
            if (r.features[i].properties.Improvements3 == null) s.setImprovements3(" ")
            s.setComments(r.features[i].properties.Comments)
            if (r.features[i].properties.Comments == null) s.setComments(" ")
            String photo = r.features[i].properties.Photo
            if (photo != null) photo = photo.trim()
            if (photo == null) photo = ""
            if (photo.startsWith("\"")) photo = photo.substring(1, photo.length())
            photo = photo.replace(",", ";")
            photo = photo.replace(" ", ";")
            s.setPhoto(photo)
            s.setDate(r.features[i].properties.Date)
            s.setTime(r.features[i].properties.Time)
            if (r.features[i].properties.Date == null) s.setDate(" ")
            if (r.features[i].properties.Time == null) s.setTime(" ")
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
            render ex.getMessage() + "<br/>"
            ex.printStackTrace()
        }
    }

}
