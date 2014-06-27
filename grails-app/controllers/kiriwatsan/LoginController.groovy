package kiriwatsan

class LoginController {

    def index() {}

    def secure() {}

    def doLogin() {
        try {
            UserAccount u = UserAccount.findByEmail(params.username)
            if (u.password.equals(params.password.trim())) {
                session['user'] = u.realName
                session['admin'] = u.administrator
                session['organisation'] = u.organisation
                flash.message = "Welcome " + u.realName + " - " + u.organisation
                redirect(uri: "/")
            } else {
                flash.message = "Login Failed. Verify Your Username or Password..."
                redirect(controller: 'login', action: 'index')
            }
        } catch (Exception ex) {
            ex.printStackTrace()
            flash.message = "Login Failed. Verify Your Username or Password..."
            redirect(controller: 'login', action: 'index')
        }
    }

    def logout() {
        String tmp = session['user']
        session['user'] = null
        session['organisation'] = null
        session['admin'] = false
        flash.message = tmp + " Logged Out..."
        redirect(controller: 'login')
    }
}
