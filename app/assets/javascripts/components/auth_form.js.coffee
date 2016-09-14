@AuthForm = React.createClass
  getInitialState: ->
    email: ''
    password: ''

  handleSubmit: (e) ->
    e.preventDefault()
    $.ajax
      method: 'POST'
      url: '/users/sign_in'
      data:
        user: @state,
      beforeSend: (xhr) =>
        token = $('meta[name="csrf-token"]').attr('content')
        xhr.setRequestHeader('X-CSRF-Token', token)
      success: () =>
        @setState @getInitialState()
      dataType: 'script'

  render: ->
    React.DOM.div
      className: 'col-md-4 col-md-offset-4'
      React.DOM.form
        className: 'auth_form'
        onSubmit: @handleSubmit
        React.DOM.input
          type: 'hidden'
          name: $('meta[name="csrf-param"]').attr('content')
          value: $('meta[name="csrf-token"]').attr('content')
        React.DOM.div
          className: 'form-group'
          React.DOM.h3
            className: 'title'
            'Sign in'
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
          id: "b_sign_in"
          disabled: !@valid()
          'Sign in'

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.email && @state.password
