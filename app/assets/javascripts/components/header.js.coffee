@Header = React.createClass

  handleSignOut: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/users/sign_out"
      success: () =>
        @props.handleSignOutUser @props.user_id = 0

  teammateHeader: ->
    React.DOM.div
      className: 'header_links'
      React.DOM.a
        className: 'link'
        onClick: @handleSignOut
        'Sign out'

  adminHeader: ->
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
        
  render: ->
    if @props.user_id == 1
      @adminHeader()
    else
      @teammateHeader()
