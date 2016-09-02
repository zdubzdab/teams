@Teams = React.createClass
  getInitialState: ->
    user_id: @props.user_id
    teams: @props.data

  getDefaultProps: ->
    teams: []

  addTeam: (team) ->
    teams = @state.teams.slice()
    teams.push team
    @setState teams: teams

  deleteTeam: (team) ->
    teams = @state.teams.slice()
    index = teams.indexOf team
    teams.splice index, 1
    @replaceState teams: teams

  updateTeam: (team, data) ->
    teams = @state.teams
    index = teams.indexOf team
    teams.splice index, 1
    teams[index] = data
    @replaceState teams: teams

  SignOutUser: (user_id) ->
    @setState user_id: 0

  Auth: (user_id) ->
    @setState user_id: user_id

  mainPage: ->
    React.DOM.div
      className: 'col-md-12'
      React.createElement Header, user_id: this.state.user_id,
      handleSignOutUser: @SignOutUser
      React.DOM.div
        className: 'col-md-9'
        React.DOM.h2
          className: 'title'
          'Teams'
        React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th
                className: "th_width_20"
                'Team name'
              React.DOM.th
                className: "th_width_62"
                'Description'
              React.DOM.th
                className: "th_width_12"
                'Manage teammates'
              React.DOM.th
                className: "th_width_18"
                'Actions'
          React.DOM.tbody null,
            for team in @state.teams
              React.createElement Team, key: team.id, team: team,
              user_id: this.state.user_id, handleDeleteTeam: @deleteTeam,
              handleEditTeam: @updateTeam

      React.DOM.div
        className: 'col-md-3'
        React.createElement TeamForm, handleNewTeam: @addTeam,
        user_id: this.state.user_id
       
  signInForm: ->
    React.DOM.div
      className: 'col-md-12'
      className: 'col-md-4 col-md-offset-4'
      React.createElement AuthForm, user_id: this.state.user_id, handleAuth: @Auth

  render: ->
    if @state.user_id == 0
      @signInForm()
    else
      @mainPage()
