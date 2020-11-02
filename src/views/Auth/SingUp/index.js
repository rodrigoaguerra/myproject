import React, { useState } from 'react';
import Button from '@material-ui/core/Button';
import TextField from '@material-ui/core/TextField';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import Checkbox from '@material-ui/core/Checkbox';
import Link from '@material-ui/core/Link';
import Grid from '@material-ui/core/Grid';
import { RequestSytem } from 'config';
import useStyles from '../styles';

const register = (data) => {
  RequestSytem(`${process.env.REACT_APP_HOST}/account/register`, data);
};

export default function SignUp(props) {
  const classes = useStyles();

  const [firstname, setfirstname] = useState('');
  const [lastname, setlastname] = useState('');
  const [email, setemail] = useState('');
  const [password, setpassword] = useState('');

  return (
    <form className={classes.form} noValidate>
      <Grid container spacing={2}>
        <Grid item xs={12} sm={6}>
          <TextField
            autoComplete='fname'
            name='firstName'
            variant='outlined'
            required
            fullWidth
            id='firstName'
            label='First Name'
            autoFocus
            value={firstname}
            onChange={(e) => setfirstname(e.target.value)}
          />
        </Grid>
        <Grid item xs={12} sm={6}>
          <TextField
            variant='outlined'
            required
            fullWidth
            id='lastName'
            label='Last Name'
            name='lastName'
            autoComplete='lname'
            value={lastname}
            onChange={(e) => setlastname(e.target.value)}
          />
        </Grid>
        <Grid item xs={12}>
          <TextField
            variant='outlined'
            required
            fullWidth
            id='email'
            label='Email Address'
            name='email'
            autoComplete='email'
            value={email}
            onChange={(e) => setemail(e.target.value)}
          />
        </Grid>
        <Grid item xs={12}>
          <TextField
            variant='outlined'
            required
            fullWidth
            name='password'
            label='Password'
            type='password'
            id='password'
            autoComplete='current-password'
            value={password}
            onChange={(e) => setpassword(e.target.value)}
          />
        </Grid>
        <Grid item xs={12}>
          <FormControlLabel
            control={<Checkbox value='allowExtraEmails' color='primary' />}
            label='I want to receive inspiration, marketing promotions and updates via email.'
          />
        </Grid>
      </Grid>
      <Button
        onClick={() =>
          register({
            firstname,
            lastname,
            email,
            password,
            action: 'user_register',
          })
        }
        fullWidth
        variant='contained'
        color='primary'
        className={classes.submit}
      >
        Sign Up
      </Button>
      <Grid container justify='flex-end'>
        <Grid item>
          <Link onClick={() => props.changeView('singin')} variant='body2'>
            Already have an account? Sign in
          </Link>
        </Grid>
      </Grid>
    </form>
  );
}
