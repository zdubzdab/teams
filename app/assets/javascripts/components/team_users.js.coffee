@TeamUsers = React.createClass
  getInitialState: ->
    team_users: @props.team_users
    users: @props.users

  getDefaultProps: ->
    team_users: []

  addTeamUser: (team_user) ->
    team_users = @state.team_users.slice()
# creation js object team_user with user name email role and paste it into table
    users = @props.users
    roles = @props.roles
    user_id = team_user.user_id
    user = $.grep(users, (e) ->
      e.id == user_id
    )
    role_id = user[0].role_id
    user_name = user[0].name
    user_email = user[0].email
    role = $.grep(roles, (e) ->
      e.id == role_id
    )
    role_name = role[0].name
    team_user_for_table = {}
    team_user_for_table.email = user_email
    team_user_for_table.name = user_name
    team_user_for_table.id = team_user.id
    team_user_for_table.role = role_name
    team_users.push team_user_for_table
    @setState team_users: team_users


  deleteTeamUser: (team_user) ->
    team_users = @state.team_users.slice()
    index = team_users.indexOf team_user
    team_users.splice index, 1
    @replaceState team_users: team_users

  render: ->
    React.DOM.div
      className: 'col-md-12'
      React.DOM.div
        className: 'header_links'
        React.DOM.a
          className: 'link'
          href: "/"
          'Main page'
      React.DOM.div
        className: 'col-md-9'
        React.DOM.h3
          className: 'title'
          "Team: "
          @state.team_users[0].team_name
        React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th
                className: "th_width_20"
                'Name'
              React.DOM.th
                className: "th_width_32"
                'Email'
              React.DOM.th
                className: "th_width_30"
                'Role'
              React.DOM.th
                className: "th_width_18"
                'Actions'
          React.DOM.tbody null,
            for team_user in @state.team_users
              React.createElement TeamUser, key: team_user.id, team_user: team_user,
              handleDeleteTeamUser: @deleteTeamUser

      React.DOM.div
        className: 'col-md-3'
        React.createElement TeamUserForm, users: this.state.users,
        team_users: this.state.team_users, handleNewTeamUser: @addTeamUser
