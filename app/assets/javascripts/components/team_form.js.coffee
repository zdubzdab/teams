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

  render: ->
    React.DOM.form
      className: 'team_form'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.h3
          className: 'title'
          'Team creation'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Name'
          name: 'name'
          value: @state.name
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.textarea
          type: 'text'
          className: 'form-control'
          placeholder: 'Description'
          name: 'description'
          value: @state.description
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid() || @not_admin()
        'Create team'

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.name && @state.description

  not_admin: ->
    @props.user_id != 1
