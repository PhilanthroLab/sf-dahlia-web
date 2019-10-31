do ->
  'use strict'
  describe 'Application Summary', ->
    $componentController = undefined
    ctrl = undefined
    locals = undefined
    $filter = undefined

    fakeApplication =
      preferences:
        documents:
          rentBurden: {}
        optOut: {}
      groupedHouseholdAddresses: [
        {
          address: '123 Main St'
          monthlyRent: 100
          members: []
        }
      ]
    fakeListing = getJSONFixture('listings-api-show.json').listing
    fakeBindings =
      alternateContact: {}
      applicant: {}
      application: fakeApplication
      householdMembers: {}
      isRental: {}
      isSale: {}
      listing: {}
      preferences: {}

    fakeLendingInstitutionService =
      getLendingAgentName: jasmine.createSpy()
      getLendingInstitution: jasmine.createSpy()
    fakeShortFormHelperService =
      flagForI18n: jasmine.createSpy()
    fakeShortFormNavigationService =
      getStartOfSection: jasmine.createSpy()

    beforeEach module('dahlia.components')
    beforeEach module('customFilters', ($provide) ->)

    beforeEach inject((_$componentController_, $q, _$filter_) ->
      $componentController = _$componentController_
      $translate = {
        instant: jasmine.createSpy('$translate.instant').and.callFake((val) -> 'translated:' + val)
      }
      $filter = _$filter_
      deferred = $q.defer()
      locals =
        $state: {}
        $translate: $translate
        LendingInstitutionService: fakeLendingInstitutionService
        ShortFormHelperService: fakeShortFormHelperService
        ShortFormNavigationService: fakeShortFormNavigationService
    )

    beforeEach ->
      ctrl = $componentController 'applicationSummary', locals, fakeBindings

    describe 'continueDraftApplicantHasUpdatedInfo', ->
      it 'checks for dob updates when field is dob', ->
        dobA = { 'dob_day': 1, 'dob_month': 1, 'dob_year': 1920 }
        dobB = { 'dob_day': 12, 'dob_month': 1, 'dob_year': 1920 }
        ctrl.applicant = dobA
        ctrl.application.overwrittenApplicantInfo = dobA

        expect(ctrl.continueDraftApplicantHasUpdatedInfo('dob')).toEqual false
        ctrl.application.overwrittenApplicantInfo = dobB
        expect(ctrl.continueDraftApplicantHasUpdatedInfo('dob')).toEqual true

      it 'checks for name updates when field is name', ->
        nameA = { 'firstName': 'firstA', 'middleName': 'middleA', 'lastName': 'lastA'}
        nameB = { 'firstName': 'firstA', 'middleName': 'middleB', 'lastName': 'lastA'}
        ctrl.applicant = nameA
        ctrl.application.overwrittenApplicantInfo = nameA

        expect(ctrl.continueDraftApplicantHasUpdatedInfo('name')).toEqual false
        ctrl.application.overwrittenApplicantInfo = nameB
        expect(ctrl.continueDraftApplicantHasUpdatedInfo('name')).toEqual true

    describe 'applicationIncomeAmount', ->
      beforeEach ->
        ctrl.application = {'householdIncome': {
          'incomeTimeframe': 'per_month',
          'incomeTotal': '5000.123'
        }}
      it 'should return expected phrase for monthly income', ->
        expect(ctrl.applicationIncomeAmount()).toEqual '$5,000.12 translated:t.per_month'

      it 'should return expected phrase for yearly income', ->
        ctrl.application.householdIncome.incomeTimeframe = 'per_year'
        expect(ctrl.applicationIncomeAmount()).toEqual '$5,000.12 translated:t.per_year'

    describe 'getLendingAgentName', ->
      it 'should call LendingInstitutionService.getLendingAgentName with the given agent ID', ->
        id = 1234
        ctrl.getLendingAgentName(id)
        expect(fakeLendingInstitutionService.getLendingAgentName)
          .toHaveBeenCalledWith(id)

    describe 'getLendingInstitution', ->
      it 'should call LendingInstitutionService.getLendingInstitution with the given agent ID', ->
        id = 1234
        ctrl.getLendingInstitution(id)
        expect(fakeLendingInstitutionService.getLendingInstitution)
          .toHaveBeenCalledWith(id)