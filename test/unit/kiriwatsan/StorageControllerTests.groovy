package kiriwatsan



import org.junit.*
import grails.test.mixin.*

/**
 * StorageControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(StorageController)
@Mock(Storage)
class StorageControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/storage/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.storageInstanceList.size() == 0
        assert model.storageInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.storageInstance != null
    }

    void testSave() {
        controller.save()

        assert model.storageInstance != null
        assert view == '/storage/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/storage/show/1'
        assert controller.flash.message != null
        assert Storage.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/storage/list'


        populateValidParams(params)
        def storage = new Storage(params)

        assert storage.save() != null

        params.id = storage.id

        def model = controller.show()

        assert model.storageInstance == storage
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/storage/list'


        populateValidParams(params)
        def storage = new Storage(params)

        assert storage.save() != null

        params.id = storage.id

        def model = controller.edit()

        assert model.storageInstance == storage
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/storage/list'

        response.reset()


        populateValidParams(params)
        def storage = new Storage(params)

        assert storage.save() != null

        // test invalid parameters in update
        params.id = storage.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/storage/edit"
        assert model.storageInstance != null

        storage.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/storage/show/$storage.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        storage.clearErrors()

        populateValidParams(params)
        params.id = storage.id
        params.version = -1
        controller.update()

        assert view == "/storage/edit"
        assert model.storageInstance != null
        assert model.storageInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/storage/list'

        response.reset()

        populateValidParams(params)
        def storage = new Storage(params)

        assert storage.save() != null
        assert Storage.count() == 1

        params.id = storage.id

        controller.delete()

        assert Storage.count() == 0
        assert Storage.get(storage.id) == null
        assert response.redirectedUrl == '/storage/list'
    }
}
