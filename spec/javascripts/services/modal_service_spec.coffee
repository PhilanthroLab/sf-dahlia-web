do ->
  'use strict'
  describe 'ModalService', ->
    ModalService = undefined
    modalInstance =
      result: {then: -> { catch: -> }}
      close: jasmine.createSpy()
    modalMock =
      open: ->
        modalInstance
    $window = undefined
    alertTemplateUrl = 'shared/templates/alert_modal.html'
    defaultTemplateController = 'ModalInstanceController'
    defaultWindowClass = 'modal-large'

    beforeEach module('dahlia.services', ($provide)->
      $provide.value '$modal', modalMock
      return
    )

    beforeEach inject((_$window_, _ModalService_) ->
      $window = _$window_
      ModalService = _ModalService_
    )

    describe 'openModal', ->
      beforeEach ->
        spyOn(ModalService, 'closeModal').and.callThrough()
        spyOn(modalMock, 'open').and.callThrough()

      it 'calls ModalService.closeModal', ->
        ModalService.modalInstance = modalInstance
        ModalService.openModal()
        expect(ModalService.closeModal).toHaveBeenCalled()

      it 'creates a modal instance using a given template', ->
        expectedParams =
          templateUrl: alertTemplateUrl
          controller: defaultTemplateController
          windowClass: defaultWindowClass

        ModalService.openModal(alertTemplateUrl)

        expect(modalMock.open).toHaveBeenCalledWith(expectedParams)

    describe 'alert', ->
      beforeEach ->
        spyOn(ModalService, 'openModal').and.callThrough()
        spyOn(ModalService, 'closeModal').and.callThrough()

      it 'opens a modal with the alert template and given message', ->
        expect(ModalService.content.message).not.toBeDefined()
        expect(ModalService.modalInstance).toEqual null
        content =
          message: 'hi'
        ModalService.alert(content)
        expect(ModalService.modalInstance).not.toEqual null
        expect(ModalService.content.message).toEqual 'hi'
        expect(ModalService.openModal).toHaveBeenCalledWith(alertTemplateUrl)

      it 'adds onConfirm callback if passed in', ->
        fakeCallback = -> 'hi'
        ModalService.alert('yo', {onConfirm: fakeCallback})
        expect(ModalService.callbacks.onConfirm).toEqual fakeCallback

      it 'uses native browser alert if specified', ->
        spyOn($window, 'alert')
        content =
          message: 'yo'
        ModalService.alert(content, {nativeAlert: true})
        expect($window.alert).toHaveBeenCalledWith('yo')
        expect(ModalService.openModal).not.toHaveBeenCalled()

    describe 'closeModal', ->
      beforeEach ->
        ModalService._clearModalInstance = jasmine.createSpy()

      it 'closes the open modal instance', ->
        ModalService.modalInstance = modalInstance
        ModalService.closeModal()
        expect(ModalService.modalInstance.close).toHaveBeenCalled()

      it 'calls ModalService._clearModalInstance', ->
        ModalService.closeModal()
        expect(ModalService._clearModalInstance).toHaveBeenCalled()

    describe '_clearModalInstance', ->
      it 'sets the modal instance to null', ->
        ModalService.modalInstance = modalInstance
        ModalService._clearModalInstance()
        expect(ModalService.modalInstance).toEqual(null)
