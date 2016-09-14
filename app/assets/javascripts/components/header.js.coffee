@Header = React.createClass

  handleSignOut: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/users/sign_out"
      success: () =>
        window.location = "/users/sign_in"

  teammateHeader: ->
    React.DOM.div
      className: 'header_links'
      React.DOM.a
        className: 'link'
        onClick: @handleSignOut
        'Sign out'

  adminMainPgHeader: ->
    React.DOM.div
      className: 'header_links'
      React.DOM.a
        className: 'link'
        onClick: @handleSignOut
        'Sign out'
      React.DOM.a
        className: 'link'
        href: "/users"
        'Manage users'

  adminUsersHeader: ->
    React.DOM.div
      className: 'header_links'
      React.DOM.a
        className: 'link'
        onClick: @handleSignOut
        'Sign out'
      React.DOM.a
        className: 'link'
        href: "/"
        'Main page'

  adminTeamUsersHeader: ->
    React.DOM.div
      className: 'header_links'
      React.DOM.a
        className: 'link'
        onClick: @handleSignOut
        'Sign out'
      React.DOM.a
        className: 'link'
        href: "/"
        'Main page'

  render: ->
    if @props.user_id == 1
      @adminMainPgHeader()
    else if window.location.pathname == "/users"
      @adminUsersHeader()
    else if window.location.pathname.includes("/teams")
      @adminTeamUsersHeader()
    else
      @teammateHeader()
