@Teams = React.createClass
  getInitialState: ->
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
    teams.splice index, 1
    teams[index] = data
    @replaceState teams: teams

  render: ->
    React.DOM.div
      className: 'team_index'
      React.createElement TeamForm, handleNewTeam: @addTeam
      React.DOM.hr null
      React.DOM.h2
        className: 'title'
        'Teams'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Team name'
            React.DOM.th null, 'Description'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for team in @state.teams
            React.createElement Team, key: team.id, team: team, handleDeleteTeam: @deleteTeam, handleEditTeam: @updateTeam
