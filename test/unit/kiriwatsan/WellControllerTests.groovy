package kiriwatsan



import org.junit.*
import grails.test.mixin.*

/**
 * WellControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(WellController)
@Mock(Well)
class WellControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/well/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.wellInstanceList.size() == 0
        assert model.wellInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.wellInstance != null
    }

    void testSave() {
        controller.save()

        assert model.wellInstance != null
        assert view == '/well/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/well/show/1'
        assert controller.flash.message != null
        assert Well.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/well/list'


        populateValidParams(params)
        def well = new Well(params)

        assert well.save() != null

        params.id = well.id

        def model = controller.show()

        assert model.wellInstance == well
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/well/list'


        populateValidParams(params)
        def well = new Well(params)

        assert well.save() != null

        params.id = well.id

        def model = controller.edit()

        assert model.wellInstance == well
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/well/list'

        response.reset()


        populateValidParams(params)
        def well = new Well(params)

        assert well.save() != null

        // test invalid parameters in update
        params.id = well.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/well/edit"
        assert model.wellInstance != null

        well.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/well/show/$well.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        well.clearErrors()

        populateValidParams(params)
        params.id = well.id
        params.version = -1
        controller.update()

        assert view == "/well/edit"
        assert model.wellInstance != null
        assert model.wellInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/well/list'

        response.reset()

        populateValidParams(params)
        def well = new Well(params)

        assert well.save() != null
        assert Well.count() == 1

        params.id = well.id

        controller.delete()

        assert Well.count() == 0
        assert Well.get(well.id) == null
        assert response.redirectedUrl == '/well/list'
    }
}
