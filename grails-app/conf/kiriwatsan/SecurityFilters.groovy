package kiriwatsan

class SecurityFilters {

    def filters = {


        home(uri: "/") {
            before = {
                if (session['user'] == null) {
                    redirect(controller: "login")
                    return false
                }
            }
        }

        login(controller: '*', action: 'list') {
            before = {
                if (session['user'] == null) {
                    redirect(controller: "login")
                    return false
                }
            }
        }


        show(controller: '*', action: 'show') {
            before = {
                if (session['user'] == null) {
                    redirect(controller: "login")
                    return false
                }
            }
        }

        create(controller: '*', action: 'create') {
            before = {
                if (session['admin'] != true) {
                    redirect(controller: "login", action: "secure")
                    return false
                }
            }
        }


        delete(controller: '*', action: 'delete') {
            before = {
                if (session['admin'] != true) {
                    redirect(controller: "login", action: "secure")
                    return false
                }
            }
        }

        edit(controller: '*', action: 'edit') {
            before = {
                if (session['admin'] != true) {
                    redirect(controller: "login", action: "secure")
                    return false
                }
            }
        }

        create(controller: '*', action: 'create') {
            before = {
                if (session['admin'] != true) {
                    redirect(controller: "login", action: "secure")
                    return false
                }
            }
        }

    }
}
