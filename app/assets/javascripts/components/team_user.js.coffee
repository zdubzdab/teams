@TeamUser = React.createClass
  getInitialState: ->
    email: ''
    password: ''
    
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/teams/#{@props.team_user.team_id }/team_users/#{@props.team_user.team_user_id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteTeamUser @props.team_user

  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.team_user.name
      React.DOM.td null, @props.team_user.email 
      React.DOM.td null, @props.team_user.role 
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
