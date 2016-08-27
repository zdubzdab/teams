@Teams = React.createClass
  getInitialState: ->
    teams: @props.data

  getDefaultProps: ->
    teams: []

  addTeam: (team) ->
    teams = @state.teams.slice()
    teams.push team
    @setState teams: teams

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
        React.DOM.tbody null,
          for team in @state.teams
            React.createElement Team, key: team.id, team: team
