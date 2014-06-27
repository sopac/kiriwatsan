package kiriwatsan



import org.junit.*
import grails.test.mixin.*

/**
 * BuildingControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(BuildingController)
@Mock(Building)
class BuildingControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/building/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.buildingInstanceList.size() == 0
        assert model.buildingInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.buildingInstance != null
    }

    void testSave() {
        controller.save()

        assert model.buildingInstance != null
        assert view == '/building/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/building/show/1'
        assert controller.flash.message != null
        assert Building.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/building/list'


        populateValidParams(params)
        def building = new Building(params)

        assert building.save() != null

        params.id = building.id

        def model = controller.show()

        assert model.buildingInstance == building
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/building/list'


        populateValidParams(params)
        def building = new Building(params)

        assert building.save() != null

        params.id = building.id

        def model = controller.edit()

        assert model.buildingInstance == building
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/building/list'

        response.reset()


        populateValidParams(params)
        def building = new Building(params)

        assert building.save() != null

        // test invalid parameters in update
        params.id = building.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/building/edit"
        assert model.buildingInstance != null

        building.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/building/show/$building.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        building.clearErrors()

        populateValidParams(params)
        params.id = building.id
        params.version = -1
        controller.update()

        assert view == "/building/edit"
        assert model.buildingInstance != null
        assert model.buildingInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/building/list'

        response.reset()

        populateValidParams(params)
        def building = new Building(params)

        assert building.save() != null
        assert Building.count() == 1

        params.id = building.id

        controller.delete()

        assert Building.count() == 0
        assert Building.get(building.id) == null
        assert response.redirectedUrl == '/building/list'
    }
}
