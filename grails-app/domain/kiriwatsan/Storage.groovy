package kiriwatsan

/**
 * Storage
 * A domain class describes the data object and it's mapping to the database
 */
class Storage {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    String island
    String team
    String villageName
    String joinedToBuilding
    String tankID
    String tankType
    String screenOnTankEntry
    String storageVolume
    String tankHeight
    String tankDiameter
    String storageCondition
    String abstractionType2
    String bacteriologicalSample2
    String cisternHeight
    String cisternWidth
    String cisternLength
    String cisternCondition
    String abstractionType1
    String bacteriologicalSample1
    String improvements1
    String improvements2
    String improvements3
    String comments
    String photo
    String reportPhoto
    String date
    String time
    String longitude
    String latitude

    /* Automatic timestamping of GORM */
//	date	dateCreated
//	date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        tankID()
        island()
        villageName()
        joinedToBuilding()
        tankType(nullable: true)
        team()
        screenOnTankEntry(nullable: true)
        storageVolume(nullable: true)
        tankHeight(nullable: true)
        tankDiameter(nullable: true)
        storageCondition(nullable: true)
        abstractionType1(nullable: true)
        abstractionType2(nullable: true)
        bacteriologicalSample1(nullable: true)
        bacteriologicalSample2(nullable: true)
        cisternHeight(nullable: true)
        cisternWidth(nullable: true)
        cisternLength(nullable: true)
        cisternCondition(nullable: true)
        improvements1(nullable: true)
        improvements2(nullable: true)
        improvements3(nullable: true)
        comments(nullable: true)
        photo(nullable: true)
        reportPhoto(nullable: true)
        date()
        time()
        longitude(nullable: true, blank: true)
        latitude(nullable: true, blank: true)
    }

    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI 
    public String toString() {
        return tankID + " - " + villageName + " - " + island
    }
}
