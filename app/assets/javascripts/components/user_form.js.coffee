@UserForm = React.createClass
  getInitialState: ->
    name: ''
    email: ''
    password: ''

  handleSubmit: (e) ->
    e.preventDefault()
    $.post 'users', { user: @state }, (data) =>
      @props.handleNewUser data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'user_form'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.h3
          className: 'title'
          'User creation'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Name'
          name: 'name'
          value: @state.name
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Email'
          name: 'email'
          value: @state.email
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'password'
          className: 'form-control'
          placeholder: 'Password'
          name: 'password'
          value: @state.password
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create team'

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.name && @state.email && @state.password

