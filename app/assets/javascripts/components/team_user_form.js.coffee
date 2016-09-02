@TeamUserForm = React.createClass

  handleSubmit: (e) ->
    e.preventDefault()
    $.post 'teams', { team: @state }, (data) =>
      @props.handleNewTeam data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'team_user_form'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.h3
          className: 'title'
          'Add new teammate'

        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          'Add teammate'

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
