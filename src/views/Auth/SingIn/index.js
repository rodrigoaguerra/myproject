import React, { useState } from 'react';
import Button from '@material-ui/core/Button';
import TextField from '@material-ui/core/TextField';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import Checkbox from '@material-ui/core/Checkbox';
import Link from '@material-ui/core/Link';
import Grid from '@material-ui/core/Grid';
import { RequestSytem, setAuthorization } from 'config';
import useStyles from '../styles';

export default function SingIn(props) {
  const classes = useStyles();

  const [email, setemail] = useState('rodrigoa.guerra@hotmail.com');
  const [password, setpassword] = useState('digo123@');

  const login = (data) => {
    RequestSytem(`${process.env.REACT_APP_HOST}/account/login`, data, function (
      response,
    ) {
      setAuthorization(response);
      props.changeView('dashboard');
    });
  };

  return (
    <form className={classes.form} noValidate>
      <TextField
        variant='outlined'
        margin='normal'
        required
        fullWidth
        id='email'
        label='Email Address'
        name='email'
        value={email}
        onChange={(e) => setemail(e.target.value)}
        autoComplete='email'
        autoFocus
      />
      <TextField
        variant='outlined'
        margin='normal'
        required
        fullWidth
        name='password'
        label='Password'
        type='password'
        id='password'
        value={password}
        onChange={(e) => setpassword(e.target.value)}
        autoComplete='current-password'
      />
      <FormControlLabel
        control={<Checkbox value='remember' color='primary' />}
        label='Remember me'
      />
      <Button
        onClick={() => login({ email, password, action: 'user_login' })}
        fullWidth
        variant='contained'
        color='primary'
        className={classes.submit}
      >
        Sign In
      </Button>
      <Grid container>
        <Grid item xs>
          <Link
            onClick={() => props.changeView('forgotpassword')}
            variant='body2'
          >
            Forgot password?
          </Link>
        </Grid>
        <Grid item>
          <Link onClick={() => props.changeView('singup')} variant='body2'>
            {"Don't have an account? Sign Up"}
          </Link>
        </Grid>
      </Grid>
    </form>
  );
}
