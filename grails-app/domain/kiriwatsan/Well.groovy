package kiriwatsan

/**
 * Well
 * A domain class describes the data object and it's mapping to the database
 */
class Well {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    String island
    String team
    String villageName
    String wellID
    String wellType
    String wellOwner
    String casingType
    String wellCover
    String wellCoverCondition
    String wellCoverMaterial
    String fencingCondition
    String fencingMaterial
    String wellApronSize
    String wellApronMaterial
    String wellApronCondition
    String abstractionType
    String pumpStatus
    String useOfWater
    String householdUsage
    String peopleUsage
    String contaminationSource
    String contaminationDist
    String diameterInternal
    String parapetHeight
    String distanceToWaterTable
    String totalDepth
    String salinityTop_mScm
    String salinityBase_mScm
    String bacteriological
    String nitrateNitrite
    String wellImprovements1
    String wellImprovements2
    String wellImprovements3
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
        wellID()
        island()
        villageName()
        wellType()
        wellOwner()
        casingType(nullable: true)
        wellCover(nullable: true)
        wellCoverCondition(nullable: true)
        wellCoverMaterial(nullable: true)
        fencingCondition(nullable: true)
        fencingMaterial(nullable: true)
        wellApronSize(nullable: true)
        wellApronMaterial(nullable: true)
        wellApronCondition(nullable: true)
        abstractionType(nullable: true)
        pumpStatus(nullable: true)
        useOfWater(maxSize: 750, nullable: true)
        householdUsage(nullable: true)
        peopleUsage(nullable: true)
        contaminationSource(nullable: true)
        contaminationDist(nullable: true)
        diameterInternal(nullable: true)
        parapetHeight(nullable: true)
        distanceToWaterTable(nullable: true)
        totalDepth(nullable: true)
        salinityTop_mScm(nullable: true)
        salinityBase_mScm(nullable: true)
        bacteriological(nullable: true)
        nitrateNitrite(nullable: true)
        wellImprovements1(maxSize: 750, nullable: true)
        wellImprovements2(maxSize: 750, nullable: true)
        wellImprovements3(maxSize: 750, nullable: true)
        sanitation(nullable: true)
        comments(maxSize: 750, nullable: true)
        photo(nullable: true)
        reportPhoto(nullable: true)
        date()
        time()
        team()
        longitude()
        latitude()
    }

    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
