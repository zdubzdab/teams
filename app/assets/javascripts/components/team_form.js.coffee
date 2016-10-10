@TeamForm = React.createClass
  getInitialState: ->
    name: ''
    description: ''

  handleSubmit: (e) ->
    e.preventDefault()
    $.post 'teams', { team: @state }, (data) =>
      @props.handleNewTeam data
      @setState @getInitialState()
    , 'JSON'

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.name && @state.description

  not_admin: ->
    @props.user_id != 1

  userFormTag: (children) ->
    React.DOM.form
      className: 'team_form'
      onSubmit: @handleSubmit
      children

  header: ->
    React.DOM.div
      className: 'form-group'
      React.DOM.h3
        className: 'title'
        'Team creation'

  titleInput: ->
    React.DOM.div
      className: 'form-group'
      React.DOM.input
        type: 'text'
        className: 'form-control'
        placeholder: 'Name'
        key: 'name'
        name: 'name'
        value: @state.name
        onChange: @handleChange

  descriptionInput: ->
    React.DOM.div
      className: 'form-group'
      React.DOM.textarea
        type: 'text'
        className: 'form-control'
        placeholder: 'Description'
        name: 'description'
        value: @state.description
        onChange: @handleChange

  submit: ->
    React.DOM.button
      type: 'submit'
      className: 'btn btn-primary'
      disabled: !@valid() || @not_admin()
      'Create team'

  render: ->
    @userFormTag [
      @header()
      @titleInput()
      @descriptionInput()
      @submit()
    ]
