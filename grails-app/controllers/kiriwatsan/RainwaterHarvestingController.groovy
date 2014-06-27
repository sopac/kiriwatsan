package kiriwatsan

import org.springframework.dao.DataIntegrityViolationException

/**
 * RainwaterHarvestingController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class RainwaterHarvestingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        def list = RainwaterHarvesting.list(params)
        String listType = "Listing All Rainwater Harvesting Buildings and Storage"

        if (params.village != null) {
            def resList = []
            list.each { r ->
                if (r.building.villageName.equals(params.village)) resList << r
            }
            listType = "Listing Rainwater Harvesting in Village " + params.village
            list = resList
        }
        if (params.island != null) {
            def resList = []
            list.each { r ->
                if (r.building.island.equals(params.island)) resList << r
            }
            listType = "Listing Rainwater Harvesting in island " + params.island
            list = resList
        }

        [rainwaterHarvestingInstanceList: list, rainwaterHarvestingInstanceTotal: list.size(), listType: listType]
    }

    def create() {
        [rainwaterHarvestingInstance: new RainwaterHarvesting(params)]
    }

    def save() {
        def rainwaterHarvestingInstance = new RainwaterHarvesting(params)
        if (!rainwaterHarvestingInstance.save(flush: true)) {
            render(view: "create", model: [rainwaterHarvestingInstance: rainwaterHarvestingInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'rainwaterHarvesting.label', default: 'RainwaterHarvesting'), rainwaterHarvestingInstance.id])
        redirect(action: "show", id: rainwaterHarvestingInstance.id)
    }

    def show() {
        def rainwaterHarvestingInstance = RainwaterHarvesting.get(params.id)
        if (!rainwaterHarvestingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rainwaterHarvesting.label', default: 'RainwaterHarvesting'), params.id])
            redirect(action: "list")
            return
        }

        def photos = []
        String photo = rainwaterHarvestingInstance.getBuilding().getPhoto().trim()
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

        [rainwaterHarvestingInstance: rainwaterHarvestingInstance, photos: photos]
    }

    def edit() {
        def rainwaterHarvestingInstance = RainwaterHarvesting.get(params.id)
        if (!rainwaterHarvestingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rainwaterHarvesting.label', default: 'RainwaterHarvesting'), params.id])
            redirect(action: "list")
            return
        }

        [rainwaterHarvestingInstance: rainwaterHarvestingInstance]
    }

    def update() {
        def rainwaterHarvestingInstance = RainwaterHarvesting.get(params.id)
        if (!rainwaterHarvestingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rainwaterHarvesting.label', default: 'RainwaterHarvesting'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (rainwaterHarvestingInstance.version > version) {
                rainwaterHarvestingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'rainwaterHarvesting.label', default: 'RainwaterHarvesting')] as Object[],
                        "Another user has updated this RainwaterHarvesting while you were editing")
                render(view: "edit", model: [rainwaterHarvestingInstance: rainwaterHarvestingInstance])
                return
            }
        }

        rainwaterHarvestingInstance.properties = params

        if (!rainwaterHarvestingInstance.save(flush: true)) {
            render(view: "edit", model: [rainwaterHarvestingInstance: rainwaterHarvestingInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'rainwaterHarvesting.label', default: 'RainwaterHarvesting'), rainwaterHarvestingInstance.id])
        redirect(action: "show", id: rainwaterHarvestingInstance.id)
    }

    def delete() {
        def rainwaterHarvestingInstance = RainwaterHarvesting.get(params.id)
        if (!rainwaterHarvestingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rainwaterHarvesting.label', default: 'RainwaterHarvesting'), params.id])
            redirect(action: "list")
            return
        }

        try {
            rainwaterHarvestingInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'rainwaterHarvesting.label', default: 'RainwaterHarvesting'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'rainwaterHarvesting.label', default: 'RainwaterHarvesting'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
