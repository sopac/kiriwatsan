package kiriwatsan

/**
 * UserAccount
 * A domain class describes the data object and it's mapping to the database
 */
class UserAccount {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    String realName
    String email
    String password
    String organisation = "Applied GeoScience and Technology Division SOPAC/SPC"
    boolean administrator

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
        realName()
        email(email: true)
        password(password: true)
        organisation()
        administrator()
    }

    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
