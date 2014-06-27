import kiriwatsan.UserAccount

class BootStrap {

    def init = { servletContext ->
        //init users
        if (UserAccount.list().size() == 0) {
            UserAccount u = new UserAccount()
            u.setRealName("Sachindra Singh")
            u.setEmail("sachindra@sopac.org")
            u.setPassword("123")
            u.setOrganisation("Applied GeoScience and Technology Division SOPAC/SPC")
            u.setAdministrator(true)
            u.save(flush: true, failOnError: true)
        }
    }
    def destroy = {
    }
}
