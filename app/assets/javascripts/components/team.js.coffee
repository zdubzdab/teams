@Team = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    e.preventDefault()
    data =
      name: ReactDOM.findDOMNode(@refs.name).value
      description: ReactDOM.findDOMNode(@refs.description).value
    $.ajax
      method: 'PUT'
      url: "/teams/#{ @props.team.id }"
      dataType: 'JSON'
      data:
        team: data
      success: (data) =>
        @setState edit: false
        @props.handleEditTeam @props.team, data

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/teams/#{ @props.team.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteTeam @props.team

  recordRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.team.name
      React.DOM.td null, @props.team.description
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'

  recordForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.team.name
          ref: 'name'

      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.team.description
          ref: 'description'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'

  render: ->
    if @state.edit
      @recordForm()
    else
      @recordRow()
