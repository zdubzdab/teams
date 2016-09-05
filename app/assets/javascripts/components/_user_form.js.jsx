var UserForm = React.createClass({

  getInitialState: function() {
    return { name: '',
             email: '',
             password: '' };
  },

  handleSubmit: function (e) {
    e.preventDefault();
    var that = this;
    var data = {  };
    data[ "user" ] = this.state;
    $.ajax({
      data: data,
      url: '/users/',
      type: "POST",
      dataType: "JSON",
      success: function ( data ) {
        console.log (data)
        that.setState({name: '', email: '', password: ''});
        that.props.handleNewUser (data);
      },
      error: function ( data ) {
        alert ("User name email and password cann't be blank")
      }
    });
  },

  handleChangeName: function (e) {
    this.setState ({name: e.target.value});
  },

  handleChangeEmail: function (e) {
    this.setState ({email: e.target.value});
  },

  handleChangePassword: function (e) {
    this.setState ({password: e.target.value});
  },

  handleChangeRole: function (e) {
    this.setState ({role_id: e.target.value});
  },

  render: function () {
    return (
      <form className="user_form" acceptCharset="UTF-8" onSubmit={ this.handleSubmit }>
        <h3>User creation</h3>
        <p><input value={this.state.name} type="text" name="name" placeholder="Name"
            className='form-control' onChange={this.handleChangeName}/></p>
        <p><input value={this.state.email} type="text" name="email" placeholder="Email"
            className='form-control' onChange={this.handleChangeEmail}/></p>
        <p><input value={this.state.password} type="password" name="password"
            placeholder="Password" className='form-control'
            onChange={this.handleChangePassword}/></p>
        <select className="form-control" onChange={this.handleChangeRole}>
            {
                this.props.roles.map(function (item, i) {
                    return <option key={i} value={item.id }>{item.name}</option>;
                })
            }
        </select>
        <p><button type="submit" className="btn btn-primary">Create team</button></p>
      </form>
    );
  }
});
