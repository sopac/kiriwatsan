package kiriwatsan

import org.springframework.dao.DataIntegrityViolationException

/**
 * WellController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class WellController {


    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        //params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def list = Well.listOrderByWellID(params)
        String listType = "Listing All Wells"

        if (params.village != null) {
            list = Well.findAllByVillageName(params.village, params)
            listType = "Listing Wells in Village " + params.village
        }
        if (params.island != null) {
            list = Well.findAllByIsland(params.island, params)
            listType = "Listing Wells in island " + params.island
        }

        [wellInstanceList: list, wellInstanceTotal: list.size(), listType: listType]


    }

    def create() {
        [wellInstance: new Well(params)]
    }

    def save() {
        def wellInstance = new Well(params)
        if (!wellInstance.save(flush: true)) {
            render(view: "create", model: [wellInstance: wellInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'well.label', default: 'Well'), wellInstance.id])
        redirect(action: "show", id: wellInstance.id)
    }

    def show() {
        def wellInstance = Well.get(params.id)
        if (!wellInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'well.label', default: 'Well'), params.id])
            redirect(action: "list")
            return
        }


        def photos = []
        String photo = wellInstance.getPhoto().trim()
        //single
        if (!photo.contains(";") && !photo.contains("-")) {
            photos << "DSC0" + photo.trim() + ".JPG"
        }
        //multi
        if (photo.contains(";")) {
            photo.split(";").each { p ->
                photos << "DSC0" + p.trim() + ".JPG"
            }
        }
        //range
        if (photo.contains("-")) {
            String[] arr = photo.split("-")
            int a = Integer.parseInt(arr[0].trim())
            int b = Integer.parseInt(arr[1].trim())

            for (int i = a; i <= b; i++) {
                photos << "DSC0" + i.toString() + ".JPG"
            }
        }
        if (photo.trim().equals("") || photo == null) photos.clear()

        [wellInstance: wellInstance, photos: photos]
    }

    def edit() {
        def wellInstance = Well.get(params.id)
        if (!wellInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'well.label', default: 'Well'), params.id])
            redirect(action: "list")
            return
        }

        [wellInstance: wellInstance]
    }

    def update() {
        def wellInstance = Well.get(params.id)
        if (!wellInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'well.label', default: 'Well'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (wellInstance.version > version) {
                wellInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'well.label', default: 'Well')] as Object[],
                        "Another user has updated this Well while you were editing")
                render(view: "edit", model: [wellInstance: wellInstance])
                return
            }
        }

        wellInstance.properties = params

        if (!wellInstance.save(flush: true)) {
            render(view: "edit", model: [wellInstance: wellInstance])
            return
        }

        println Well.get(params.id).abstractionType
        flash.message = message(code: 'default.updated.message', args: [message(code: 'well.label', default: 'Well'), wellInstance.id])
        redirect(action: "show", id: wellInstance.id)
    }

    def delete() {
        def wellInstance = Well.get(params.id)
        if (!wellInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'well.label', default: 'Well'), params.id])
            redirect(action: "list")
            return
        }

        try {
            wellInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'well.label', default: 'Well'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'well.label', default: 'Well'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
