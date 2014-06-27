package kiriwatsan

/**
 * Building
 * A domain class describes the data object and it's mapping to the database
 */
class Building {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    String island
    String team
    String villageName
    String buildingID
    String buildingType
    String owner
    String roofLength
    String roofWidth
    String roofHeight
    String roofMaterial
    String roofConditions
    String fasciaBoard
    String gutteringCondition
    String gutterCoverage
    String downPipe
    String overhangingVegetation
    String sanitation
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
        buildingID()
        island()
        villageName()
        buildingType()
        owner()
        team()
        roofLength()
        roofWidth()
        roofHeight()
        roofMaterial(nullable: true)
        roofConditions(nullable: true)
        fasciaBoard(nullable: true)
        gutteringCondition(nullable: true)
        gutterCoverage(nullable: true)
        downPipe(nullable: true)
        overhangingVegetation(nullable: true)
        sanitation(nullable: true)
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
        return buildingID //+ "(" + villageName + ", " + island + ")"
    }
}
