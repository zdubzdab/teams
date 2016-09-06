var TeamUserForm = React.createClass({

  handleSubmit: function (e) {
    e.preventDefault();
    var that = this;
    var team_user = {  };
    team_user["team_id"] = this.props.team_users[0].team_id
    team_user["user_id"] = this.state.user_id
    var data = {team_user};
    $.ajax({
      data: data,
      url: '/teams/' + this.props.team_users[0].team_id + '/team_users',
      type: "POST",
      dataType: "JSON",
      beforeSend: function (xhr) {
        var token = $('meta[name="csrf-token"]').attr('content');
        xhr.setRequestHeader('X-CSRF-Token', token);
      },
      success: function ( data ) {
        that.props.handleNewTeamUser (data);
      }
    });
  },

  handleChange: function (e) {
    this.setState ({user_id: e.target.value});
  },

  render: function () {
    return (
      <form className="team_user_form" acceptCharset="UTF-8" onSubmit={ this.handleSubmit }>
        <h3>Add new teammate</h3>
        <input value={$('meta[name="csrf-token"]').attr('content')} type="hidden"
        name={$('meta[name="csrf-param"]').attr('content')} className='form-control'/>
        <select className="form-control" onChange={this.handleChange}>
            {
                this.props.users.map(function (item, i) {
                    return <option key={i} value={item.id }>{item.name}</option>;
                })
            }
        </select>
        <p><button type="submit" className="btn btn-primary">Add teammate</button></p>
      </form>
    );
  }
});
