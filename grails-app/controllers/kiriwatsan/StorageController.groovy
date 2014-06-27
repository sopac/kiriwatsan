package kiriwatsan

import org.springframework.dao.DataIntegrityViolationException

/**
 * StorageController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class StorageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [storageInstanceList: Storage.list(params), storageInstanceTotal: Storage.count()]
    }

    def create() {
        [storageInstance: new Storage(params)]
    }

    def save() {
        def storageInstance = new Storage(params)
        if (!storageInstance.save(flush: true)) {
            render(view: "create", model: [storageInstance: storageInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'storage.label', default: 'Storage'), storageInstance.id])
        redirect(action: "show", id: storageInstance.id)
    }

    def show() {
        def storageInstance = Storage.get(params.id)
        if (!storageInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'storage.label', default: 'Storage'), params.id])
            redirect(action: "list")
            return
        }

        def photos = []
        String photo = storageInstance.getPhoto().trim()
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

        [storageInstance: storageInstance, photos: photos]
    }

    def edit() {
        def storageInstance = Storage.get(params.id)
        if (!storageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storage.label', default: 'Storage'), params.id])
            redirect(action: "list")
            return
        }

        [storageInstance: storageInstance]
    }

    def update() {
        def storageInstance = Storage.get(params.id)
        if (!storageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storage.label', default: 'Storage'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (storageInstance.version > version) {
                storageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'storage.label', default: 'Storage')] as Object[],
                          "Another user has updated this Storage while you were editing")
                render(view: "edit", model: [storageInstance: storageInstance])
                return
            }
        }

        storageInstance.properties = params

        if (!storageInstance.save(flush: true)) {
            render(view: "edit", model: [storageInstance: storageInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'storage.label', default: 'Storage'), storageInstance.id])
        redirect(action: "show", id: storageInstance.id)
    }

    def delete() {
        def storageInstance = Storage.get(params.id)
        if (!storageInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'storage.label', default: 'Storage'), params.id])
            redirect(action: "list")
            return
        }

        try {
            storageInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'storage.label', default: 'Storage'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'storage.label', default: 'Storage'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
