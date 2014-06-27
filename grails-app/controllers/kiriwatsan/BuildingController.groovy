package kiriwatsan

import org.springframework.dao.DataIntegrityViolationException

/**
 * BuildingController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class BuildingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [buildingInstanceList: Building.list(params), buildingInstanceTotal: Building.count()]
    }

    def create() {
        [buildingInstance: new Building(params)]
    }

    def save() {
        def buildingInstance = new Building(params)
        if (!buildingInstance.save(flush: true)) {
            render(view: "create", model: [buildingInstance: buildingInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'building.label', default: 'Building'), buildingInstance.id])
        redirect(action: "show", id: buildingInstance.id)
    }

    def show() {
        def buildingInstance = Building.get(params.id)
        if (!buildingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'building.label', default: 'Building'), params.id])
            redirect(action: "list")
            return
        }

        def photos = []
        String photo = buildingInstance.getPhoto().trim()
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

        [buildingInstance: buildingInstance, photos: photos]
    }

    def edit() {
        def buildingInstance = Building.get(params.id)
        if (!buildingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'building.label', default: 'Building'), params.id])
            redirect(action: "list")
            return
        }

        [buildingInstance: buildingInstance]
    }

    def update() {
        def buildingInstance = Building.get(params.id)
        if (!buildingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'building.label', default: 'Building'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (buildingInstance.version > version) {
                buildingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'building.label', default: 'Building')] as Object[],
                        "Another user has updated this Building while you were editing")
                render(view: "edit", model: [buildingInstance: buildingInstance])
                return
            }
        }

        buildingInstance.properties = params

        if (!buildingInstance.save(flush: true)) {
            render(view: "edit", model: [buildingInstance: buildingInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'building.label', default: 'Building'), buildingInstance.id])
        redirect(action: "show", id: buildingInstance.id)
    }

    def delete() {
        def buildingInstance = Building.get(params.id)
        if (!buildingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'building.label', default: 'Building'), params.id])
            redirect(action: "list")
            return
        }

        try {
            buildingInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'building.label', default: 'Building'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'building.label', default: 'Building'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
