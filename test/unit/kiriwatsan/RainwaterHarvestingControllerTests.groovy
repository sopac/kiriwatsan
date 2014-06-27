package kiriwatsan



import org.junit.*
import grails.test.mixin.*

/**
 * RainwaterHarvestingControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(RainwaterHarvestingController)
@Mock(RainwaterHarvesting)
class RainwaterHarvestingControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/rainwaterHarvesting/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.rainwaterHarvestingInstanceList.size() == 0
        assert model.rainwaterHarvestingInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.rainwaterHarvestingInstance != null
    }

    void testSave() {
        controller.save()

        assert model.rainwaterHarvestingInstance != null
        assert view == '/rainwaterHarvesting/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/rainwaterHarvesting/show/1'
        assert controller.flash.message != null
        assert RainwaterHarvesting.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/rainwaterHarvesting/list'


        populateValidParams(params)
        def rainwaterHarvesting = new RainwaterHarvesting(params)

        assert rainwaterHarvesting.save() != null

        params.id = rainwaterHarvesting.id

        def model = controller.show()

        assert model.rainwaterHarvestingInstance == rainwaterHarvesting
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/rainwaterHarvesting/list'


        populateValidParams(params)
        def rainwaterHarvesting = new RainwaterHarvesting(params)

        assert rainwaterHarvesting.save() != null

        params.id = rainwaterHarvesting.id

        def model = controller.edit()

        assert model.rainwaterHarvestingInstance == rainwaterHarvesting
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/rainwaterHarvesting/list'

        response.reset()


        populateValidParams(params)
        def rainwaterHarvesting = new RainwaterHarvesting(params)

        assert rainwaterHarvesting.save() != null

        // test invalid parameters in update
        params.id = rainwaterHarvesting.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/rainwaterHarvesting/edit"
        assert model.rainwaterHarvestingInstance != null

        rainwaterHarvesting.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/rainwaterHarvesting/show/$rainwaterHarvesting.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        rainwaterHarvesting.clearErrors()

        populateValidParams(params)
        params.id = rainwaterHarvesting.id
        params.version = -1
        controller.update()

        assert view == "/rainwaterHarvesting/edit"
        assert model.rainwaterHarvestingInstance != null
        assert model.rainwaterHarvestingInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/rainwaterHarvesting/list'

        response.reset()

        populateValidParams(params)
        def rainwaterHarvesting = new RainwaterHarvesting(params)

        assert rainwaterHarvesting.save() != null
        assert RainwaterHarvesting.count() == 1

        params.id = rainwaterHarvesting.id

        controller.delete()

        assert RainwaterHarvesting.count() == 0
        assert RainwaterHarvesting.get(rainwaterHarvesting.id) == null
        assert response.redirectedUrl == '/rainwaterHarvesting/list'
    }
}
