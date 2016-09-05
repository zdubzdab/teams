@Users = React.createClass
  getInitialState: ->
    users: @props.users
    roles: @props.roles

  getDefaultProps: ->
    users: []

  addUser: (user) ->
    users = @state.users.slice()
    users.push user
    @setState users: users

  deleteUser: (user) ->
    users = @state.users.slice()
    index = users.indexOf user
    users.splice index, 1
    @replaceState users: users

  updateUser: (user, data) ->
    users = @state.users
    index = users.indexOf user
    users.splice index, 1
    users[index] = data
    @replaceState users: users

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
        React.DOM.h2
          className: 'title'
          'Users'
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
                'Password'
              React.DOM.th
                className: "th_width_18"
                'Actions'
          React.DOM.tbody null,
            for user in @state.users
              React.createElement User, key: user.id, user: user, handleDeleteUser: @deleteUser, handleEditUser: @updateUser

      React.DOM.div
        className: 'col-md-3'
        React.createElement UserForm, handleNewUser: @addUser, roles: this.state.roles
