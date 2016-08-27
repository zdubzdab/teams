@Team = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.team.name
      React.DOM.td null, @props.team.description
